// import 'dart:io';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// final picker = ImagePicker();






// class ImagePickerModule {
//     Map imagePaths = {
//     'thumb': '',
//     'miniThumb': '',
//     'img1': '',
//     'img2': '',
//     'img3': '',
//     'img4': '',
//   };



// void getImageFromDevice(ImageSource source, dynamic imgTag) async {
//   PickedFile image = await picker.getImage(source: source, imageQuality: 100);
//   if (image != null) {
//     File croppedFile = await ImageCropper.cropImage(
//       sourcePath: image.path,
//       aspectRatio: CropAspectRatio(ratioX: 0.75, ratioY: 1),
//       maxHeight: 800,
//       maxWidth: 600,
//       compressQuality: 75,
//     );
//     if (croppedFile != null) {
//       setImgPath(croppedFile.path, imgTag);
//       deleteImage(File(image.path));
//     }
//   }
// }



// }













