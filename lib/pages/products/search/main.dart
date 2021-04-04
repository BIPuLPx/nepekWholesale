import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:provider/provider.dart';

import 'search_provider.dart';
import 'widgets/autoComplete/main.dart';
import 'widgets/currentSearch/main.dart';
import 'widgets/history/main.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => SearchState()),
      child: SearchPageRoot(),
    );
  }
}

class SearchPageRoot extends StatefulWidget {
  @override
  _SearchPageRootState createState() => _SearchPageRootState();
}

class _SearchPageRootState extends State<SearchPageRoot> {
  var currentSuffix = Icons.search;
  var searchTerm = '';
  final TextEditingController _searchHolder = TextEditingController();

  setSearchTerm(val) {
    setState(() {
      val == '' ? currentSuffix = Icons.search : currentSuffix = Icons.cancel;
      searchTerm = val.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchState>(context);
    final autocompletes = provider.autoCompletes;
    final double searchbarHeight = 60;
    // print(autocompletes);
    return Scaffold(
      // appBar: searchAppBar(
      //     context, currentSuffix, searchTerm, setSearchTerm, _searchHolder),
      body: SafeArea(
        child: Stack(children: [
          Container(
            height: searchbarHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 0.005,
                  blurRadius: 2,
                ),
              ],
            ),
            child: SearchBox(
              searchHolder: _searchHolder,
              setSearchTerm: setSearchTerm,
              searchTerm: searchTerm,
              currentSuffix: currentSuffix,
            ),
          ),
          Container(
            // color: Colors.white,
            margin: EdgeInsets.only(top: searchbarHeight),
            child: ListView(
              children: [
                searchTerm == ''
                    ? SearchHistory()
                    : CurrentSearch(val: searchTerm),
                autocompletes.length == 0 ? Container() : AutoCompletes(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  final searchHolder;
  final Function setSearchTerm;
  final String searchTerm;
  final currentSuffix;

  const SearchBox(
      {Key key,
      this.searchHolder,
      this.setSearchTerm,
      this.searchTerm,
      this.currentSuffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final deviceWidth = MediaQuery.of(context).size.width;
    final SearchState search = Provider.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: deviceWidth * 0.7,
          // width: double.infinity,
          margin: EdgeInsets.only(left: 20),
          // padding: EdgeInsets.only(bottom: 2),
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
                    arguments: {'type': 'search', 'query': val, 'name': val});
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
        SizedBox(
          // width: deviceWidth * 0.3,
          child: FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Center(
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                  color: darkTheme ? Colors.white : AppColors().officialMatch(),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
