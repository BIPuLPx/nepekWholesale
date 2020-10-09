import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/pages/home/tabs/home/wigdets/advertisement/main.dart';
import 'package:skite_buyer/pages/home/tabs/home/wigdets/carasoul/carasoul.dart';
import 'package:skite_buyer/pages/home/tabs/home/wigdets/featuredSlider/main.dart';
import 'package:skite_buyer/pages/home/tabs/home/wigdets/shopByCategory/main.dart';
import 'package:skite_buyer/styles/appBars/home.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: homeAppbar(context),
        body: Container(
          child: ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            cacheExtent: 10,
            addAutomaticKeepAlives: true,
            children: [
              FrontCarasoul(),
              FeaturedSlider(),
              ShopByCategory(),
              HomeAd(),
              Container(
                color: Colors.grey,
                height: 200,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                // child:
              ),
              Text(
                'Home',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Text',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(height: 150, color: Colors.redAccent),
              SizedBox(height: 50),
              Container(height: 150, color: Colors.redAccent),
              SizedBox(height: 50),
              Container(height: 150, color: Colors.redAccent),
              SizedBox(height: 50),
              Container(height: 150, color: Colors.redAccent),
              SizedBox(height: 50),
              Container(height: 150, color: Colors.redAccent),
              SizedBox(height: 50),
              Container(height: 150, color: Colors.redAccent),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
