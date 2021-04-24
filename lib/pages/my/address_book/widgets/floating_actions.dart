import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/my/address_book/widgets/changeDefault.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/button/nepek_button_icon.dart';

class FloatingActions extends StatelessWidget {
  const FloatingActions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        NepekButton(
          onClick: () => Navigator.pushNamed(context, 'input_delivery_address'),
          icon: NepekButtonIcon(Icons.add),
          label: 'Add New',
        ),
        SizedBox(width: 15),
        NepekButton(
          onClick: () => changeDefault(context),
          icon: NepekButtonIcon(Icons.edit, reversed: true),
          label: 'Change Default',
          reverse: true,
        )
      ],
    );
  }
}
