import 'package:flutter/material.dart';

class WeatherModel {
  String weatherStateName;
  String applicableDate;
  double theTemp;
  double minTemp;
  double maxTemp;

  WeatherModel({
    required this.weatherStateName,
    required this.applicableDate,
    required this.theTemp,
    required this.minTemp,
    required this.maxTemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      weatherStateName: json['weather_state_name'],
      applicableDate: json['applicable_date'],
      theTemp: json['the_temp'],
      minTemp: json['min_temp'],
      maxTemp: json['max_temp'],
    );
  }

  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    }if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.blue;
    }if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return Colors.blueGrey;
    } else {
      return Colors.orange;
    }
  }
}
