import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:provider/provider.dart';

import '../../provider.dart';

class AddImageLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GiveReviewProvider provider = Provider.of(context);
    return Container(
      color: Colors.white,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          // padding: EdgeInsets.only(left: 10, right: 10),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Column(
                // spacing: 20,
                // runSpacing: ,
                children: provider.addImage,
              ),
              Container(
                child: NepekButton(
                  label: 'Add Another Image',
                  onClick: () => provider.addAnother(context),
                ),
              ),
              SizedBox(height: 150)
            ],
          ),
        ),
      ),
    );
  }
}
