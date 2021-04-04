import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/container_with_shadow.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/pages/home/tabs/home/wigdets/advertisement/main.dart';
import 'package:nepek_buyer/pages/home/tabs/home/wigdets/carasoul/carasoul.dart';
import 'package:nepek_buyer/pages/home/tabs/home/appBar.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'wigdets/CategoryAndProducts/main.dart';
import 'wigdets/GridSubCategories/main.dart';
import 'wigdets/pricesDown/prices_down.dart';
import 'wigdets/product_slider/main.dart';
import 'package:random_color/random_color.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    RandomColor _randomColor = RandomColor();
    return SafeArea(
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: homeAppbar(context, darkTheme),
        body: Container(
          color: Colors.white,
          child: ListView(
            shrinkWrap: true,
            // physics: BouncingScrollPhysics(),
            cacheExtent: 10,
            addAutomaticKeepAlives: true,
            children: [
              FrontCarasoul(),
              HomeAd(),
              GridSubCategories(
                heading: "Winter Collections for Men",
                backgroundColor:
                    _randomColor.randomColor(colorHue: ColorHue.red),
                textColor: ColorHue.blue,
              ),
              // FeaturedSlider(),
              ProductsSlider(
                heading: 'Top Selling',
                backGroundColor: _randomColor.randomColor(
                  colorHue: ColorHue.green,
                  colorBrightness: ColorBrightness.veryLight,
                  // colorSaturation: ColorSaturation.lowSaturation,
                ),
                headingColor: Colors.black,
              ),
              PricesDown(),
              // HomeAd(),
              ProductsSlider(
                heading: 'Most Popular',
                backGroundColor: _randomColor.randomColor(
                  colorHue: ColorHue.yellow,
                  colorBrightness: ColorBrightness.veryLight,
                  // colorSaturation: ColorSaturation.lowSaturation,
                ),
                headingColor: Colors.black,
              ),
              CategoryAndProducts(
                heading: 'Mobile Phones',
                colorHue: ColorHue.purple,
              ),
              ProductsSlider(
                heading: 'Mens Shoes',
                backGroundColor: _randomColor.randomColor(
                  colorHue: ColorHue.red,
                  colorBrightness: ColorBrightness.veryLight,
                  // colorSaturation: ColorSaturation.lowSaturation,
                ),
                headingColor: Colors.black,
              ),
              CategoryAndProducts(
                heading: 'Digital Cameras',
                colorHue: ColorHue.purple,
              ),
              GridSubCategories(
                heading: "Smart Kitchen Tools",
                backgroundColor: _randomColor.randomColor(
                  colorHue: ColorHue.green,
                  colorBrightness: ColorBrightness.light,
                  // colorSaturation: ColorSaturation.highSaturation,
                ),
                textColor: ColorHue.red,
              ),
              CategoryAndProducts(
                heading: "Reusable Masks",
                colorHue: ColorHue.random,
              ),

              // HomeAd(),
              // HomeAd(),
              // HomeAd(),
              // ProductsSlider(
              //   heading: 'Covid Essentials',
              //   backGroundColor: Colors.greenAccent,
              // ),

              // CategoryCollectionGrid(),
              // // GridSubCategories(
              // //   heading: "Women's Winter Collections",
              // //   backGroundImage:
              // //       'https://images.ctfassets.net/hrltx12pl8hq/1fR5Y7KaK9puRmCDaIof7j/09e2b2b9eaf42d450aba695056793607/vector1.jpg',
              // // ),
              // ProductsSlider(
              //   heading: 'Womens Shoes',
              //   backGroundColor: Colors.deepOrange,
              //   headingColor: Colors.white,
              // ),
              // HomeAd()
            ],
          ),
        ),
      ),
    );
  }
}
