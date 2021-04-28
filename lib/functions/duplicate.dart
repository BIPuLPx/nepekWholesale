import 'dart:convert';

duplicate(item) => jsonDecode(jsonEncode(item));
