import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/userInfoInput/address/address_provider.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/extensions.dart';
import 'package:skite_buyer/styles/font_styles.dart';

class InputDeliveryAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final address = Provider.of<AddDeliveryAddressState>(context);
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Column(
        children: [
          DeliveryAddressSelector(
            current: address.currentState,
            dataList: address.deliveryStates,
            heading: 'state',
          ),
          DeliveryAddressSelector(
            current: address.currentDistrict,
            dataList: address.deliveryDistricts,
            heading: 'district',
          ),
          DeliveryAddressSelector(
            current: address.currentArea,
            dataList: address.deliveryAreas,
            heading: 'area',
          )
        ],
      ),
    );
  }
}

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
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors().primaryBlue(),
                  spreadRadius: 0.2,
                  blurRadius: 2,
                ),
              ],
            ),
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: widget.current['label'],
                  style: AppFontStyle().button(AppColors().primaryText()),
                  onChanged: (String newValue) {
                    // cart.changeQty(widget.index, newValue);
                  },
                  items: widget.dataList
                      .map<DropdownMenuItem<String>>(
                        (value) => new DropdownMenuItem<String>(
                          value: value['label'],
                          child: new Text(value['label']),
                          onTap: () {
                            address.dropDownChanged(widget.heading, value);
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle dropdownHeading() => GoogleFonts.rubik(
      color: AppColors().primaryText(),
      fontSize: 17.5,
      fontWeight: FontWeight.w500,
    );
