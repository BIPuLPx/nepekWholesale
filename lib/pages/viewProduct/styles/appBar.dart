import 'package:flutter/material.dart';
import 'package:skite_buyer/listeners/cart_no_listener.dart';
import 'package:skite_buyer/styles/colors.dart';

viewProductAppBar(viewProductContext) {
  return SliverAppBar(
    leading: IconButton(
      onPressed: () => Navigator.of(viewProductContext).pop(),
      icon: Icon(
        Icons.arrow_back_ios,
        color: AppColors().primaryBlue(),
        size: 17,
      ),
    ),
    floating: true,
    elevation: 5,
    brightness: Brightness.light,
    actions: [
      IconButton(
        icon: CartNoListener(
          size: 19,
          labelColor: Colors.white,
          iconColor: AppColors().primaryBlue(),
        ),
        onPressed: () => Navigator.pushNamed(viewProductContext, 'cart'),
      ),
    ],
    backgroundColor: Colors.white,
    // expandedHeight: 128.0,
  );
}
