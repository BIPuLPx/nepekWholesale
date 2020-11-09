import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/pages/search/search_provider.dart';

class AutoCompletes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final autocompletes = Provider.of<SearchState>(context).autoCompletes;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: autocompletes
          .map(
            (autocomplete) => AutocompleteText(
              text: autocomplete['text'],
            ),
          )
          .toList(),
    );
  }
}

class AutocompleteText extends StatelessWidget {
  final String text;
  AutocompleteText({this.text});
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
