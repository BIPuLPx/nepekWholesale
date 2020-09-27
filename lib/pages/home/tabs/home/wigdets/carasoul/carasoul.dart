import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FrontCarasoul extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1,
          autoPlay: true,
          height: 100.0,
          autoPlayInterval: Duration(seconds: 5),
        ),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(color: Colors.green),
                  child: Text(
                    'text $i',
                    style: TextStyle(fontSize: 16.0),
                  ));
            },
          );
        }).toList(),
      ),
    );
  }
}

// class FrontCarasoul extends StatefulWidget {
//   @override
//   _FrontCarasoulState createState() => new _FrontCarasoulState();
// }

// class _FrontCarasoulState extends State<FrontCarasoul> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         padding: EdgeInsets.only(left: 15, right: 15),
//         // padding: EdgeInsets.only(top: 20,bottom: ),
//         // color: Colors.green,
//         // padding: EdgeInsets.only(top: 15),
//         // color: Colors.white,
//         height: 150,
//         width: double.infinity,
//         child: new Swiper(
//           curve: Curves.easeInOut,
//           duration: 500,

//           // containerHeight: 200,
//           autoplay: true,
//           // autoplayDelay: ,
//           itemBuilder: (BuildContext context, int index) {
//             // print(index);
//             return Container(
//               decoration:
//                   BoxDecoration(borderRadius: BorderRadius.circular(20)),
//               padding: EdgeInsets.only(top: 15, bottom: 15),
//               child: new Image.network(
//                 "http://via.placeholder.com/600x300",
//                 fit: BoxFit.fitWidth,
//               ),
//             );
//           },
//           itemCount: 6,
//           viewportFraction: 0.7,
//           scale: 1,
//           // pagination: ,
//           pagination: new SwiperPagination(
//             margin: EdgeInsets.only(bottom: 20),
//             builder: DotSwiperPaginationBuilder(
//               color: Colors.grey[350],
//               activeColor: AppColors().primaryBlue(),
//               space: 5,
//               size: 3,
//               activeSize: 5,
//             ),
//           ),
//           control: new SwiperControl(size: 0),
//         ),
//       ),
//     );
//   }
// }
