import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/filter/styles/appBar.dart';
import 'package:skite_buyer/pages/filter/styles/apply_spinkit.dart';
import 'package:skite_buyer/pages/filter/subPages/specifications/specifications_provider.dart';

import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:skite_buyer/styles/extensions.dart';

class FilterSpecificationsPage extends StatelessWidget {
  final args;
  const FilterSpecificationsPage({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpecificationsProvider(),
      child: FilterSpecificationsRoot(args: args),
    );
  }
}

class FilterSpecificationsRoot extends StatelessWidget {
  final args;
  const FilterSpecificationsRoot({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SpecificationsProvider>(context);
    if (provider.initInject == false) {
      provider.args = args;
      provider.currentOptions = [...args['queryFilter']];
      provider.optionName = args['fetchedFilter']['name'];
      provider.allOptions = [...args['fetchedFilter']['values']];
      provider.initInject = true;
    }
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final buttonColor = darkTheme ? Colors.white : AppColors().primaryBlue();
    final buttonTextColor = darkTheme ? Colors.black : Colors.white;
    // print(args);
    return Scaffold(
      appBar: filterAppBar(context),
      body: Container(
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: provider.allOptions
              .map<Widget>(
                (val) => CheckboxListTile(
                  title: _checkBoxTexts(val, provider),
                  value: provider.allOptions.length > 1
                      ? provider.currentOptions.contains(val['value'])
                      : true,
                  // value: false,
                  onChanged: (bool value) {
                    provider.clicked(val, value);
                    // print(provider.currentOptions);
                  },
                  activeColor: buttonColor,
                  checkColor: buttonTextColor,
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
            color: buttonColor,
            onPressed: () {
              provider.apply(context);
              // widget.args['args']['setOptions'](optionName, currentOptions);
              // Navigator.pop(context);
            },
            child: provider.isSending
                ? applySpinKit(buttonTextColor)
                : applyText(buttonTextColor),
          ),
        ),
      ),
    );
  }

  Row _checkBoxTexts(val, provider) {
    _labelStyle() => GoogleFonts.nunitoSans(
        fontWeight: provider.currentOptions.contains(val['value'])
            ? FontWeight.w800
            : FontWeight.w400,
        fontSize: 14.2);
    return Row(
      children: [
        Text(capitalize(val['value']),
            // 'sds',
            style: _labelStyle()),
        SizedBox(width: 15),
        Text(capitalize('(${val['count'].toString()})'),
            // 'sds',
            style: _labelStyle()),
      ],
    );
  }
}
