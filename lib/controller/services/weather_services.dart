import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_weather/model/weather_model.dart';

import '../../constants.dart';

class WeatherServices {
  Future<int> getCityId({required String cityName}) async {
    //parse => convert email string to url
    Uri url = Uri.parse('$baseUrl/api/location/search/?query=$cityName');
    // I used (async and await) because http.get(url) return Future<String>
    http.Response response = await http.get(url);
    List<dynamic> data = jsonDecode(response.body);
    int cityId = data[0]['woeid'];
    return cityId;
  }

  Future<WeatherModel> getWeather({required String cityName}) async {
    int id = await getCityId(cityName: cityName);
    Uri url = Uri.parse('$baseUrl/api/location/$id/');
    http.Response response = await http.get(url);
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    Map<String, dynamic> data = jsonData['consolidated_weather'][0];
    WeatherModel weatherData = WeatherModel.fromJson(data);
    return weatherData;
  }
}
