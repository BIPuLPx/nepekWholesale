import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/signupWithEmail/signup_with_email_provider.dart';
import 'package:skite_buyer/styles/appBars/default_app_bar.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:skite_buyer/styles/text/textInput.dart';

class SignUpWithEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpWithEmailProvider(),
      child: SignUpWithEmailRoot(),
    );
  }
}

class SignUpWithEmailRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final provider = Provider.of<SignUpWithEmailProvider>(context);
    return Scaffold(
      appBar: defaultAppBar(context, 'Sign up', darktheme),
      body: Form(
        key: provider.formKey,
        autovalidate: provider.autovalidate,
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: ListView(
            children: [
              SizedBox(height: 100),
              Text(
                'Enter your details',
                style: GoogleFonts.quicksand(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 20),
              TextInput(
                labelText: 'Full Name',
                validator: provider.validateName,
                onChanged: (val) => provider.valChanged('name', val),
              ),
              TextInput(
                labelText: 'Email',
                validator: provider.validateEmail,
                onChanged: (val) => provider.valChanged('email', val),
              ),
              TextInput(
                labelText: 'Password',
                obscureText: true,
                validator: provider.validatePassword,
                onChanged: (val) => provider.valChanged('password1', val),
              ),
              TextInput(
                labelText: 'Retype password',
                obscureText: true,
                validator: provider.validatePassword,
                onChanged: (val) => provider.valChanged('password2', val),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _signUP(darktheme, provider, context),
    );
  }

  BottomAppBar _signUP(
      bool darktheme, SignUpWithEmailProvider provider, BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 50,
        child: FlatButton(
          color: darktheme ? Colors.white : AppColors().primaryBlue(),
          onPressed: () {
            provider.signUp(context);
          },
          child: Text(
            'Sign up',
            style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w600,
                color: darktheme ? Colors.black : Colors.white),
          ),
        ),
      ),
    );
  }
}
