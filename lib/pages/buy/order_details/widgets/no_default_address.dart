import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

class NoDefaultAddress extends StatelessWidget {
  const NoDefaultAddress({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.bus_alert,
            color: Colors.red,
            size: 30,
          ),
          SizedBox(height: 10),
          NepekText(
            'You have not selected default delivery address',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          )
        ],
      ),
    );
  }
}
