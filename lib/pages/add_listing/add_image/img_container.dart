import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nepek_buyer/pages/add_listing/add_image/add_image_state.dart';
import 'dart:io';

import 'package:nepek_buyer/styles/colors.dart';
import 'package:provider/provider.dart';

class AddImage extends StatelessWidget {
  final int index;

  AddImage({this.index});
  @override
  Widget build(BuildContext context) {
    final AddImageState provider = Provider.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.width * 0.7,
      child: Material(
        child: InkWell(
          onTap: () => provider.getImageFromDevice(ImageSource.gallery, index),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.officialMatchLight,
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
