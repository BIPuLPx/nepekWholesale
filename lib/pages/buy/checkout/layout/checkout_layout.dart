import 'package:flutter/material.dart';
import 'widgets/checkout_calculations.dart';
import 'widgets/coupon_code.dart';

class CheckoutLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CheckoutLayoutCalculations(),
        CouponCode(),
      ],
    );
  }
}
