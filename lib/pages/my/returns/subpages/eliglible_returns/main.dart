import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/my/returns/subpages/eliglible_returns/provider.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:provider/provider.dart';

class EligibleReturns extends StatelessWidget {
  final args;

  const EligibleReturns({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EligibleReturnsProvider(),
      child: EligibleReturnRoot(args: args),
    );
  }
}

class EligibleReturnRoot extends StatelessWidget {
  final args;

  const EligibleReturnRoot({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final EligibleReturnsProvider provider = Provider.of(context);
    if (!provider.initFetched) {
      provider.getPackages();
      provider.refreshBack = args['refresh'];
    }
    return Scaffold(
      appBar: defaultAppBar(context, 'Request Return', false),
      body: provider.body,
    );
  }
}
