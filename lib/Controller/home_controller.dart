import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Weather/weather_model.dart';

class HomeXController extends GetxController {
  final searchController = TextEditingController().obs;

  Future<WeatherModels> getWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=islamabad&appid=776745ec8bd02ca7e84c1fec3b94c889'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return WeatherModels.fromJSON(data);
    } else {
      throw ('Error');
    }
  }
}
