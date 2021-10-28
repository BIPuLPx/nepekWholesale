import 'dart:convert';

import 'package:http/http.dart';
import 'package:nepek_buyer/functions/token_header.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';

removeNotificationToken(String token) async {
  final data = {"entity_type": "buyer", "device_token": token};
  await put(
    httpUri(
      serviceOne,
      'notification_token/remove',
    ),
    headers: contentTypeHeader(),
    body: jsonEncode(data),
  );
}
