import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/styles/extensions.dart';

changeTheme(BuildContext context, darkTheme, Function isDarkTheme) {
  Widget darkLightSwitcher(String label, bool forDark) => Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: darkTheme ? Colors.white : Colors.black, width: 2),
        ),
        // margin: EdgeInsets.only(left: 30, right: 30),
        child: Material(
          color: forDark ? Colors.black : Colors.white,
          child: InkWell(
            onTap: () {
              isDarkTheme(forDark);
              Navigator.of(context).pop();
            },
            child: Container(
              height: 50,
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.settings_brightness,
                    color: forDark ? Colors.white : Colors.black,
                    size: 20,
                  ),
                  Text(
                    capitalize(label),
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: forDark ? Colors.white : Colors.black,
                    ),
                  ),
                  forDark == darkTheme
                      ? Icon(
                          // Icons.settings_brightness,
                          Icons.done,
                          color: forDark ? Colors.white : Colors.black,
                          size: 20,
                        )
                      : Icon(
                          // Icons.settings_brightness,
                          Icons.done,
                          color: forDark ? Colors.black : Colors.white,
                          size: 20,
                        )
                ],
              ),
            ),
          ),
        ),
      );

  return showModalBottomSheet<void>(
    context: context,
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
          children: <Widget>[
            darkLightSwitcher('Dark', true),
            SizedBox(height: 20),
            darkLightSwitcher('Light', false),
          ],
        ),
      );
    },
  );
}
