import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/styles/colors.dart';

searchAppBar(
    context, currentSuffix, searchTerm, Function setSearchTerm, searchHolder) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60.0), // here the desired height
    child: AppBar(
      leading: Container(),
      flexibleSpace: Center(
        child: Container(
          margin: EdgeInsets.only(top: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 37,
                width: 250,
                margin: EdgeInsets.only(left: 20),
                padding: EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors().primaryBlue(),
                      spreadRadius: 0.002,
                      blurRadius: 0.4,
                    ),
                  ],
                ),
                child: Center(
                  child: TextField(
                    controller: searchHolder,
                    autocorrect: false,
                    onChanged: setSearchTerm,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (val) {
                      if (val != '') {
                        Navigator.pushReplacementNamed(context, 'result',
                            arguments: {'type': 'search', 'query': val});
                      }
                    },
                    cursorColor: Colors.grey,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'What are you looking for ?',
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
                          color: AppColors().primaryBlue(),
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
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Center(
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.ptSans(
                      color: AppColors().primaryBlue(),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      elevation: 1,
    ),
  );
}
