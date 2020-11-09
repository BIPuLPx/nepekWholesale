import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/styles/extensions.dart';

class SelectOptions extends StatefulWidget {
  final String title;
  final List options;
  final String defaultOption;
  final Function changeOption;
  SelectOptions(
      {this.title, this.options, this.defaultOption, this.changeOption});
  @override
  _SelectOptionsState createState() => _SelectOptionsState();
}

class _SelectOptionsState extends State<SelectOptions> {
  int selectedIndex;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedIndex = widget.options.indexOf(widget.defaultOption);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;

    final Color primaryColor =
        darkTheme ? Colors.white : AppColors().primaryBlue();

    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            capitalize(widget.title),
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: primaryColor,
            ),
          ),
          SizedBox(height: 5),
          Wrap(
            children: widget.options
                .map((e) =>
                    customRadio(e, widget.options.indexOf(e), primaryColor))
                .toList(),
          ),
        ],
      ),
    );
  }

  void changeIndex(int index, String text) {
    setState(() {
      selectedIndex = index;
    });
    widget.changeOption(widget.title, text);
  }

  Widget customRadio(String txt, int index, Color primaryColor) {
    return Container(
      margin: EdgeInsets.only(left: 2, right: 2),
      child: OutlineButton(
        onPressed: () => changeIndex(index, txt),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.0)),
        borderSide: BorderSide(
          color: selectedIndex == index ? primaryColor : Colors.grey,
          width: 1.5,
        ),
        child: Text(
          capitalize(txt),
          style: GoogleFonts.roboto(
            fontSize: 13,
            fontWeight:
                selectedIndex == index ? FontWeight.w700 : FontWeight.w400,
            color: selectedIndex == index ? primaryColor : Colors.grey,
          ),
        ),
      ),
    );
  }
}
