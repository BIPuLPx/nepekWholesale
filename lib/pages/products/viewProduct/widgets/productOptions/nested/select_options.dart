import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/products/viewProduct/view_product_state.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/styles/extensions.dart';

class SelectOptions extends StatelessWidget {
  final String title;
  final List options;

  SelectOptions({
    this.title,
    this.options,
  });

  @override
  Widget build(BuildContext context) {
    final ViewProductState provider = Provider.of(context);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final Color primaryColor =
        darkTheme ? Colors.white : AppColors.officialMatch;

    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            capitalize(title),
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 5),
          Wrap(
            children: options
                .map(
                  (e) => CustomRadio(
                    txt: e['label'],
                    primaryColor: primaryColor,
                    enabled: provider.activeOptions.contains(e['label']),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class CustomRadio extends StatelessWidget {
  const CustomRadio({
    Key key,
    @required this.txt,
    @required this.primaryColor,
    @required this.enabled,
  }) : super(key: key);

  final String txt;
  final Color primaryColor;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final ViewProductState provider = Provider.of(context);
    bool selected = provider.selectedOption.contains(txt);
    final Color buttonColor = enabled
        ? selected
            ? primaryColor
            : Colors.grey
        : Colors.grey.withOpacity(0.4);
    optChanged(String txt, bool keep) => provider.changeOption(txt, !keep);

    return Container(
      margin: EdgeInsets.only(left: 2, right: 2),
      child: OutlinedButton(
        onPressed: enabled ? () => optChanged(txt, selected) : null,
        style: TextButton.styleFrom(
          primary: AppColors.officialMatchShadow,
          side: BorderSide(width: 1.2, color: buttonColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          shadowColor: Colors.grey,
        ),
        child: NepekText(
          capitalize(txt),
          fontSize: 13,
          color: buttonColor,
        ),
      ),
    );
  }
}
