import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/home/tabs/profile/widgets/common/widgets/common_container.dart';

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
        // CommonContainer(
        //   label: 'Theme',
        //   icon: 'theme',
        // ),
        SizedBox(height: 100),
        // _reserved()
      ],
    );
  }
}
