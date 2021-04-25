import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/button/nepek_icon_button.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/network_image.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

class ViewImageFull extends StatelessWidget {
  final args;

  const ViewImageFull({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewImageProvider(),
      child: ViewImageFullRoot(args: args),
    );
  }
}

class ViewImageFullRoot extends StatelessWidget {
  final args;
  const ViewImageFullRoot({Key key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(args);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            child: PhotoViewGallery.builder(
          backgroundDecoration: BoxDecoration(
            color: Colors.white,
          ),
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(
                  '${args['url']}/productImages/${args['imgDir']}/images/${args['imgs'][index]}'),
              initialScale: PhotoViewComputedScale.contained * 0.9,
              maxScale: 1.1,
              minScale: 0.4,
              heroAttributes: PhotoViewHeroAttributes(tag: args['imgs'][index]),
            );
          },
          itemCount: args['imgs'].length,
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: 50.0,
              height: 50.0,
              child:
                  // NepekImageNetwork('images/image_placeholder-min.png')
                  CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors().officialMatch(),
                ),
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes,
              ),
            ),
          ),
          // backgroundDecoration: widget.backgroundDecoration,
          // pageController: widget.pageController,
          // onPageChanged: onPageChanged,
        )),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: 10),
        child: NepekIconButton(
          Icons.close_rounded,
          size: 8,
          reversed: true,
          onClick: () => Navigator.pop(context),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
