import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/searchResult/filter/styles/appBar.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/extensions.dart';
import 'package:skite_buyer/styles/font_styles.dart';

class FilterOptionsPage extends StatefulWidget {
  final args;
  FilterOptionsPage({this.args});

  @override
  _FilterOptionsPageState createState() => _FilterOptionsPageState();
}

class _FilterOptionsPageState extends State<FilterOptionsPage> {
  List currentOptions;
  List allOptions;
  String optionName;

  void clicked(String val, bool keep) {
    setState(() {
      if (keep == true) {
        currentOptions.add(val);
      } else {
        currentOptions.remove(val);
        currentOptions.join(', ');
      }
    });
  }

  @override
  void initState() {
    setState(() {
      currentOptions = [...widget.args['args']['currentValues']];
      optionName = widget.args['args']['name'];
      allOptions = [...widget.args['args']['values']];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: filterAppBar(context),
      body: SafeArea(
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: allOptions
              .map<Widget>(
                (val) => CheckboxListTile(
                  title: Text(
                    capitalize(val),
                    style: AppFontStyle().subFilters(),
                  ),
                  value: currentOptions.contains(val),
                  // value: false,
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
              widget.args['args']['setOptions'](optionName, currentOptions);
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
