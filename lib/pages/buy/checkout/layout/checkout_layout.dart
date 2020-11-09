import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/checkout/layout/widgets/checkout_calculations.dart';
import 'package:nepek_buyer/pages/checkout/layout/widgets/coupon_code.dart';

class CheckoutLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CheckoutLayoutCalculations(),
        CouponCode()
      ],
    );
  }
}
