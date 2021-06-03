import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/products/viewProduct/widgets/productQnas/nested/qna_layout.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/network_image.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:nepek_buyer/styles/text/trimName.dart';
import 'package:provider/provider.dart';

import '../provider.dart';

class ViewQnaDataLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ViewQnaProvider provider = Provider.of(context);
    final Map productData = provider.productData;

    _navigateToProduct() => Navigator.pushNamed(
          context,
          'view_product',
          arguments: {'product_id': productData['productID']},
        );
    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(height: 20),
          GestureDetector(
            onTap: _navigateToProduct,
            child: Align(
              alignment: Alignment.topRight,
              child: NepekImageNetwork(
                url: productData['image'],
                height: 200,
                width: 200,
              ),
            ),
          ),
          SizedBox(height: 20),
          NepekText(
            trimName(productData['name'], 50),
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          SizedBox(height: 20),
          QnaLayout(
            question: {
              'text': productData['question'],
              'date': productData['questionedIn'],
              'name': ''
            },
            answer: {
              'text': productData['answer'],
              'date': productData['answeredIn']
            },
            index: 0,
            length: 1,
          ),
          NepekButton(
            onClick: _navigateToProduct,
            label: 'See Product',
          )
        ],
      ),
    );
  }
}
