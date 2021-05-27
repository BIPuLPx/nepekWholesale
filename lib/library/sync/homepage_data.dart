import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:http/http.dart' as http;

class HomePageSync {
  Box _homePageBox = Hive.box('homeScreen');

  Future<void> getHomePageData() async {
    final response =
        await http.get(httpUri(peopleApi, 'homescreen/buyer/layouts'));
    final data = jsonDecode(response.body);
    _homePageBox.put('data', data);
  }

  Future<void> getCarousel() async {
    final response =
        await http.get(httpUri(peopleApi, 'homescreen/buyer/carousels'));
    final data = jsonDecode(response.body);
    _homePageBox.put('carousel', data);
  }
}
