import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/search/search_provider.dart';
import 'package:skite_buyer/styles/colors.dart';

searchAppBar(
    context, currentSuffix, searchTerm, Function setSearchTerm, searchHolder) {
  final search = Provider.of<SearchState>(context);
  return PreferredSize(
    preferredSize: Size.fromHeight(50.0), // here the desired height
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
