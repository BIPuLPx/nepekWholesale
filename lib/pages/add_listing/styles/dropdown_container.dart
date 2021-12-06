import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';

class DropDownContainer extends StatefulWidget {
  final String heading;
  final Map current;
  final List dataList;
  final Function dropDownChanged;

  const DropDownContainer(
      {Key key,
      this.current,
      this.dataList,
      this.heading,
      this.dropDownChanged})
      : super(key: key);
  // final int index;

  @override
  _DropDownContainerState createState() => _DropDownContainerState();
}

class _DropDownContainerState extends State<DropDownContainer> {
  @override
  Widget build(BuildContext context) {
    final darkTheme = false;

    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            // capitalize(
            widget.heading

            // ),,
            ,
            style: dropdownHeading(),
          ),
          SizedBox(height: 8),
          Container(
            // margin: EdgeInsets.symmetric(horizontal: 5),
            // height: 50,
            // width: width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: darkTheme ? Colors.grey[900] : Colors.white,
              // boxShadow: [
              //   BoxShadow(
              //     color: AppColors.officialMatchFourth,
              //     blurRadius: 8,
              //   ),
              // ],
              border: Border.all(
                color: AppColors.officialMatchFourth,
                width: 2,
              ),
            ),

            child: new Theme(
              data: Theme.of(context).copyWith(
                canvasColor: darkTheme ? Colors.grey[900] : Colors.white,
              ),
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: Column(
                    children: [
                      DropdownButton<String>(
                        icon: Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          color: AppColors.officialMatchFourth,
                        ),
                        isExpanded: true,
                        value:
                            widget.current['label'] ?? widget.current['value'],
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: darkTheme ? Colors.white : Colors.black,
                        ),
                        // style: AppFontStyle().button(AppColors().primaryText()),
                        onChanged: (String newValue) {
                          // cart.changeQty(widget.index, newValue);
                        },
                        items: widget.dataList
                            .map<DropdownMenuItem<String>>(
                              (value) => new DropdownMenuItem<String>(
                                value: value['label'],
                                child:
                                    Container(child: new Text(value['label'])),
                                onTap: () {
                                  widget.dropDownChanged(value, widget.heading);
                                },
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle dropdownHeading() => GoogleFonts.poppins(
      fontSize: 17.5,
      fontWeight: FontWeight.w500,
    );
