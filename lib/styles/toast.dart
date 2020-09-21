import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/styles/colors.dart';

showToast(BuildContext context) {
  FToast fToast;
  fToast = FToast();
  fToast.init(context);

  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: AppColors().primaryBlue(),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check, color: Colors.white),
        SizedBox(
          width: 15.0,
        ),
        Text(
          "This is a Custom Toast",
          style: GoogleFonts.openSans(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: Duration(seconds: 1),
  );

  // // Custom Toast Position
  // fToast.showToast(
  //     child: toast,
  //     toastDuration: Duration(seconds: 2),
  //     positionedToastBuilder: (context, child) {
  //       return Positioned(
  //         child: child,
  //         top: 16.0,
  //         left: 16.0,
  //       );
  //     });
}
