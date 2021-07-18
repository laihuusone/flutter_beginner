import 'dart:convert';
import 'package:flutter/services.dart';

class WeatherDetailModel {
  late int weatherDateTime;
  late String weatherDescription;
  late double weatherTemp;
  late double weatherDewPoint;
  late double weatherWindSpeed;
  late int weatherPressure;
  late int weatherHumidity;

  WeatherDetailModel({required this.weatherDateTime,
                      required this.weatherDescription,
                      required this.weatherTemp,
                      required this.weatherDewPoint,
                      required this.weatherWindSpeed,
                      required this.weatherPressure,
                      required this.weatherHumidity});

  WeatherDetailModel.fromJson(Map<String, dynamic> json) {
    weatherDateTime = json['dt'];
    weatherDescription = json['weather'][0]['description'];
    weatherTemp = json['temp']['day'];
    weatherDewPoint = json['dew_point'];
    weatherWindSpeed = json['wind_speed'];
    weatherPressure = json['pressure'];
    weatherHumidity = json['humidity'];
  }

  static Future<List<WeatherDetailModel>> readJsonData() async {
    final jsondata =
        await rootBundle.loadString("assets/datas/databydailyandhourly.json");
    Map map = jsonDecode(jsondata);
    List dailylist = map['daily'];
    return dailylist.map((e) => WeatherDetailModel.fromJson(e)).toList();
  }
}