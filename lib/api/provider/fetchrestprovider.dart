import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart'as http;
import 'package:restaurants_shibin/api/model/restmodel.dart';
import 'package:restaurants_shibin/utilltos/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class restProvider with ChangeNotifier{
  double latMap;
  double logMap;

  TextEditingController searchtextEditingController = TextEditingController();
  String inputvalu='';
List<resModel> favresturants =[];
  List<resModel> resturants =[];
  Future<List<resModel>> fetchfavresturants() async {
    return await favresturants;
  }

  Future<List<resModel>> fetchResturant() async {

    var url = Uri.parse(main_URL+'Resturants/');
    http.Response response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      List<resModel> resturants =[];
      for (var restaurant in body) {
        resturants.add(resModel.fromJson(restaurant));
      }

      return resturants.toList();

    } else {
    }
    notifyListeners();
  }

  Future<List<resModel>> fetchSearchrestaurant() async {

    String inputvalu = searchtextEditingController.toString();
    http.Response response = await http.get(Uri.parse(search_URL+inputvalu));
    if (response.statusCode == 200) {
      var body =jsonDecode(response.body);
      List <resModel> restaurants =[];
      for (var restaurant in body){
        restaurants.add(resModel.fromJson(restaurant));

      }
      return restaurants.toList();

    }
    notifyListeners();
  }

  Future<double> Positionlat() async {
    Position position = await Geolocator.getCurrentPosition();


    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('lat', position.latitude.toDouble());
    return position.latitude;

  }

  Future<double> Positionlog() async {
    Position position = await Geolocator.getCurrentPosition();
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('log',  position.longitude.toDouble());
    return  position.longitude.toDouble();


  }

  Future<void> setData()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  latMap= prefs.getDouble('lat')??0.0;
 logMap= prefs.getDouble('log')??0.0;


}

  double distanceBetween(
      double startLatitude,
      double startLongitude,
      double endLatitude,
      double endLongitude,
      ) {
    _toRadians(double degree) {
      return degree * pi / 180;
    }

    var earthRadius = 6378137.0;
    var dLat = _toRadians(endLatitude - startLatitude);
    var dLon = _toRadians(endLongitude - startLongitude);

    var a = pow(sin(dLat / 2), 2) +
        pow(sin(dLon / 2), 2) *
            cos(_toRadians(startLatitude)) *
            cos(_toRadians(endLatitude));
    var c = 2 * asin(sqrt(a));
    return earthRadius * c;
  }

}