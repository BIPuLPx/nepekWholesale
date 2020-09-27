import 'package:flutter/material.dart';
import 'package:skite_buyer/styles/colors.dart';

class FeaturedSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: [
              Text(
                'Skite Plus',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 110,
          child: ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            children: [
              BrandsContainer(text: 'Apple'),
              BrandsContainer(text: 'Samsung Electronics'),
              BrandsContainer(text: 'Huawei'),
              BrandsContainer(text: 'LG'),
              BrandsContainer(text: 'Dulla'),
              BrandsContainer(text: 'KTM CTY'),
              BrandsContainer(text: 'sdf'),
              BrandsContainer(text: 'sdf'),
              BrandsContainer(text: 'sdf'),
              BrandsContainer(text: 'sdf'),
              BrandsContainer(text: 'sdf'),
            ],
          ),
        ),
      ],
    );
  }
}

class BrandsContainer extends StatelessWidget {
  final String text;

  const BrandsContainer({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors().primaryYellow(),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
      height: 100,
      width: 150,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors().primaryBlue(),
            letterSpacing: 1.1,
          ),
        ),
      ),
    );
  }
}
