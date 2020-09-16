import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/home/tabs/cart/cart_state.dart';
import 'package:skite_buyer/styles/colors.dart';
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
  final List totalQty;
  final int index;
  QtySelector({this.qty, this.totalQty, this.index});

  @override
  _QtySelectorState createState() => _QtySelectorState();
}

class _QtySelectorState extends State<QtySelector> {
  String dropdownValue;
  List<String> qtys;
  @override
  void initState() {
    setState(() {
      dropdownValue = widget.qty;
      qtys = widget.totalQty;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final cart = Provider.of<CartState>(context);
    return Row(
      children: [
        Text(
          'QTY',
          style: AppFontStyle().button(AppColors().primaryText()),
        ),
        SizedBox(width: 10),
        Container(
          height: 30,
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
                items: qtys.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    onTap: () => cart.changeQty(widget.index, value),
                    child: Center(child: Text(value)),
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
    return FlatButton(
      onPressed: () {
        cart.deleteItem(index);
      },
      child: Row(
        children: [
          Icon(
            Icons.delete,
            size: 17,
            color: AppColors().secondaryText(),
          ),
          SizedBox(width: 5),
          Text(
            'Remove',
            style: TextStyle(
              color: AppColors().secondaryText(),
            ),
          ),
        ],
      ),
    );
  }
}
