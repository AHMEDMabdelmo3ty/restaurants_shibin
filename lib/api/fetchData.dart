import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurants_shibin/utilltos/constants.dart';

import 'model/restmodel.dart';

class fetchDate {
  Future<List<resModel>> fetchResturant() async {

    var url = Uri.parse('https://shibinrest.herokuapp.com/Resturants/');
    http.Response response = await http.get(
      url,
    );
    print(response);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      List<resModel> resturants =[];
      print(body);
      for (var restaurant in body) {
        resturants.add(resModel.fromJson(restaurant));
      }
      return resturants;
    } else {
    }
  }

  Future<List<resModel>> fetchSearchrestaurant(String restaurant) async {
    http.Response response = await http.get(Uri.parse(search_URL+restaurant));
    if (response.statusCode == 200) {
      var body =jsonDecode(response.body);
      List <resModel> restaurants =[];
      for (var restaurant in body){
        restaurants.add(resModel.fromJson(restaurant));

      }
      return restaurants;

    }
  }
}
