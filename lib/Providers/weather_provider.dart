import 'package:flutter/cupertino.dart';
import 'package:my_weather/model/weather_model.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? _weatherData;

  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}
