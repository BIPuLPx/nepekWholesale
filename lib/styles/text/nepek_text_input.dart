import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../colors.dart';
import 'normal_text.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

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
  final String hint;
  final controller;
  final bool isPrice;

  const NepekTextInput(
      {Key key,
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
      this.hint,
      this.controller,
      this.isPrice})
      : super(key: key);

  @override
  _NepekTextInputState createState() => _NepekTextInputState();
}

class _NepekTextInputState extends State<NepekTextInput> {
  bool _obscure;
  String val = '';
  final CurrencyTextInputFormatter formatter = CurrencyTextInputFormatter(
    locale: 'hi',
    decimalDigits: 0,
    symbol: 'NPR ',
  );
  @override
  void initState() {
    setState(() {
      _obscure = widget.obscureText ?? false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(left: 10, bottom: 10, right: 10, top: 10),
      // decoration: BoxDecoration(
      //   color: AppColors.officialMatchLight,
      //   borderRadius: BorderRadius.circular(10),
      // ),

      // padding: EdgeInsets.symmetric(vertical: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          NepekText(
            widget.labelText,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 8),
          TextFormField(
            autofocus: widget.autofocus == null ? false : widget.autofocus,
            // initialValue: 'akak',
            // key: Key(widget.initialValue),
            inputFormatters: widget.isPrice == true
                ? [
                    CurrencyTextInputFormatter(
                      locale: 'hi',
                      decimalDigits: 0,
                      symbol: 'NPR ',
                    )
                  ]
                : [],
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
            cursorColor: AppColors.officialMatch,

            minLines: widget.minlines == null ? 1 : widget.minlines,
            maxLines: widget.maxlines == null ? 1 : widget.maxlines,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: GoogleFonts.poppins(
                height: 1.3,
                color: Colors.grey,
              ),
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
                            style: GoogleFonts.poppins(
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : null,
              errorStyle: GoogleFonts.poppins(
                color: Colors.red,
              ),
              contentPadding: EdgeInsets.all(16),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.officialMatchFourth,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.officialMatch,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red.shade400,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
