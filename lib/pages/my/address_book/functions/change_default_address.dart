import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:nepek_buyer/functions/token_header.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/styles/popUps/loading_popup.dart';
import 'package:nepek_buyer/styles/toasts/sucess_toast.dart';

Future changeDefaultDeliveryAddress(BuildContext context, Map body, Function refresh) async {
  final Box userDeliveryAreas = Hive.box('userDeliveryAreas');

  loadingPopUP(context, 'Changing Default Address');
  final res = await put(
    httpUri(serviceOne, 'customers/default_shipping_address'),
    headers: tokenHeaderContentType(),
    body: jsonEncode(body),
  );

  final resData = jsonDecode(res.body);

  userDeliveryAreas.put('deliveryAreas', resData['deliveryAreas']);
  userDeliveryAreas.put('default_delivery_area', resData['default_delivery_area']);

  if (res.statusCode == 200) {
    Navigator.pop(context);
    Navigator.pop(context);
    sucessToast(
      context,
      'Changed default address',
      marginBottom: 30,
    );
    refresh();
  }
}
