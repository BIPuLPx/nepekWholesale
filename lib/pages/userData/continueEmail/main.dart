import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/text/nepek_text_input.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

import 'continue_email_provider.dart';

class ContinueWithEmail extends StatelessWidget {
  final args;
  const ContinueWithEmail({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContinueWithEmailProvider(),
      child: ContinueWithEmailRoot(args: args),
    );
  }
}

class ContinueWithEmailRoot extends StatelessWidget {
  final args;
  const ContinueWithEmailRoot({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print(args);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final provider = Provider.of<ContinueWithEmailProvider>(context);
    if (provider.initState == false) {
      provider.refresh = args['refresh'];
      provider.thirdPartyRoute = args['thirdPartyRoute'];
      provider.initState = true;
    }
    print(args);
    return Scaffold(
      // appBar:  args['hide'],
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                color: Colors.white,
                height: 70,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/others/nepek.png',
                        height: 30,
                      ),
                    ),
                    (args['thirdPartyRoute'] != null)
                        ? IconButton(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            color: Colors.white,
                            icon: Icon(
                              Icons.close_rounded,
                              size: 30,
                              color: AppColors.officialMatch,
                            ),
                            onPressed: () => Navigator.pop(context),
                          )
                        : Container()
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  NepekText(
                    'Welcome back!',
                    // color: AppColors.officialMatch,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  NepekText(
                    'Enter your credentials',
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    // color: AppColors.officialMatch,
                  ),
                  SizedBox(height: 30),
                  NepekTextInput(
                    labelText: "Email",
                    onChanged: (val) => provider.inputChanged('email', val),
                    background: true,
                    hint: "Please enter your email",
                  ),
                  SizedBox(height: 20),
                  NepekTextInput(
                    labelText: "Password",
                    obscureText: true,
                    onChanged: (val) => provider.inputChanged('password', val),
                    background: true,
                    hint: "Please enter your password",
                  ),
                  SizedBox(height: 30),
                  _signinBtn(darkTheme, provider, context),
                  // SizedBox(height: 5),
                  _forgotPwd(darkTheme, provider),
                  _signUp(darkTheme, context)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _signUp(bool darkTheme, BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NepekText(
            "Don't have an account?",
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          SizedBox(height: 8),
          NepekButton(
            onClick: () =>
                Navigator.of(context).pushNamed('sign_up_with_email'),
            label: 'Create Account',
            reverse: true,
          ),
        ],
      ),
    );
  }

  Align _forgotPwd(bool darkTheme, ContinueWithEmailProvider provider) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: AppColors.officialMatchShadow,
        ),
        onPressed: provider.forgotPassword,
        child: NepekText(
          'Forgot Password ?',
          color: AppColors.officialMatch,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _signinBtn(bool darkTheme, provider, context) {
    return NepekButton(
      label: "Sign In",
      onClick: () => provider.signIn(context),
      // reverse: true,
    );

    // return Container(
    //   height: 50,
    //   width: double.infinity,
    //   child: FlatButton(
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(0),
    //     ),
    //     color: darkTheme ? Colors.white : AppColors.officialMatch,
    //     onPressed: () {
    //       provider.signIn(context);
    //     },
    //     child: Text(
    //       'Sign in',
    //       style: GoogleFonts.poppins(
    //         fontWeight: FontWeight.w600,
    //         color: darkTheme ? Colors.black : Colors.white,
    //       ),
    //     ),
    //   ),
    // );
  }

  TextStyle _textStyle(bool isBold, bool darkTheme) => GoogleFonts.poppins(
        fontWeight: isBold ? FontWeight.w700 : null,
        color: isBold
            ? darkTheme
                ? Colors.white
                : AppColors.officialMatch
            : null,
      );
}
