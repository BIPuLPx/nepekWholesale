import 'package:intl/intl.dart';

String formatPrice(price) {
  final length = price is String ? price.length : price.toString().length;

  var doubleFormatter = NumberFormat('##,##,##,000.00');
  var formatter = NumberFormat('##,##,##,000');
  final number = (price is int) ? true : isNumeric(price);
  if (price is String) {
    if (number)
      price = int.parse(price);
    else if (!number) price = double.parse(price);
  }

  final formattedPrice =
      number ? formatter.format(price) : doubleFormatter.format(price);

  if (length > 2)
    return 'NPR $formattedPrice';
  else
    return 'NPR $price';
}

String formatPriceInput(price) {
  var formatter = NumberFormat('##,##,##,000');
  if (price is String) price = int.parse(price);
  final formattedPrice = formatter.format(price);
  return formattedPrice.toString();
}

bool isNumeric(s) {
  if (s == null) {
    return false;
  }
  return int.tryParse(s) != null;
}
