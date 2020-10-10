import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class HistoryText extends StatelessWidget {
  final String text;
  HistoryText({this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final search = Hive.box('search');
        if (!search.values.toList().contains(text)) {
          search.add(text);
        }
        Navigator.pushReplacementNamed(context, 'result',
            arguments: {'type': 'search', 'query': text});
      },
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: GoogleFonts.roboto(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              Icons.search,
              size: 17,
            ),
          ],
        ),
      ),
    );
  }
}
