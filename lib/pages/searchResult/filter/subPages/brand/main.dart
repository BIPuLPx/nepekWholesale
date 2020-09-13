import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/searchResult/filter/styles/appBar.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/extensions.dart';
import 'package:skite_buyer/styles/font_styles.dart';

class FilterBrandsPage extends StatefulWidget {
  final args;
  FilterBrandsPage({this.args});

  @override
  _FilterBrandsPageState createState() => _FilterBrandsPageState();
}

class _FilterBrandsPageState extends State<FilterBrandsPage> {
  List currentBrands;
  List allBrands;

  void clicked(String val, bool keep) {
    setState(() {
      if (keep == true) {
        currentBrands.add(val);
      } else {
        currentBrands.remove(val);
        currentBrands.join(', ');
      }
    });
  }

  @override
  void initState() {
    setState(() {
      currentBrands = [...widget.args['currentBrands']];
      allBrands = [...widget.args['brands']];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(args);

    return Scaffold(
      appBar: filterAppBar(context),
      body: SafeArea(
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: allBrands
              .map<Widget>(
                (val) => CheckboxListTile(
                  title: Text(
                    capitalize(val),
                    style: AppFontStyle().subFilters(),
                  ),
                  value: currentBrands.contains(val),
                  onChanged: (bool value) {
                    clicked(val, value);
                  },
                  activeColor: AppColors().primaryBlue(),
                ),
              )
              .toList(),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: FlatButton(
            color: AppColors().primaryBlue(),
            onPressed: () {
              widget.args['setBrand'](currentBrands);
              Navigator.pop(context);
            },
            child: Text(
              'Apply',
              style: AppFontStyle().button(Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
