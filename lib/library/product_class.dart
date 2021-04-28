class Product {
  final Map product;

  Product(this.product);

  String get productName => product['productName'];

  String get id => product["_id"];

  String get imgDir => product['imgDir'];

  String get imgUrl => product['imgUrl'];

  int get price => product['price'];

  int get oldPrice => product['oldPrice'];

  String get miniThumb => product['miniThumb'];

  String get off => product['oldPrice'] == null
      ? null
      : '${(((product['oldPrice'] - product['price']) * 100) / product['oldPrice']).toStringAsFixed(1)} % OFF';
}
