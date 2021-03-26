import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/api/request_to_api.dart';
import 'package:weather_app/model/forecastModel.dart';
import 'package:weather_app/model/weatherModel.dart';
import 'package:weather_app/theme/theme.dart';
import 'package:weather_app/widgets/weather.dart';
import 'package:weather_app/widgets/weatherItem.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool _isLoading = false;
  WeatherData _weatherData;
  ForecastData _forecastData;

  loadWeather() async {
    setState(() {
      _isLoading = true;
    });
    Position position;
    try {
      position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    } catch (e) {
      print(e);
    }

    if (position != null) {
      String lat = position.latitude.toString();
      String lon = position.longitude.toString();

      ForecastData forecastResponse =
          await RequestToApi.getForecastData(lat, lon);
      WeatherData weatherResponse = await RequestToApi.getWeatherData(lat, lon);

      setState(() {
        _weatherData = weatherResponse;
        _forecastData = forecastResponse;
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    // loadWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Current Location Weather'),
      // ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: _weatherData != null
                  //       ? Weather(weather: _weatherData)
                  //       : Container(),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _isLoading
                        ? CircularProgressIndicator(
                            strokeWidth: 2.0,
                            // valueColor:
                            //     new AlwaysStoppedAnimation(Colors.white),
                          )
                        : IconButton(
                            icon: new Icon(Icons.refresh),
                            tooltip: 'Refresh',
                            onPressed: loadWeather,
                            color: Colors.white,
                          ),
                  ),
                ],
              ),
            ),
            // // SafeArea(
            // //   child:
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     height: 200.0,
            //     child: _forecastData != null
            //         ? ListView.builder(
            //             itemCount: _forecastData.list.length,
            //             // scrollDirection: Axis.horizontal,
            //             itemBuilder: (context, index) => WeatherItem(
            //                 weather: _forecastData.list.elementAt(index)))
            //         : Container(),
            //   ),
            // ),
            // // ),
          ],
        ),
      ),
      // floatingActionButton: Align(
      //   alignment: Alignment.topRight,
      //   child: Padding(
      //     padding: const EdgeInsets.only(right: 15,top: 150),
      //     child: FloatingActionButton(
      //       heroTag: "btn3",
      //       onPressed: () {
      //         currentTheme.switchTheme();
      //       },
      //       child: Icon(
      //         Icons.wb_sunny,
      //         color: Colors.black,
      //       ),
      //       backgroundColor: Colors.white,
      //     ),
      //   ),
      // ),
    );
  }
}
