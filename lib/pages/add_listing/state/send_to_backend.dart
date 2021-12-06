// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:nepek_buyer/StoredData/SavedItems.dart';
// import 'package:nepek_buyer/StoredData/apis.dart';

// class SendToBackend {
//   String productId;
//   Future sendData(Map productData) async {
//     var response = await http.post(
//       '$serviceTwo/products/cr_up_dl/add',
//       headers: {
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Authorization': 'Bearer ${UserPreferences().getJwtToken()}'
//       },
//       body: jsonEncode(productData),
//     );
//     if (response.statusCode == 200) {
//       productId = jsonDecode(response.body)['product_id'];

//       await sendImage(images['thumb'], 'thumb');
//       await sendImage(images['miniThumb'], 'miniThumb');
//       await sendImage(images['img1'], 'other');
//       await sendImage(images['img2'], 'other');
//       await sendImage(images['img3'], 'other');
//       await sendImage(images['img4'], 'other');

//     }
//   }

//   Future sendImage(imgpath, type) async {
//     final imageUploadUrl =
//         '$serviceTwo/products/cr_up_dl/upload?id=$productId&imagetype=$type';
//     final imageUpload =
//         http.MultipartRequest('POST', Uri.parse(imageUploadUrl));
//     final image = await http.MultipartFile.fromPath('image', imgpath);
//     imageUpload.files.add(image);
//     final response = await imageUpload.send();
//     deleteImage(File(imgpath));
//     if (response.statusCode != 200) {
//       setState(() {
//         currentScreen = Error();
//       });
//     }
//   }

//   void deleteImage(imgname) async {
//     await imgname.delete(recursive: true);
//   }
// }
