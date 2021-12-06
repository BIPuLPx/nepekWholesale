import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:provider/provider.dart';

import 'add_image_state.dart';

class AddImageLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AddImageState provider = Provider.of(context);
    return Container(
      color: Colors.white,
      child: Center(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 50),
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              SizedBox(height: 20),
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
