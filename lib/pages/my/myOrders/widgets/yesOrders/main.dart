import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/styles/text/format_date.dart';
import 'package:nepek_buyer/styles/text/left_right_data.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:nepek_buyer/styles/text/trimName.dart';
import 'package:provider/provider.dart';

import '../../my_orders_provider.dart';
import 'widgets/order_product.dart';

class MyOrdersLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyOrdersProvider provider = Provider.of(context);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    // print(provider.allOrders);
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
            SizedBox(height: 15),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(15),
              child: NepekText(
                'Click order to see full details',
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
            SizedBox(height: 15),
          ] +
          provider.allOrders
              .map<Widget>((order) => OrderProduct(
                    darkTheme: darkTheme,
                    order: order,
                  ))
              .toList(),
    );
  }

  _statusDates(String type, String ddate) {
    return ddate == null ? Container() : leftRightData(type, formatDate(ddate));
  }

  TextStyle _heading() => GoogleFonts.poppins(fontWeight: FontWeight.w700);
}
