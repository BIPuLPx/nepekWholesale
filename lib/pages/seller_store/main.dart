import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/library/product_class.dart';
import 'package:nepek_buyer/pages/seller_store/widgets/deals/prices_down.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/container_with_shadow.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/styles/font_styles.dart';
import 'package:provider/provider.dart';

import 'widgets/product_slider/main.dart';

class SellerStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Scaffold(
      appBar: defaultAppBar(context, 'Seller Store Name', darkTheme),
      backgroundColor: darkTheme ? Colors.black : Colors.white,
      body: ListView(
        children: [
          ProductsSlider(heading: 'Top Selling'),
          Deals(),
          ProductsSlider(heading: 'Popular'),
          Products()
        ],
      ),
    );
  }
}

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeFonts().heading('Products'),
          Center(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                ProductContainer(product: testProduct),
                ProductContainer(product: testProduct),
                ProductContainer(product: testProduct),
                ProductContainer(product: testProduct),
                ProductContainer(product: testProduct),
                ProductContainer(product: testProduct),
                ProductContainer(product: testProduct),
                ProductContainer(product: testProduct),
                ProductContainer(product: testProduct),
                ProductContainer(product: testProduct),
                ProductContainer(product: testProduct),
                ProductContainer(product: testProduct),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final testProduct = {
  'productName':
      "Test for sale and nothing fbhjhbnsdf uisdhf hsdfjhhdfs hsdfhnkdfsjh hdfskuidfis kuhjdfskuhkfds khsfdjudhfs ksdfjuhkhfdks",
  'price': 1000,
  'oldPrice': 1500
};

class ProductContainer extends StatelessWidget {
  final product;
  const ProductContainer({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.45;

    final Product _product = Product(product);
    String of;

    if (_product.oldPrice != null) {
      if (_product.oldPrice > _product.price) {
        of = _product.off;
      }
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.38,
      // color: Colors.white,
      // margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(5),
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 2,
          color: Colors.grey.shade200,
        ),
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Column(
            children: [
              ProductImage(),
              SizedBox(height: 5),
              _name(_product.productName),
              SizedBox(height: 10),
              // )
            ],
          ),
          _price(_product.price, _product.oldPrice),
          of == null ? Container() : _perOff(_product.off),
        ],
      ),
    );
  }
}

Positioned _perOff(String of) {
  return Positioned(
    right: -5,
    top: -5,
    child: ShadowContainer(
      shadowColor: AppColors.officialMatch,
      blurRadius: 0.5,
      spreadRadius: 0.05,
      offset: Offset(-1, 1),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        color: AppColors.officialMatch,
        child: Text(
          of,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}

Text _name(name) {
  return Text(
    sliceLongName(name),
    style: GoogleFonts.poppins(
      // fontWeight: FontWeight.w400,
      fontSize: 13,
    ),
  );
}

Positioned _price(price, oldPrice) {
  return Positioned(
    bottom: 0,
    left: 0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'NPR  ',
              style: GoogleFonts.poppins(
                fontSize: 12,
                // fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${price.toString()}.00',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        oldPrice > price
            ? Text(
                'NPR  ${oldPrice.toString()}.00',
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.lineThrough,
                ),
              )
            : Container(),
      ],
    ),
  );
}

String sliceLongName(String name) {
  if (name.length > 35) {
    return name.substring(0, 32) + '.....';
  }
  return name;
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: 150,
            // width: 120,
          ),
        ),
        Image.network(
          'https://placeimg.com/500/500/any',
        ),
      ],
    );
  }
}
