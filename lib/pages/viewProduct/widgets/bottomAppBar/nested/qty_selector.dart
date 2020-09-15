import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/viewProduct/view_product_state.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/font_styles.dart';

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
    return Container(
      height: 46,
      width: width * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white,
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
            style: AppFontStyle().button(AppColors().primaryText()),
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
