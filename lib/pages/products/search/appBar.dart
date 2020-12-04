import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'search_provider.dart';

searchAppBar(
    context, currentSuffix, searchTerm, Function setSearchTerm, searchHolder) {
  final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
  final deviceWidth = MediaQuery.of(context).size.width;
  final SearchState search = Provider.of(context);
  return AppBar(
    leading: Container(),
    flexibleSpace: Center(
      child: Container(
        margin: EdgeInsets.only(top: 52),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 37,
              width: deviceWidth * 0.7,
              // width: double.infinity,
              margin: EdgeInsets.only(left: 20),
              padding: EdgeInsets.only(bottom: 2),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(5),
                color: darkTheme
                    ? TextInputColors().darkThemeBackground()
                    : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors().officialMatch(),
                    spreadRadius: 0.5,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: TextField(
                  controller: searchHolder,
                  autocorrect: false,
                  onChanged: (val) {
                    setSearchTerm(val);
                    search.autoComplete(val);
                  },
                  textInputAction: TextInputAction.search,
                  onSubmitted: (val) {
                    if (val.trim() != '') {
                      final search = Hive.box('search');
                      if (!search.values.toList().contains(val)) {
                        search.add(val);
                      }
                      Navigator.pushReplacementNamed(context, 'result',
                          arguments: {
                            'type': 'search',
                            'query': val,
                            'name': val
                          });
                    }
                  },
                  cursorColor: Colors.grey,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'What are you looking for ?',
                    hintStyle: GoogleFonts.poppins(
                      color: darkTheme
                          ? TextInputColors().darkThemeHintText()
                          : TextInputColors().lightThemeHintText(),
                    ),
                    contentPadding: EdgeInsets.only(
                      left: 10,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        if (searchTerm != '') {
                          searchHolder.clear();
                          setSearchTerm('');
                        }
                      },
                      child: Icon(
                        currentSuffix,
                        size: 18,
                        color: AppColors().officialMatch(),
                      ),
                    ),
                    suffixIconConstraints: BoxConstraints(
                      minHeight: 32,
                      minWidth: 35,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              // width: deviceWidth * 0.3,
              child: FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Center(
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.poppins(
                      color: darkTheme
                          ? Colors.white
                          : AppColors().officialMatch(),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
    // brightness: Brightness.light,
    // backgroundColor: Colors.white,
    // elevation: 1,
  );
}
