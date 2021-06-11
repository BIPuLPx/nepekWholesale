import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/my/address_book/provider.dart';
import 'package:nepek_buyer/pages/my/address_book/widgets/changeDefault.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/button/nepek_button_icon.dart';
import 'package:provider/provider.dart';

class FloatingActions extends StatelessWidget {
  const FloatingActions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddressBookProvider provider = Provider.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        provider.deliveryAddresses.length < 3
            ? NepekButton(
                onClick: () => Navigator.pushNamed(
                    context, 'input_delivery_address',
                    arguments: {'type': 'new', 'refresh': provider.refresh}),
                icon: NepekButtonIcon(Icons.add),
                label: 'Add New',
              )
            : SizedBox(),
        provider.deliveryAddresses.length > 1
            ? Container(
                margin: EdgeInsets.only(left: 15),
                child: NepekButton(
                  onClick: () => changeDefault(context, provider),
                  icon: NepekButtonIcon(Icons.edit, reversed: true),
                  label: 'Change Default',
                  reverse: true,
                ),
              )
            : SizedBox()
      ],
    );
  }
}
