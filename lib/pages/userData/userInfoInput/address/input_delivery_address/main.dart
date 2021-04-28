import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/button/nepek_button_icon.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/extensions.dart';
import 'package:nepek_buyer/styles/text/nepek_text_input.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import '../address_provider.dart';
import 'widgets/delivery_address_selector.dart';

class InputDeliveryAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final address = Provider.of<AddDeliveryAddressState>(context);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;

    return Scaffold(
      backgroundColor: darkTheme ? Colors.black : Colors.white,
      body: Container(
        // child: Form(
        //   key: address.formKey,
        //   autovalidate: address.autovalidate,
        child: ListView(
          children: [
            SizedBox(height: 10),
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
              current: address.currentCity,
              dataList: address.deliveryCities,
              heading: 'City',
            ),
            DeliveryAddressSelector(
              current: address.currentArea,
              dataList: address.deliveryAreas,
              heading: 'area',
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  NepekTextInput(
                    onChanged: (String val) =>
                        address.inputChanged('address', val),
                    initialValue: address.input['address'],
                    labelText: 'Address',
                    background: true,
                    validator: (val) =>
                        Validator().validateName(val, 'Address'),
                  ),
                  SizedBox(height: 25),
                  NepekTextInput(
                    onChanged: (String val) =>
                        address.inputChanged('name', val),
                    labelText: 'Name',
                    background: true,
                    validator: (val) => Validator().validateName(val, 'Name'),
                    initialValue: address.input['name'],
                  ),
                  SizedBox(height: 25),
                  NepekTextInput(
                    onChanged: (String val) =>
                        address.inputChanged('phone', val),
                    labelText: 'Phone Number',
                    background: true,
                    validator: (val) => Validator().validatePhoneNumber(val),
                    initialValue: address.input['phone'].toString(),
                  ),
                ],
              ),
            ),
            HomeOffice(),
            SizedBox(height: 150)
          ],
        ),
      ),
      // ),
      floatingActionButton: NepekButton(
        onClick: () => address.done(context),
        icon: NepekButtonIcon(
          Icons.done,
        ),
        label: 'Done',
        width: 120,
      ),
    );
  }
}

class HomeOffice extends StatelessWidget {
  const HomeOffice({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddDeliveryAddressState provider = Provider.of(context);
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NepekText(
            'Home or Office',
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              HomeOfficeSelector(
                label: 'home',
                selected: provider.input['home_office'] == 'home',
              ),
              SizedBox(width: 20),
              HomeOfficeSelector(
                label: 'office',
                selected: provider.input['home_office'] == 'office',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeOfficeSelector extends StatelessWidget {
  final String label;
  final bool selected;
  const HomeOfficeSelector({
    Key key,
    this.label,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddDeliveryAddressState provider = Provider.of(context);
    return GestureDetector(
      onTap: () => provider.inputChanged('home_office', label),
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
            color: selected ? AppColors.officialMatch : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: !selected
                ? Border.all(
                    color: AppColors.officialMatch,
                    width: 1.8,
                  )
                : Border()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NepekButtonIcon(
              label == 'home' ? Icons.home_rounded : Icons.work_rounded,
              reversed: !selected,
            ),
            SizedBox(width: 4),
            NepekText(
              capitalize(label),
              color: !selected ? AppColors.officialMatch : Colors.white,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }
}
