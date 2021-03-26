import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/homeScreen.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Tween<double> tween = Tween(begin: 0.0, end: 1.0);

  @override
  Widget build(BuildContext context) {
    Size size = Get.mediaQuery.size;
    return Scaffold(
        body: Center(
      child: TweenAnimationBuilder(
        duration: const Duration(seconds: 4),
        tween: tween,
        builder: (BuildContext context, double opacity, Widget child) {
          return Opacity(
            opacity: opacity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: size.width * 0.26,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Weather ',
                    style: Get.theme.textTheme.headline4,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Forecast',
                        style: Get.theme.textTheme.headline5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        // onEnd: () {
        //   Get.off(Homescreen());
        // },
      ),
    ));
  }
}