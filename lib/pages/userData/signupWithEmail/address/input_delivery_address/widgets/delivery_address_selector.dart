import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/styles/extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../signup_with_email_provider.dart';

class DeliveryAddressSelector extends StatefulWidget {
  final String heading;
  final Map current;
  final List dataList;

  const DeliveryAddressSelector(
      {Key key, this.current, this.dataList, this.heading})
      : super(key: key);

  @override
  _DeliveryAddressSelectorState createState() =>
      _DeliveryAddressSelectorState();
}

class _DeliveryAddressSelectorState extends State<DeliveryAddressSelector> {
  @override
  Widget build(BuildContext context) {
    final address = Provider.of<SignUpWithEmailProvider>(context);
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
          SizedBox(height: 8),
          Container(
            // height: 5,
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
                        isExpanded: true,
                        value: widget.current['label'],
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: darkTheme ? Colors.white : Colors.black,
                        ),
                        onChanged: (String newValue) {},
                        items: widget.dataList
                            .map<DropdownMenuItem<String>>(
                              (value) => new DropdownMenuItem<String>(
                                value: value['label'],
                                child:
                                    Container(child: new Text(value['label'])),
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
      fontSize: 17,
      fontWeight: FontWeight.w500,
    );
