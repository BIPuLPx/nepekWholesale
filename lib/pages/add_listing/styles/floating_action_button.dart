import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/button/nepek_button_icon.dart';

class AddProductNextBtn extends StatelessWidget {
  final Function onPressed;

  const AddProductNextBtn({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.3;
    return NepekButton(
      width: width,
      label: 'Next',
      onClick: onPressed,
      icon: NepekButtonIcon(
        Icons.arrow_forward,
      ),
      iconReverse: true,
    );
  }
}

class AddProductFinishBtn extends StatelessWidget {
  final Function onPressed;

  const AddProductFinishBtn({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.3;
    return NepekButton(
      onClick: onPressed,
      label: 'Add',
      icon: NepekButtonIcon(Icons.done_rounded),
      width: width,
      iconReverse: true,
    );
  }
}
