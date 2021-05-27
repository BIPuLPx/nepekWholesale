import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/products/give_review/provider.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:provider/provider.dart';

class GiveReview extends StatelessWidget {
  final args;

  const GiveReview({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GiveReviewProvider(),
      child: GiveReviewRoot(args: args),
    );
  }
}

class GiveReviewRoot extends StatelessWidget {
  final args;
  const GiveReviewRoot({Key key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GiveReviewProvider provider = Provider.of(context);

    if (!provider.initFetched) {
      provider.refreshBack = args['refresh'];
      provider.id = args['id'];
      provider.getProduct();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(context, 'Give Review', false),
      body: provider.body,
    );
  }
}
