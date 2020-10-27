import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/iconsClass/result_page_icons_icons.dart';
import 'package:skite_buyer/pages/result/resultLayout/appBar.dart';
import 'package:skite_buyer/pages/result/resultLayout/widgets/grid_view.dart';
import 'package:skite_buyer/pages/result/resultLayout/widgets/list_view.dart';
import 'package:skite_buyer/pages/result/provider/main.dart';

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
    final double itemHeightGrid = (size.height - kToolbarHeight - 24) / 1.76;
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
      body: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        controller: _scrollController,
        slivers: <Widget>[
          ResultAppBar(
            resultContext: context,
            changeLayout: changeListType,
            currentIcon: current,
            searchText: result.searchText,
            itemLength: result.productsNo,
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: listType == 'grid' ? 2 : 1,
              childAspectRatio: (itemWidth / height),
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
              [result.loadingMore],
            ),
          )
        ],
      ),
    );
  }
}
