import 'package:flutter/material.dart';

class Navigate {
  final BuildContext homeContext;
  Navigate(this.homeContext);

  void navigate(data) {
    print(data);
    switch (data['page']) {
      case 'view_product':
        _viewProduct(data);
        break;

      case 'view_order':
        _vieworder(data);
        break;

      case 'answer':
        _answer(data);
        break;

      case 'reply_review':
        _replyReview(data);
        break;

      case 'transactions':
        _transactions(data);
        break;

      default:
        break;
    }
  }

  void _transactions(data) =>
      Navigator.of(homeContext).pushNamed('transactions');

  void _replyReview(data) =>
      Navigator.of(homeContext).pushNamed('reply_reviews', arguments: {
        'refresh': () => print('refresh'),
        'reviewID': data.review.ID
      });

  void _vieworder(data) =>
      Navigator.of(homeContext).pushNamed('view_order', arguments: {
        'order_id': data['buySysID'],
        "refreshOrders": () => print('refresh'),
      });

  void _answer(data) =>
      Navigator.of(homeContext).pushNamed('answer', arguments: {
        "_id": data['qnaID'],
        "refreshQna": () => print('refresh'),
      });

  void _viewProduct(data) =>
      Navigator.of(homeContext).pushNamed('view_product', arguments: {
        "productID": data['productID'],
        "refreshStore": () => print('refresh'),
      });

  // _viewOrder(data) =>
  //     Navigator.of(homeContext).pushNamed('view_order', arguments: {
  //       "orderKey": data['orderKey'],
  //       "product_key": data['product_key']
  //     });
}
