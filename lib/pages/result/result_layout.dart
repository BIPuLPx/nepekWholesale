import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skite_buyer/iconsClass/result_page_icons_icons.dart';
// import 'package:skite_buyer/savedData/apis.dart';
import 'package:skite_buyer/styles/appBars/result.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ResultLayout extends StatefulWidget {
  final List products;
  final String searchText;

  ResultLayout({this.products, this.searchText});

  @override
  _ResultLayoutState createState() => _ResultLayoutState();
}

class _ResultLayoutState extends State<ResultLayout> {
  Widget body;
  double height;
  IconData current = ResultPageIcons.listview;
  String listType = 'grid';
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

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          resultAppBar(context, changeListType, current, widget.searchText,
              widget.products.length),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: listType == 'grid' ? 2 : 1,
              childAspectRatio: (itemWidth / height),
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (listType == 'grid') {
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
                              placeholder: (context, url) => Container(
                                  height: 120,
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            SizedBox(height: 10),
                            Text(widget.products[index]['productName']
                                .toString()),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text('NPR ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800)),
                                Text(
                                    widget.products[index]['price'].toString()),
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
                              starCount: widget.products[index]['rating'] == 0
                                  ? 5
                                  : widget.products[index]['rating'],
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
                } else {
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
                              placeholder: (context, url) => Container(
                                  height: 120,
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text(widget.products[index]['productName']
                                    .toString()),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text('NPR ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800)),
                                    Text(widget.products[index]['price']
                                        .toString()),
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
                              starCount: widget.products[index]['rating'] == 0
                                  ? 5
                                  : widget.products[index]['rating'],
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
              },
              childCount: widget.products.length,
            ),
          )
        ],
      ),
    );
  }
}
