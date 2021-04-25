import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

import '../../view_product_state.dart';

class QtySelector extends StatefulWidget {
  QtySelector({Key key}) : super(key: key);

  @override
  _QtySelectorState createState() => _QtySelectorState();
}

class _QtySelectorState extends State<QtySelector> {
  String dropdownValue = '1';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final product = Provider.of<ViewProductState>(context);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Container(
      height: 35,
      width: width * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: darkTheme ? Colors.grey[800] : Colors.white,
        border: Border.all(
          width: 1,
          color: AppColors().officialMatch(),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            style: GoogleFonts.poppins(
              color: darkTheme ? Colors.white : Colors.black,
              fontSize: 14,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items:
                product.totalQty.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                onTap: () => product.changeQty(value),
                child: Center(child: Text(value)),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
