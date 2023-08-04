import 'dart:convert';

import 'package:http/http.dart';

import '../entity/weather.dart';


class WeatherDao {
  final String apiKey;

  WeatherDao({required this.apiKey});

  Future<WeatherModel?> getWeatherForLocation(String location) async {
    Uri url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': location,
      'appid': apiKey,
      'units': 'metric',
    });

    Response response = await get(url);
    if (response.statusCode != 200) {
      throw Exception('Request failed with status code ${response.statusCode}');
    }
    Map<String, dynamic> json = jsonDecode(response.body);
    WeatherModel weatherModel = WeatherModel.fromJson(json);
    return weatherModel;
  }
}