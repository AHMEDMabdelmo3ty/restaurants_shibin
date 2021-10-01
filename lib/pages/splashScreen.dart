import 'package:flutter/material.dart';
import 'package:restaurants_shibin/pages/startpoint/tips.dart';
import 'package:splashscreen/splashscreen.dart';

// ignore: camel_case_types
class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

// ignore: camel_case_types
class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SplashScreen(
            seconds: 2,
            navigateAfterSeconds: new Tips(),
            backgroundColor: Colors.blue[50],
            loaderColor: Colors.white),
        Image.asset(
          'asset/images/res21.gif',
          fit: BoxFit.cover,
          height: 900,
        ),
      ],
    ));
  }
}
