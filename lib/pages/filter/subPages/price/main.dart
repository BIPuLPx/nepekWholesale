import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/filter/styles/appBar.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:skite_buyer/styles/font_styles.dart';

class FilterPricePage extends StatefulWidget {
  final args;
  FilterPricePage({this.args});

  @override
  _FilterPricePageState createState() => _FilterPricePageState();
}

class _FilterPricePageState extends State<FilterPricePage> {
  Map price = {
    'min': '',
    'max': '',
  };

  void priceChanged(type, val) {
    setState(() {
      if (type == 'Min') {
        price['min'] = val;
      } else {
        price['max'] = val;
      }
    });
  }

  @override
  void initState() {
    // final args = widget.args;
    // if (args['queryFilter'] == null) {
    _fromfetchedFilter();
    // }
    super.initState();
  }

  void _fromfetchedFilter() {
    price['min'] = widget.args['fetchedFilter']['min'].toString();
    price['max'] = widget.args['fetchedFilter']['max'].toString();
  }

  @override
  Widget build(BuildContext context) {
    final bool darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final Color buttonColor =
        darktheme ? Colors.white : AppColors().primaryBlue();
    final Color buttonTextColor = darktheme ? Colors.black : Colors.white;
    print(widget.args);
    return Scaffold(
      appBar: filterAppBar(context),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InputPrice(
                label: 'Min',
                autofocus: true,
                changeFn: priceChanged,
                initialValue: price['min'],
              ),
              InputPrice(
                label: 'Max',
                autofocus: false,
                changeFn: priceChanged,
                initialValue: price['max'],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: BottomAppBar(
        child: SizedBox(
          height: 42,
          // width: double.infinity,
          child: FlatButton(
            color: buttonColor,
            onPressed: () {
              widget.args['changeFn'](price);
              Navigator.pop(context);
            },
            child: Text(
              'Apply',
              style:GoogleFonts.cabin(color:buttonTextColor,fontWeight: FontWeight.w600,
              )
            ),
          ),
        ),
      ),
    );
  }
}

class InputPrice extends StatelessWidget {
  final String initialValue;
  final String label;
  final bool autofocus;
  final Function changeFn;
  InputPrice({this.initialValue, this.label, this.autofocus, this.changeFn});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: GoogleFonts.cabin(fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: 110,
          // height: 30,
          child: TextFormField(
            style: GoogleFonts.cabin(),
            initialValue: initialValue,
            onChanged: (value) {
              changeFn(label, value);
            },
            decoration: InputDecoration(
              // focusedBorder: OutlineInputBorder(
              //   borderSide:
              //       BorderSide(color: AppColors().primaryBlue(), width: 1.0),
              // ),
              // enabledBorder: OutlineInputBorder(
              //   borderSide:
              //       BorderSide(color: AppColors().primaryGray(), width: 1.0),
              // ),
              hintText: 'NPR',
              isDense: true,
              contentPadding: EdgeInsets.all(10),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            // autofocus: autofocus,
          ),
        ),
      ],
    );
  }
}
