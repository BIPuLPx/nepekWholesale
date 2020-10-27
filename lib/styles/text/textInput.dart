import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';

class TextInput extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final Function onChanged;
  final Function validator;
  const TextInput(
      {Key key,
      this.labelText,
      this.obscureText,
      this.onChanged,
      this.validator})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isdark = Provider.of<DarkThemeProvider>(context).darkTheme;

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 15),
      color: isdark ? Colors.grey[800] : Colors.grey[200],
      child: TextFormField(
        autocorrect: false,
        validator: validator ?? null,
        onChanged: (val) => onChanged(val),
        obscureText: obscureText ?? false,
        style: GoogleFonts.nunitoSans(),
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }
}
