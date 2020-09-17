import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class CurrentSearch extends StatelessWidget {
  final String val;
  CurrentSearch({this.val});
  @override
  Widget build(BuildContext context) {
    return SearchText(text: val);
  }
}

class SearchText extends StatelessWidget {
  final String text;
  SearchText({this.text});
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
        padding: EdgeInsets.all(12.0),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Find items for $text',
              style: GoogleFonts.roboto(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              size: 17,
            ),
          ],
        ),
      ),
    );
  }
}
