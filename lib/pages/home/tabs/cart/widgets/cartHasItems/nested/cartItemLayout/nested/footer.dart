import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/home/tabs/cart/cart_state.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:skite_buyer/styles/font_styles.dart';

class CartItemFooter extends StatelessWidget {
  final String quantity;
  final List totalQty;
  final int index;
  CartItemFooter({this.quantity, this.totalQty, this.index});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        QtySelector(qty: quantity, totalQty: totalQty, index: index),
        RemoveButton(index: index),
      ],
    );
  }
}

class QtySelector extends StatefulWidget {
  final String qty;
  final List<String> totalQty;
  final int index;
  QtySelector({this.qty, this.totalQty, this.index});

  @override
  _QtySelectorState createState() => _QtySelectorState();
}

class _QtySelectorState extends State<QtySelector> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final cart = Provider.of<CartState>(context);
    final bool darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Row(
      children: [
        Text(
          'QTY',
          style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 10),
        Container(
          height: 30,
          width: width * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: darktheme ? Colors.grey[800] : Colors.white,
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
                value: widget.qty,
                style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w600),
                onChanged: (String newValue) {
                  cart.changeQty(widget.index, newValue);
                },
                items: widget.totalQty
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Center(
                      child: Text(
                        value,
                        style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w600,
                          color: darktheme ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RemoveButton extends StatelessWidget {
  final int index;
  RemoveButton({this.index});
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartState>(context);
    final darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return FlatButton(
      onPressed: () {
        cart.deleteItem(index);
      },
      child: Row(
        children: [
          Icon(Icons.delete,
              size: 17, color: darktheme ? Colors.white54 : Colors.black54
              // color: AppColors().secondaryText(),
              ),
          SizedBox(width: 5),
          Text(
            'Remove',
            style: GoogleFonts.nunitoSans(
                color: darktheme ? Colors.white54 : Colors.black54
                // color: AppColors().secondaryText(),
                ),
          ),
        ],
      ),
    );
  }
}
