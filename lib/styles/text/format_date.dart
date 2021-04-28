import 'package:intl/intl.dart';

String formatDate(date) =>
    DateFormat.yMMMd('en_US').format(DateTime.parse(date).toLocal()).toString();
