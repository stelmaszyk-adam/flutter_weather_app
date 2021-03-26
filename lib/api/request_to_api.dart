import 'dart:convert';

import 'package:weather_app/model/forecastModel.dart';
import 'package:weather_app/model/weatherModel.dart';
import 'package:http/http.dart' as http;

class RequestToApi {
  static Future<WeatherData> getWeatherData(String lat, String lon) async {
    final weatherResponse = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?APPID=0721392c0ba0af8c410aa9394defa29e&lat=${lat.toString()}&lon=${lon.toString()}');

    if (weatherResponse.statusCode == 200) {
      return new WeatherData.fromJson(jsonDecode(weatherResponse.body));
    } else {
      return null;
    }
  }

  static Future<ForecastData> getForecastData(String lat, String lon) async {
    final forecastResponse = await http.get(
        'https://api.openweathermap.org/data/2.5/forecast?APPID=0721392c0ba0af8c410aa9394defa29e&lat=${lat.toString()}&lon=${lon.toString()}');

    if (forecastResponse.statusCode == 200) {
      return new ForecastData.fromJson(jsonDecode(forecastResponse.body));
    } else {
      return null;
    }
  }
}
