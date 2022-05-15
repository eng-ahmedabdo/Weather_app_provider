// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:my_weather/Providers/weather_provider.dart';
import 'package:my_weather/model/weather_model.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class WeatherScreen extends StatelessWidget {

   WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors:
            [
              Provider.of<WeatherProvider>(context).weatherData!.getThemeColor(),
              Provider.of<WeatherProvider>(context).weatherData!.getThemeColor()[300]!,
              Provider.of<WeatherProvider>(context).weatherData!.getThemeColor()[100]!,
            ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,

        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3,),
          Text('' , style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold
          ),),
          Text('updated at: ${Provider.of<WeatherProvider>(context).weatherData!.applicableDate}'  , style: TextStyle(
              fontSize: 20,
          ),),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(Provider.of<WeatherProvider>(context).weatherData!.getImage()),
              Text(Provider.of<WeatherProvider>(context).weatherData!.theTemp.toInt().toString() , style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
              ),),
              Column(
                children: [
                  Text('maxTemp :${Provider.of<WeatherProvider>(context).weatherData!.maxTemp.toInt()}'),
                  Text('minTemp :${Provider.of<WeatherProvider>(context).weatherData!.minTemp.toInt()}'),
                ],
              ),
            ],
          ),
          Spacer(),
          Text(Provider.of<WeatherProvider>(context).weatherData!.weatherStateName , style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
          ),),
          const Spacer(flex: 5,),
        ],
      ),
    );
  }
}
