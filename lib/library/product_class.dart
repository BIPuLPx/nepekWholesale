class Product {
  final Map product;

  Product(this.product);

  String get productName => product['productName'];

  String get id => product["_id"];

  String get uid => product['uid'];

  int get price => product['price'];

  int get oldPrice => product['oldPrice'];

  String get miniThumb => product['miniThumb'];

  String get off =>
      '${(((product['oldPrice'] - product['price']) * 100) / product['oldPrice']).toStringAsFixed(1)} % OFF';
}
