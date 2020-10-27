import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/pages/home/tabs/profile/widgets/common/widgets/common_container.dart';

class Common extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonContainer(
          label: 'Contact us',
          icon: 'contactUs',
        ),
        CommonContainer(
          label: 'About us',
          icon: 'aboutUs',
        ),
        CommonContainer(
          label: 'Theme',
          icon: 'theme',
        ),
        SizedBox(height: 100),
        // _reserved()
      ],
    );
  }

  Container _reserved() => Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _copyright('Copyright  ©  All rights reserved'),
            _copyright('Skite ' + new DateTime.now().toString().split('-')[0])
          ],
        ),
      );

  Text _copyright(String val) => Text(
        val,
        style: GoogleFonts.nunitoSans(),
      );
}
