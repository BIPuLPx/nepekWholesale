import 'package:flutter/material.dart';

class Navigate {
  final BuildContext homeContext;
  Navigate(this.homeContext);

  void navigate(data) {
    switch (data['page']) {
      case 'view_order':
        _vieworder(data);
        break;

      case 'view_qna':
        _viewQna(data);
        break;

      case 'view_review':
        _viewReview(data);
        break;

      case 'give_review':
        _giveReview(data);
        break;

      case 'returns':
        _returns();
        break;

      default:
        break;
    }
  }

  void _vieworder(data) =>
      Navigator.of(homeContext).pushNamed('view_order', arguments: {
        '_id': data['buySysID'],
      });

  void _viewQna(data) =>
      Navigator.of(homeContext).pushNamed('view_qna', arguments: data['qsnID']);

  void _viewReview(data) => Navigator.of(homeContext)
      .pushNamed('view_review', arguments: {'reviewID': data['reviewID']});

  void _giveReview(data) => Navigator.of(homeContext).pushNamed('give_review',
      arguments: {'id': data['buySysID'], 'refresh': () => print('refresh')});

  void _returns() => Navigator.pushNamed(homeContext, 'my_returns');

  // _viewOrder(data) =>
  //     Navigator.of(homeContext).pushNamed('view_order', arguments: {
  //       "orderKey": data['orderKey'],
  //       "product_key": data['product_key']
  //     });
}
