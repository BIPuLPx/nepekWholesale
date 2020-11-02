import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/viewProduct/view_product_state.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';

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
      height: 46,
      width: width * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: darkTheme ? Colors.grey[800] : Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors().primaryBlue(),
            spreadRadius: 0.2,
            blurRadius: 2,
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            style: GoogleFonts.nunitoSans(
                color: darkTheme ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600),
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
