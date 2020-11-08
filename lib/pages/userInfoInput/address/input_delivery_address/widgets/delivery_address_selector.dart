import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/styles/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../styles/colors.dart';
import '../../address_provider.dart';

class DeliveryAddressSelector extends StatefulWidget {
  final String heading;
  final Map current;
  final List dataList;

  const DeliveryAddressSelector(
      {Key key, this.current, this.dataList, this.heading})
      : super(key: key);
  // final int index;

  @override
  _DeliveryAddressSelectorState createState() =>
      _DeliveryAddressSelectorState();
}

class _DeliveryAddressSelectorState extends State<DeliveryAddressSelector> {
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final address = Provider.of<AddDeliveryAddressState>(context);
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            capitalize(widget.heading),
            style: dropdownHeading(),
          ),
          SizedBox(height: 10),
          Container(
            height: 50,
            // width: width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: darkTheme ? Colors.grey[900] : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors().primaryBlue(),
                  spreadRadius: 0.2,
                  blurRadius: 2,
                ),
              ],
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
                        isExpanded: true,
                        value: widget.current['label'],

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
                                child: Container(
                                    // height: 50,
                                    // width: double.infinity,
                                    // decoration: BoxDecoration(
                                    //   borderRadius: BorderRadius.circular(2),
                                    //   color:
                                    //       darkTheme ? Colors.grey[900] : Colors.white,
                                    //   boxShadow: [
                                    //     BoxShadow(
                                    //       color: AppColors().primaryBlue(),
                                    //       spreadRadius: 0.2,
                                    //       blurRadius: 2,
                                    //     ),
                                    //   ],
                                    // ),
                                    child: new Text(value['label'])),
                                onTap: () {
                                  address.dropDownChanged(
                                      widget.heading, value);
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
      // color: AppColors().primaryText(),
      fontSize: 17.5,
      fontWeight: FontWeight.w500,
    );
