import 'package:nepek_buyer/savedData/user_data.dart';

tokenHeader() => {
      "Authorization": 'Bearer ${UserPreferences().getJwtToken()}',
    };

tokenHeaderContentType() => {
      "Content-Type": "application/json",
      "Authorization": 'Bearer ${UserPreferences().getJwtToken()}',
    };

contentTypeHeader() => {"Content-Type": "application/json"};
