import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

class NepekTextInput extends StatefulWidget {
  final String labelText;
  final bool obscureText;
  final Function onChanged;
  final Function validator;
  final bool numKeyboard;
  final focusNode;
  final int maxlines;
  final int minlines;
  final String initialValue;
  final bool autofocus;
  final bool background;

  const NepekTextInput({
    Key key,
    this.labelText,
    this.obscureText,
    this.onChanged,
    this.validator,
    this.numKeyboard,
    this.focusNode,
    this.maxlines,
    this.minlines,
    this.initialValue,
    this.autofocus,
    this.background,
  }) : super(key: key);

  @override
  _NepekTextInputState createState() => _NepekTextInputState();
}

class _NepekTextInputState extends State<NepekTextInput> {
  bool _obscure;
  String val = '';
  TextEditingController _controller = new TextEditingController();
  @override
  void initState() {
    setState(() {
      _obscure = widget.obscureText ?? false;
      _controller.text = widget.initialValue == null ? '' : widget.initialValue;
    });
    super.initState();
  }

  void reset() =>
      _controller.text = widget.initialValue == null ? '' : widget.initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.background == true
          ? EdgeInsets.only(left: 10, bottom: 15, right: 10, top: 10)
          : EdgeInsets.symmetric(vertical: 13),
      decoration: widget.background == true
          ? BoxDecoration(
              color: AppColors().officialMatchLightest(),
              borderRadius: BorderRadius.circular(10),
            )
          : BoxDecoration(),

      // padding: EdgeInsets.symmetric(vertical: 13),
      child: TextFormField(
        autofocus: widget.autofocus == null ? false : widget.autofocus,
        initialValue: widget.initialValue,
        // key: Key(widget.initialValue),
        // controller: _controller,
        focusNode: widget.focusNode ?? null,
        keyboardType: widget.numKeyboard == true
            ? TextInputType.number
            : TextInputType.text,
        autocorrect: false,
        validator: widget.validator ?? null,
        onChanged: (vall) {
          widget.onChanged(vall);
          setState(() {
            val = vall;
          });
        },
        obscureText: _obscure,
        style: GoogleFonts.poppins(height: 1.3),
        cursorColor: AppColors().officialMatchFourth(),
        cursorHeight: 17,
        minLines: widget.minlines == null ? 1 : widget.minlines,
        maxLines: widget.maxlines == null ? 1 : widget.maxlines,
        // showCursor: false,
        decoration: InputDecoration(
          suffixIcon: widget.obscureText == null
              ? null
              : val != ''
                  ? TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                      ),
                      onPressed: () => setState(() {
                        _obscure = !_obscure;
                      }),
                      child: Text(
                        _obscure ? "Show" : "Hide",
                        style: GoogleFonts.poppins(color: Colors.black),
                      ),
                    )
                  : null,
          errorStyle: GoogleFonts.poppins(
            color: Colors.red,
          ),
          labelText: widget.labelText,
          // hintText: widget.labelText,
          labelStyle: GoogleFonts.poppins(color: Colors.black45),
          contentPadding: EdgeInsets.only(left: 10, bottom: 7),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black45,
              width: 1,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors().officialMatch(),
              width: 2,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
