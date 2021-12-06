import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:nepek_buyer/styles/popUps/errorPopup.dart';
import 'img_container.dart';

class AddImageState with ChangeNotifier {
  bool firstAdded = false;
  final picker = ImagePicker();
  List<Widget> addImage = [];
  Map miniThumb;
  List imagePaths = [];

  void addFirst() {
    addImage = [];
    imagePaths = [];
    addImg();
    firstAdded = true;
  }

  void addAnother(BuildContext context) {
    if (addImage.length == 6)
      errorPopup(context, 'You connot add more than \nsix images');
    else {
      addImg();
      notifyListeners();
    }
  }

  void addImg() {
    imagePaths.add({'imgPath': '', 'imgName': ''});
    final add = AddImage(
      index: addImage.length,
    );
    addImage.add(add);
  }

  void setImg(String path, int index, String imgName) {
    for (var imgpath in imagePaths) {
      if (imagePaths.indexOf(imgpath) == index) {
        imgpath['imgPath'] = path;
        imgpath['imgName'] = imgName;
      }
    }
    notifyListeners();
  }

  void deleteImage(imgname) async {
    await imgname.delete(recursive: true);
  }

  void getImageFromDevice(ImageSource source, int index) async {
    PickedFile image = await picker.getImage(source: source, imageQuality: 100);
    if (image != null) {
      File croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 4, ratioY: 4),
        // aspectRatioPresets: [
        //   CropAspectRatioPreset.square,
        //   CropAspectRatioPreset.ratio3x2,
        //   CropAspectRatioPreset.original
        // ],
        maxHeight: 800,
        maxWidth: 800,
        compressQuality: 100,
        compressFormat: ImageCompressFormat.png,
        androidUiSettings: AndroidUiSettings(
          statusBarColor: Colors.black,
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          hideBottomControls: true,
          toolbarTitle: "Crop Product Image",
        ),
        iosUiSettings: IOSUiSettings(
          aspectRatioLockEnabled: true,
          title: "Crop Product Image",
          // rotateButtonsHidden: true,
          hidesNavigationBar: true,
        ),
      );
      if (croppedFile != null && index == 0) {
        File compressedThumb = await FlutterNativeImage.compressImage(
          croppedFile.path,
          quality: 50,
          percentage: 80,
          targetWidth: 400,
          targetHeight: 400,
        );
        String filename = basename(compressedThumb.path);
        miniThumb = {'imgPath': compressedThumb.path, 'imgName': filename};
      }
      if (croppedFile != null) {
        File compressedImage = await FlutterNativeImage.compressImage(
          croppedFile.path,
          quality: 70,
          percentage: 30,
          targetWidth: 800,
          targetHeight: 800,
        );
        String filename = basename(compressedImage.path);
        setImg(compressedImage.path, index, filename);
      }
      deleteImage(File(image.path));
    }
  }

  bool validateImages(context) {
    for (var image in imagePaths) {
      if (image['imgPath'] == '') {
        errorPopup(context, "Fill all the images first");
        return false;
      }
    }
    return true;
  }
}
