import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';

class AddProductResetBtn extends StatelessWidget {
  final Function onPressed;

  const AddProductResetBtn({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.3;
    return BottomAppBar(
      elevation: 2,
      child: SizedBox(
        height: 50,
        width: width,
        // width: double.infinity,
        child: TextButton(
          // color: buttonColor,
          onPressed: () => onPressed(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reset',
                style: GoogleFonts.poppins(
                  color: AppColors.officialMatch,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.close,
                // size: 18,
                color: AppColors.officialMatch,
              )
            ],
          ),
        ),
      ),
    );
  }
}
