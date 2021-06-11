import 'dart:io';

Future<bool> isThereInternet() async {
  try {
    final internet = await InternetAddress.lookup('service01.nepek.com');
    final internet1 = await InternetAddress.lookup('service02.nepek.com');

    if (internet.length == 1 && internet1.length == 1) return true;
    return false;
  } on SocketException catch (_) {
    return false;
  }
}
