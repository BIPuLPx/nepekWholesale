import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/my/returns/subpages/eliglible_returns/provider.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/text/nepek_text_input.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

Future<void> giveReason(context, EligibleReturnsProvider provider) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      final double width = MediaQuery.of(context).size.width;
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: NepekText(
          'Specify reason for return',
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ReasonSelector(provider: provider),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NepekButton(
                  onClick: () {
                    provider.otherReason = '';
                    Navigator.pop(context);
                  },
                  label: 'Cancel',
                  width: width * 0.3,
                  reverse: true,
                ),
                NepekButton(
                  label: 'Return',
                  width: width * 0.3,
                  onClick: () => provider.returnPackage(context),
                )
              ],
            )
          ],
        ),
      );
    },
  );
}

class ReasonSelector extends StatefulWidget {
  final EligibleReturnsProvider provider;

  const ReasonSelector({Key key, this.provider}) : super(key: key);

  @override
  _ReasonSelectorState createState() => _ReasonSelectorState();
}

class _ReasonSelectorState extends State<ReasonSelector> {
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    String reason = 'Damaged / Broken';

    List<String> reasons = [
      'Damaged / Broken',
      'worst',
      'null',
      'full',
      'Other'
    ];

    return Column(
      children: [
        NepekText(reason),
        SizedBox(height: 10),
        Container(
          height: 50,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.grey[300], width: 1.5),
          ),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                dropdownColor: Colors.white,
                isExpanded: true,
                value: widget.provider.reason,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                ),
                onChanged: (String newValue) {
                  widget.provider.setReason(newValue);
                  setState(() {
                    reason = newValue;
                  });
                },
                items: reasons.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Center(
                      child: Text(
                        value,
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        widget.provider.reason == 'Other'
            ? Container(
                margin: EdgeInsets.only(top: 20),
                child: NepekTextInput(
                  labelText: 'Other Reason',
                  hint: 'Specify other reason',
                  onChanged: (val) => widget.provider.otherReason = val,
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
