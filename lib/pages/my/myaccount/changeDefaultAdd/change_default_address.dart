import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/pages/account/account_provider.dart';

changeDefaultAddress(BuildContext mycontext) {
  final AccountState provider = Provider.of(mycontext, listen: false);

  return showModalBottomSheet<void>(
    context: mycontext,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: provider.deliveryAddresses
              .map(
                (add) => Material(
                  child: InkWell(
                    onTap: () => provider.changeDefaultDeliveryAddress(
                      mycontext,
                      add["_id"],
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        add['label'],
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight:
                              provider.defaultDeliveryAddress == add['_id']
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      );
    },
  );
}
