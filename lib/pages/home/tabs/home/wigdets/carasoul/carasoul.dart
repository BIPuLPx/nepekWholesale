import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/styles/network_image.dart';

class FrontCarasoul extends StatefulWidget {
  final data;

  const FrontCarasoul({Key key, this.data}) : super(key: key);
  @override
  _FrontCarasoulState createState() => _FrontCarasoulState();
}

class _FrontCarasoulState extends State<FrontCarasoul> with AutomaticKeepAliveClientMixin {
  // final List images = [
  //   "https://k.nooncdn.com/cms/pages/20200716/abf4444484c38bb83b7904fd0da79641/en_slider-01.gif",
  //   "https://k.nooncdn.com/cms/pages/20200716/ce62ea4055d312dad38b0c6fee2aed94/en_slider-01.gif",
  //   "https://k.nooncdn.com/cms/pages/20200716/0fcc704bdebf9f3f841a899468ed9e06/en_slider-01.gif"
  // ];

  int currentIndex = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    _goto(data) {
      final page = data['goto'];
      final value = data['val']['val'];

      switch (page) {
        case 'webpage':
          Navigator.pushNamed(
            context,
            'webview',
            arguments: {'title': data['heading'], 'url': 'https://$value'},
          );
          break;
        case 'product':
          Navigator.pushNamed(
            context,
            'view_product',
            arguments: {'product_id': value},
          );
          break;

        case 'classification':
          Navigator.pushNamed(
            context,
            'result',
            arguments: {
              'type': 'subcategory',
              'query': value,
              'name': data['heading'],
            },
          );
          break;
        default:
      }
    }

    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 3,
            autoPlay: true,
            height: MediaQuery.of(context).size.width * 0.2929,
            // width: MediaQuery.of(context).size.width,,
            autoPlayInterval: Duration(seconds: 4),
            initialPage: currentIndex,
            // autoPlayAnimationDuration: Duration(milliseconds: 500),
          ),
          items: widget.data.map<Widget>((data) {
            return Builder(
              builder: (BuildContext context) {
                // print(widget.data.indexOf(data));
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GestureDetector(
                    onTap: () => _goto(data),
                    child: NepekImageNetwork(
                      wide: true,
                      height: MediaQuery.of(context).size.width * 0.2929,
                      width: MediaQuery.of(context).size.width,
                      url: '$imgUrl/homeScreen/carousel/${data['imgDir']}/${data['img']}',
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
