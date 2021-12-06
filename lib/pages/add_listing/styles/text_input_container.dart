import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/text/nepek_text_input.dart';

class InputListing extends StatefulWidget {
  final Function inputChanged;
  final String placeholder;
  final String type;
  final String currentVal;
  final int maxLines;
  final int minLines;
  final bool isNum;
  final String defaultVal;
  final Function validationFn;
  final String initialValue;
  final String hint;
  final bool isPrice;

  InputListing({
    this.inputChanged,
    this.placeholder,
    this.currentVal,
    this.type,
    this.maxLines,
    this.isNum,
    this.defaultVal,
    this.validationFn,
    this.minLines,
    this.initialValue,
    this.hint,
    this.isPrice,
  });

  @override
  _InputListingState createState() => _InputListingState();
}

class _InputListingState extends State<InputListing>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: NepekTextInput(
        initialValue: widget.currentVal,
        labelText: widget.placeholder,
        numKeyboard: widget.isNum,
        onChanged: (value) => widget.inputChanged(value, widget.type),
        validator: widget.validationFn,
        maxlines: widget.maxLines,
        minlines: widget.minLines,
        hint: widget.hint,
        isPrice: widget.isPrice,
      ),
    );

    // );
  }

  @override
  bool get wantKeepAlive => true;
}
