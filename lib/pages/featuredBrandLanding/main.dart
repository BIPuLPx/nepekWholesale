import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/featuredBrandLanding/appBar.dart';
import 'package:skite_buyer/pages/featuredBrandLanding/widgets/full_image_and_longer.dart';
import 'package:skite_buyer/pages/featuredBrandLanding/widgets/single_image_across.dart';
import 'package:skite_buyer/pages/featuredBrandLanding/widgets/two_images_across.dart';

class FeaturedBrandLanding extends StatelessWidget {
  final args;

  const FeaturedBrandLanding({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: featuredAppBar(context),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), 
            children: [
              SizedBox(height: 10),
              SingleImageAcross(
                imgUrl:
                    'https://k.nooncdn.com/cms/pages/20200929/88c05aa8740046bcc9e90334d7ecaf0e/en_slider-01.png',
              ),
              TwoImagesAcross(
                imgUrl:
                    'https://k.nooncdn.com/cms/pages/20200925/438d0104559bc73785e46e1e6db1d270/en_fashion-02.jpg',
                imgUrl1:
                    'https://k.nooncdn.com/cms/pages/20200925/438d0104559bc73785e46e1e6db1d270/en_fashion-03.jpg',
              ),
              FullWidthAndLonger(
                imgUrl:
                    'https://k.nooncdn.com/cms/pages/20200925/438d0104559bc73785e46e1e6db1d270/en_fragrances-01.jpg',
              ),
              FullWidthAndLonger(
                imgUrl:
                    'https://k.nooncdn.com/cms/pages/20200925/438d0104559bc73785e46e1e6db1d270/en_fragrances-01.jpg',
              ),
              SingleImageAcross(
                imgUrl:
                    'https://k.nooncdn.com/cms/pages/20200929/88c05aa8740046bcc9e90334d7ecaf0e/en_slider-01.png',
              ),
              TwoImagesAcross(
                imgUrl:
                    'https://k.nooncdn.com/cms/pages/20200925/438d0104559bc73785e46e1e6db1d270/en_fashion-02.jpg',
                imgUrl1:
                    'https://k.nooncdn.com/cms/pages/20200925/438d0104559bc73785e46e1e6db1d270/en_fashion-03.jpg',
              ),
              TwoImagesAcross(
                imgUrl1:
                    'https://k.nooncdn.com/cms/pages/20200925/438d0104559bc73785e46e1e6db1d270/en_fashion-02.jpg',
                imgUrl:
                    'https://k.nooncdn.com/cms/pages/20200925/438d0104559bc73785e46e1e6db1d270/en_fashion-03.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
