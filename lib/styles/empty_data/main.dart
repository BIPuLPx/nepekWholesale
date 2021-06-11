import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import '../colors.dart';

class EmptyData extends StatelessWidget {
  final String asset;
  final String label;
  final bool hideOK;
  const EmptyData({
    Key key,
    this.asset,
    this.label,
    this.hideOK,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(right: 15),
              child: Image.asset(
                'assets/others/$asset.png',
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          SizedBox(height: 30),
          NepekText(
            label,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.officialMatch,
          ),
          SizedBox(height: 30),
          hideOK == true
              ? Container()
              : NepekButton(
                  width: MediaQuery.of(context).size.width * 0.5,
                  label: 'Okay',
                  onClick: () => Navigator.pop(context),
                )
        ],
      ),
    );
  }
}
