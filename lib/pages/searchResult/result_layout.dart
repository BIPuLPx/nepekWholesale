import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/iconsClass/result_page_icons_icons.dart';
import 'package:skite_buyer/pages/searchResult/result_state.dart';
import 'package:skite_buyer/pages/searchResult/styles/appBar.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ResultLayout extends StatefulWidget {
  @override
  _ResultLayoutState createState() => _ResultLayoutState();
}

class _ResultLayoutState extends State<ResultLayout> {
  Widget body;
  double height;
  IconData current = ResultPageIcons.listview;
  String listType = 'grid';

  ScrollController _scrollController = new ScrollController();
  void changeListType() {
    setState(() {
      if (listType == 'list') {
        listType = 'grid';
        current = ResultPageIcons.listview;
      } else {
        listType = 'list';
        current = ResultPageIcons.gridview;
      }
    });
  }

  // @override
  // void initState() {

  //   super.initState();
  // }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final result = Provider.of<ResultState>(context);
    var size = MediaQuery.of(context).size;
    final double itemHeightList = (size.height - kToolbarHeight - 24) / 7;
    final double itemHeightGrid = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    setState(() {
      if (listType == 'list') {
        height = itemHeightList;
      } else {
        height = itemHeightGrid;
      }
    });

    void _onScroll() {
      final _scrollThreshold = 40;
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      if (maxScroll - currentScroll <= _scrollThreshold) {
        _scrollController.removeListener(_onScroll);
        result.fetchSearch(result.nextPage);
      }
    }

    _scrollController.addListener(_onScroll);

    Map filterPageProps = <String, Map>{
      'filterBy': result.filterBy,
      'filterOptions': result.filterOptions
    };

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        controller: _scrollController,
        slivers: <Widget>[
          resultAppBar(context, changeListType, current, result.searchText,
              result.productsNo, result.setSort, filterPageProps),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: listType == 'grid' ? 2 : 1,
              childAspectRatio: (itemWidth / height),
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (listType == 'grid') {
                  return gridLayout(index, result);
                } else {
                  return listLayout(index, result);
                }
              },
              childCount: result.products.length,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [result.loadingMore],
            ),
          )
        ],
      ),
    );
  }

  Card listLayout(int index, result) {
    return Card(
      child: GridTile(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl:
                    // '$productApi/images/${widget.products[index]['uid']}/${widget.products[index]['miniThumb']}',
                    'http://rachelwojo.com/wp-content/uploads/2015/05/nature-square.jpg',
                placeholder: (context, url) =>
                    Container(height: 120, child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(result.products[index]['productName'].toString()),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('NPR ',
                          style: TextStyle(fontWeight: FontWeight.w800)),
                      Text(result.products[index]['price'].toString()),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        footer: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SmoothStarRating(
                starCount: result.products[index]['rating'] == 0
                    ? 5
                    : result.products[index]['rating'],
                rating: 5,
                size: 18,
                isReadOnly: true,
                color: Colors.yellow[800],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card gridLayout(int index, result) {
    return Card(
      child: GridTile(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl:
                    // '$productApi/images/${widget.products[index]['uid']}/${widget.products[index]['miniThumb']}',
                    'http://rachelwojo.com/wp-content/uploads/2015/05/nature-square.jpg',
                placeholder: (context, url) =>
                    Container(height: 120, child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              SizedBox(height: 10),
              Text(result.products[index]['productName'].toString()),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('NPR ', style: TextStyle(fontWeight: FontWeight.w800)),
                  Text(result.products[index]['price'].toString()),
                ],
              ),
            ],
          ), //just for testing, will fill with image later
        ),
        footer: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              SmoothStarRating(
                starCount: result.products[index]['rating'] == 0
                    ? 5
                    : result.products[index]['rating'],
                rating: 5,
                size: 18,
                isReadOnly: true,
                color: Colors.yellow[800],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
