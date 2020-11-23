import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';

sucessToast(BuildContext context, String message) {
  FToast fToast;
  fToast = FToast();
  fToast.init(context);

  Widget _message = Container(
    margin: EdgeInsets.only(left: 15),
    child: Text(
      message,
      style: GoogleFonts.poppins(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  Widget toast = Container(
    margin: EdgeInsets.only(bottom: 15),
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: AppColors().officialMatch(),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.check,
          color: Colors.white,
          size: 17,
        ),
        // Expanded(
        //  child:

        message.length > 25
            ? Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: _message,
                ),
              )
            : _message,
        // )
      ],
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: Duration(seconds: 2),
  );

  // // Custom Toast Position
  // fToast.sucessToast(
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
