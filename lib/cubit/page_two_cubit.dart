import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstaj/repo/weather_dao.dart';

import '../entity/weather.dart';

class PageTwoCubit extends Cubit<List<WeatherModel>>{

  PageTwoCubit():super(<WeatherModel>[]);

  final _repo = WeatherDao(apiKey: "7b6ad88d11b66abc57257ca4417fe2a7");

  final arr = <WeatherModel> [];
  String img = "";
  Future<void> uploadWeather({@required String? city}) async{
    var weatherInfo = await _repo.getWeatherForLocation("${city ?? "konya"},tr");
    if(arr.isEmpty){
      arr.add(weatherInfo!);
    }else{
      arr.clear();
      arr.add(weatherInfo!);
    }
    emit(arr);
  }
}