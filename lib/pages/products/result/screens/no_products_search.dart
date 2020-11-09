import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/products/result/provider/main.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

class NoProductsSearch extends StatelessWidget {
  final String query;
  NoProductsSearch({this.query});
  @override
  Widget build(BuildContext context) {
    final ResultState provider = Provider.of(context);
    final bool darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  darktheme
                      ? 'assets/noProductsFound/darkMode.png'
                      : 'assets/noProductsFound/lightMode.png',
                  height: 100,
                ),
                SizedBox(height: 20),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No products Found in',
                      style: _noProductsStyle(darktheme),
                    ),
                    SizedBox(height: 10),
                    Text(
                      provider.args['type'] == 'subcategory'
                          ? provider.args['name']
                          : query,
                      style: _noProductsStyle(darktheme),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                      // side: BorderSide(color: Colors.red),
                    ),
                    color: darktheme ? Colors.white : AppColors().primaryBlue(),
                    onPressed: () {
                      provider.args['type'] == 'subcategory'
                          ? Navigator.of(context).pop()
                          : Navigator.pushReplacementNamed(context, 'search');
                    },
                    child: Text(
                      'Go Back',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        color: darktheme ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _noProductsStyle(bool darkTheme) => GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: darkTheme ? Colors.white : AppColors().primaryBlue(),
      );
}
