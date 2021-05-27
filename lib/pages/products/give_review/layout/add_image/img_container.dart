import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../../provider.dart';

class AddImage extends StatelessWidget {
  final int index;

  AddImage({this.index});

  @override
  Widget build(BuildContext context) {
    final GiveReviewProvider provider = Provider.of(context);

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.width * 0.7,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => provider.getImageFromDevice(index, context),
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.officialMatchLightest,
              borderRadius: BorderRadius.circular(10),
            ),
            child: provider.imagePaths[index]['imgPath'] == ''
                ? Icon(
                    Icons.add_a_photo,
                    color: AppColors.officialMatch,
                    size: 25,
                  )
                : Image.file(
                    File(provider.imagePaths[index]['imgPath']),
                    // height: MediaQuery.of(context).size.width * 0.7,
                    // width: double.infinity,
                    // fit: BoxFit.contain,
                    // fit: BoxFit.fitWidth,
                  ),
          ),
        ),
      ),
    );
  }
}
