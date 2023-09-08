import 'dart:convert';

import 'package:weather_app_project/Weather/detailed_hourly_model.dart';
import 'package:weather_app_project/Weather/hourly_model.dart';
import 'package:weather_app_project/Weather/weather_model.dart';
import 'package:http/http.dart' as http;

class IslamabadWeather {
  Future<WeatherModels> getWeather(String name) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$name&appid=776745ec8bd02ca7e84c1fec3b94c889'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return WeatherModels.fromJSON(data);
    } else {
      throw ('something went wrong');
    }
  }
}

class NewYorkWeather {
  Future<WeatherModels> getWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=london&appid=776745ec8bd02ca7e84c1fec3b94c889'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      return WeatherModels.fromJSON(data);
    } else {
      throw ('something went wrong');
    }
  }
}

class HourlyF {
  Future<List<HourlyForecast>> getHourly() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=london&appid=776745ec8bd02ca7e84c1fec3b94c889'));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body.toString());
      List<dynamic> data = jsonData['list'];
      List<HourlyForecast> forcasts =
          data.map((e) => HourlyForecast.fromJson(e)).toList();
      return forcasts;
    } else {
      throw 'Error';
    }
  }
}

class LondonForecast {
  Future<Hourly> getDetailedHourly() async{
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=london&appid=776745ec8bd02ca7e84c1fec3b94c889'));
    if(response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return Hourly.fromJSON(data);
    }else{
      throw 'Error';
    }
  }
}


class IslamabadUpdate {
  Future<Hourly> getHourly(String name) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$name&appid=776745ec8bd02ca7e84c1fec3b94c889'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      return Hourly.fromJSON(data);
    } else {
      throw ("something went wrong");
    }
  }
}

class ForecastIslamabad {
  Future<List<HourlyForecast>> getHourlyForecast(String controller) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$controller&appid=776745ec8bd02ca7e84c1fec3b94c889'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['list'];

      List<HourlyForecast> forecasts =
      data.map((dynamic item) => HourlyForecast.fromJson(item)).toList();

      return forecasts;
    } else {
      throw ('something went wrong');
    }
  }
}

class LondonHourly {
  Future<Hourly> getHourly() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=london&appid=776745ec8bd02ca7e84c1fec3b94c889'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      return Hourly.fromJSON(data);
    } else {
      throw ("something went wrong");
    }
  }
}