import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api/provider/fetchrestprovider.dart';
import 'pages/splashScreen.dart';


void main() {

  runApp(

      ChangeNotifierProvider(
          create: (_) => restProvider(),
          child: MyApp())
  );

}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مطاعم شبين',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: splashScreen(),),
    );
  }
}
