import 'package:flutter/material.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/styles/network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeAd extends StatelessWidget {
  final String heading;
  final Map data;

  const HomeAd({Key key, this.data, this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _url = 'https://${data['url']}';
    void _launchURL() async => await canLaunch(_url)
        ? await launch(_url)
        : throw 'Could not launch $_url';

    _navigate() {
      print(data);
      if (heading == 'form')
        _launchURL();
      else
        switch (data['of']) {
          case 'webpage':
            Navigator.pushNamed(context, 'webview', arguments: {
              'title': heading,
              'url': _url,
            });
            break;

          case 'product':
            Navigator.pushNamed(context, 'view_product', arguments: {
              'product_id': data['_id'],
            });
            break;

          case 'subcategory':
            Navigator.pushNamed(context, 'result', arguments: {
              'type': 'subcategory',
              'query': data['_id'],
              'name': heading,
            });

            break;
          default:
        }
    }

    return GestureDetector(
      onTap: _navigate,
      child: Container(
        margin: EdgeInsets.only(bottom: 15, left: 10, right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: NepekImageNetwork(
            url: '$imgUrl/homeScreen/homeAd/${data['imgDir']}/${data['img']}',
            height: MediaQuery.of(context).size.height * 0.11,
            wide: true,
          ),
        ),
      ),
    );
  }
}
