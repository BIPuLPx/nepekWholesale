import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/products/viewProduct/view_product_state.dart';
import 'package:provider/provider.dart';

class ViewProductPage extends StatelessWidget {
  final args;
  ViewProductPage({this.args});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewProductState>(
        create: (context) => ViewProductState(),
        child: ViewProductRoot(args: args));
  }
}

class ViewProductRoot extends StatelessWidget {
  final args;
  ViewProductRoot({this.args});
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ViewProductState>(context);
    if (product.initialFetch == false) {
      product.productID = args['product_id'];
      product.fetchProduct();
    }
    return WillPopScope(
      onWillPop: () {
        if (product.screen == 1)
          Navigator.of(context).pop();
        else
          product.changeScreen(1);
        return null;
      },
      child: Scaffold(
        body: product.result,
      ),
    );
  }
}
