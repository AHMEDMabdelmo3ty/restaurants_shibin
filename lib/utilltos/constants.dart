
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// الوان البرنامج الرائيسية
final mainDarkBluColor =Color(0xff0756ff);
final mainlightBluColor =Colors.blue[600];
final mainwhiteColor =Color(0xfffff9ee);
final mainOrangeColor =Color(0xffe36414);
final mainblackColor =Color(0xff404040);
final mainRedColor =Color(0xff9a031e);
final mainDarkRedColor =Color(0xff5f0f40);
final mainDarkGreyColor =Color(0xff14213d);

// url in project

class url_launcher {
  static Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchInWebViewWithDomStorage(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableDomStorage: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchUniversalLinkIos(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(
          url,
          forceSafariVC: true,
        );
      }
    }
  }

  static Future<void> makePhoneCall(String url) async {
    if (await canLaunch('tel:$url')) {
      await launch('tel:$url');
    } else {
      throw 'Could not launch $url';
    }
  }
}


class TextRes extends StatelessWidget{
  final String string ;
  final Color color ;
  final double fontsize ;

  const TextRes({ this.string, this.color, this.fontsize}) ;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Text(string,
      style: new TextStyle(

          color: color,
          fontFamily: ArabicFonts.Cairo,
          package: 'google_fonts_arabic',
          fontWeight: FontWeight.bold,
          fontSize: fontsize
      ),);
  }
}


 final main_URL ="https://shibinrest.herokuapp.com/";
//final main_URL ="https://10.0.0.2:1337/";

final search_URL = "https://shibinrest.herokuapp.com/Resturants?name_contains=";