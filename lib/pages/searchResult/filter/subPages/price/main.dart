import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/pages/searchResult/filter/styles/appBar.dart';
import 'package:skite_buyer/styles/colors.dart';
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
  Widget build(BuildContext context) {
    // print(widget.args);
    return Scaffold(
      appBar: filterAppBar(context),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InputPrice(label: 'Min', autofocus: true, changeFn: priceChanged),
              InputPrice(
                  label: 'Max', autofocus: false, changeFn: priceChanged),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: FlatButton(
            color: AppColors().primaryBlue(),
            onPressed: () {
              widget.args['changeFn'](price);
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

class InputPrice extends StatelessWidget {
  final String label;
  final bool autofocus;
  final Function changeFn;
  InputPrice({this.label, this.autofocus, this.changeFn});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: GoogleFonts.openSans(fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: 110,
          // height: 30,
          child: TextField(
            onChanged: (value) {
              changeFn(label, value);
            },
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors().primaryBlue(), width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors().primaryGray(), width: 1.0),
              ),
              hintText: 'NPR',
              isDense: true,
              contentPadding: EdgeInsets.all(10),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            autofocus: autofocus,
          ),
        ),
      ],
    );
  }
}
