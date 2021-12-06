import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/products/result/provider/main.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:provider/provider.dart';
import 'appBar.dart';
import 'widgets/grid_view.dart';
import 'widgets/list_view.dart';
import 'widgets/top_part/main.dart';

class ResultLayout extends StatefulWidget {
  @override
  _ResultLayoutState createState() => _ResultLayoutState();
}

class _ResultLayoutState extends State<ResultLayout> {
  Widget body;
  String current = 'assets/product/listview.png';
  String listType = 'grid';
  bool showTop = false;

  ScrollController _scrollController = new ScrollController();
  void changeListType() {
    setState(() {
      if (listType == 'list') {
        listType = 'grid';
        current = 'assets/product/listview.png';
      } else {
        listType = 'list';
        current = 'assets/product/gridview.png';
      }
    });
  }

  void _slideToTop() {
    final currentScroll = _scrollController.position.pixels;

    setState(() {
      if (currentScroll > 1000)
        showTop = true;
      else
        showTop = false;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_slideToTop);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final result = Provider.of<ResultState>(context);
    var size = MediaQuery.of(context).size;
    final double itemHeightList = (size.height) / 9;
    final double itemHeightGrid = (size.height) / 2.05;
    final double itemWidth = size.width / 2;
    // final currentScroll = _scrollController.position.pixels;

    void _onScroll() {
      final _scrollThreshold = 500;
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;

      if (maxScroll - currentScroll <= _scrollThreshold) {
        _scrollController.removeListener(_onScroll);
        if (result.isNextPage == true) {
          result.infiniteScroll(result.nextPage);
        }
      }
    }

    _scrollController.addListener(_onScroll);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        // physics: BouncingScrollPhysics(),
        controller: _scrollController,
        slivers: <Widget>[
          ResultAppBar(
            resultContext: context,
            changeLayout: changeListType,
            currentIcon: current,
            searchText: result.searchText,
            itemLength: result.productsNo,
          ),
          // SizedBox(height: 10),
          //
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(height: 10),
                result.classifiedList.length > 0
                    ? ClassificationWrapper()
                    : Container(),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: listType == 'grid' ? 2 : 1,
                childAspectRatio: (itemWidth /
                    (listType == 'grid' ? itemHeightGrid : itemHeightList)),
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (listType == 'grid') {
                    return GridLayout(index: index, result: result);
                  } else {
                    return ListLayout(index: index, result: result);
                  }
                },
                childCount: result.products.length,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                result.isNextPage ? result.loadingMore : SizedBox(),
                SizedBox(height: 100),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: !showTop
          ? Container()
          : SlideToTop(
              onTap: () => _scrollController.animateTo(
                0,
                duration: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
              ),
            ),
    );
  }
}

class SlideToTop extends StatelessWidget {
  final Function onTap;
  const SlideToTop({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.officialMatchShadow,
            spreadRadius: 1,
            blurRadius: 10,
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_upward_rounded,
                  color: AppColors.officialMatch,
                ),
                NepekText(
                  'Top',
                  color: AppColors.officialMatch,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
