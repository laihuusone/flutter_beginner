import 'dart:convert';
import 'package:flutter/services.dart';

class WeatherModel {
  late String weatherMain;
  late String weatherDescription;
  late String weatherBase;
  late int weatherTemp;

  WeatherModel({required this.weatherMain, required this.weatherDescription, required this.weatherBase, required this.weatherTemp});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    weatherMain = json['weather'][0]['main'];
    weatherDescription = json['weather'][0]['description'];
    weatherBase = json['base'];
    weatherTemp = json['main']['temp'];
  }

  static Future<List<WeatherModel>> readJsonData() async {
    final jsondata =
        await rootBundle.loadString("assets/datas/datalatlong.json");
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => WeatherModel.fromJson(e)).toList();
  }

}