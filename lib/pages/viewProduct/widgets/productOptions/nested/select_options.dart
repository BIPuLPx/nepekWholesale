import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/extensions.dart';

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
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            capitalize(widget.title),
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors().primaryBlue(),
            ),
          ),
          SizedBox(height: 5),
          // Center(
          // child:
          Wrap(
              children: widget.options
                  .map((e) => customRadio(e, widget.options.indexOf(e)))
                  .toList()),
          // ),
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

  Widget customRadio(String txt, int index) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: OutlineButton(
        onPressed: () => changeIndex(index, txt),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.0)),
        borderSide: BorderSide(
          color:
              selectedIndex == index ? AppColors().primaryBlue() : Colors.grey,
          width: 1.5,
        ),
        child: Text(
          capitalize(txt),
          style: GoogleFonts.roboto(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: selectedIndex == index
                  ? AppColors().primaryBlue()
                  : Colors.grey),
        ),
      ),
    );
  }
}
