// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:my_weather/Providers/weather_provider.dart';
import 'package:my_weather/controller/services/weather_services.dart';
import 'package:my_weather/model/weather_model.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  String? cityName;

  SearchScreen({this.updateUi});

  VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search a City'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: TextField(
              onSubmitted: (data) async {
                cityName = data;
                WeatherServices service = WeatherServices();
                WeatherModel weather =
                    await service.getWeather(cityName: cityName!);
                Provider.of<WeatherProvider>(context , listen: false).weatherData = weather;
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                label: Text('Search'),
                hintText: 'Enter City Name',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ));
  }
}
