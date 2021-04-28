import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/products/result/provider/main.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/iconsClass/result_page_icons_icons.dart';

import 'appBar.dart';
import 'widgets/grid_view.dart';
import 'widgets/list_view.dart';

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
              delegate: SliverChildListDelegate([
            Container(height: 10),
          ])),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: listType == 'grid' ? 2 : 1,
              childAspectRatio: (itemWidth / height * 1.01),
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
          SliverList(
            delegate: SliverChildListDelegate(
              [result.loadingMore, SizedBox(height: 100)],
            ),
          )
        ],
      ),
    );
  }
}
