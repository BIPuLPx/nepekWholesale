import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/my/returns/provider.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/button/nepek_button_icon.dart';
import 'package:provider/provider.dart';

class Returns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReturnsProvider(),
      child: ReturnsRoot(),
    );
  }
}

class ReturnsRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ReturnsProvider provider = Provider.of(context);
    if (!provider.initFetch) provider.getReturns();
    return Scaffold(
      appBar: defaultAppBar(context, 'Returns', false),
      body: provider.body,
      floatingActionButton: NepekButton(
        onClick: () => Navigator.pushNamed(
          context,
          'eligible_returns',
          arguments: {'refresh': provider.refresh},
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        label: 'Request a new return',
        icon: NepekButtonIcon(Icons.restore),
        iconReverse: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
