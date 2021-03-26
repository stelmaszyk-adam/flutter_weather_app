import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/homeScreen.dart';
import 'package:weather_app/screens/splahScreen.dart';
import 'package:weather_app/theme/theme.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _WeatherAppState createState() => _WeatherAppState();

  static _WeatherAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_WeatherAppState>();
}

class _WeatherAppState extends State<WeatherApp> {
  // @override
  // void initState() {
  //   super.initState();
  //   _setModeListener();
  // }

  // _setModeListener() {
  //   currentTheme.addListener(() {
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: lighttheme(),
      darkTheme: darktheme(),
      themeMode: currentTheme.currentTheme(),
      // home: Splashscreen(),
      home: Homescreen(),
    );
  }
}
