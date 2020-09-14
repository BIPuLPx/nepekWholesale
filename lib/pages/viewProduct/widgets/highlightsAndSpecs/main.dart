import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/highlightsAndSpecs/nested/product_highlights.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/highlightsAndSpecs/nested/product_specifications.dart';
import 'package:skite_buyer/styles/colors.dart';

class HighLightsAndSpecs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HighlightsAndSpecTopic(topic: 'Highlights'),
          ProductHighlights(),
          SizedBox(height: 20),
          HighlightsAndSpecTopic(topic: 'Specifications'),
          ProductSpecifications()
        ],
      ),
    );
  }
}

class HighlightsAndSpecTopic extends StatelessWidget {
  final String topic;
  HighlightsAndSpecTopic({this.topic});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 3),
      child: Text(
        topic,
        style: GoogleFonts.openSans(
          color: AppColors().primaryText(),
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }
}

// class HighLightsAndSpecs extends StatefulWidget {
//   @override
//   _HighLightsAndSpecsState createState() => _HighLightsAndSpecsState();
// }

// class _HighLightsAndSpecsState extends State<HighLightsAndSpecs>
//     with SingleTickerProviderStateMixin {
//   TabController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = new TabController(length: 2, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           height: 35,
//           color: Colors.white,
//           child: Stack(
//             fit: StackFit.passthrough,
//             alignment: Alignment.bottomCenter,
//             children: <Widget>[
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(color: Colors.grey, width: 2.0),
//                   ),
//                 ),
//               ),
//               TabBar(
//                 indicatorColor: AppColors().primaryBlue(),
//                 controller: _controller,
//                 labelStyle: GoogleFonts.openSans(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 15,
//                 ),
//                 labelColor: AppColors().primaryBlue(),
//                 unselectedLabelColor: AppColors().primaryText(),
//                 tabs: [
//                   Tab(
//                     text: 'Highlights',
//                   ),
//                   Tab(
//                     text: 'Specifications',
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         new Container(
//           // height: MediaQuery.of(context).size.height,
//           height: 150,
//           child: new TabBarView(
//             physics:
//                 BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
//             controller: _controller,
//             children: <Widget>[
//               ProductHighlights(),
//               Text('Specifications'),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
