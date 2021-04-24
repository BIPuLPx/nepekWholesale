import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/text/nepek_text_input.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'signup_with_email_provider.dart';

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
      appBar: defaultAppBar(context, 'Create Account', darktheme),
      backgroundColor: Colors.white,
      body: Form(
        key: provider.formKey,
        autovalidate: provider.autovalidate,
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: ListView(
            children: [
              SizedBox(height: 50),
              NepekText(
                value: 'Enter your details',
                fontSize: 23,
                fontWeight: FontWeight.w600,
                color: AppColors().officialMatch(),
              ),
              SizedBox(height: 20),
              NepekTextInput(
                labelText: 'Full Name',
                validator: provider.validateName,
                onChanged: (val) => provider.valChanged('name', val),
                background: true,
                initialValue: provider.name,
              ),
              SizedBox(height: 20),
              NepekTextInput(
                labelText: 'Email',
                validator: provider.validateEmail,
                onChanged: (val) => provider.valChanged('email', val),
                background: true,
                initialValue: provider.email,
              ),
              SizedBox(height: 20),
              NepekTextInput(
                labelText: 'Password',
                obscureText: true,
                validator: provider.validatePassword,
                onChanged: (val) => provider.valChanged('password1', val),
                background: true,
                initialValue: provider.password,
              ),
              SizedBox(height: 20),
              NepekTextInput(
                labelText: 'Retype password',
                obscureText: true,
                validator: provider.validatePassword,
                onChanged: (val) => provider.valChanged('password2', val),
                background: true,
                initialValue: provider.rePassword,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _signUP(darktheme, provider, context),
    );
  }

  Widget _signUP(
      bool darktheme, SignUpWithEmailProvider provider, BuildContext context) {
    return NepekButton(
      width: 150,
      onClick: () => provider.signUp(context),
      label: 'Sign up',
    );
  }
}
