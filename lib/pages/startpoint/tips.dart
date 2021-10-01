import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay_pro/animations/bouncing_line.dart';
import 'package:provider/provider.dart';
import 'package:restaurants_shibin/api/provider/fetchrestprovider.dart';

import '../homepage.dart';

class Tips extends StatefulWidget {
  @override
  _TipsState createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  @override
  Widget build(BuildContext context) {
    final fetData = Provider.of<restProvider>(context);

    double myheight = MediaQuery.of(context).size.height / 6;
    return Scaffold(
        body: Stack(children: [
      Image.asset(
        'asset/images/res21.gif',
        fit: BoxFit.cover,
        height: 900,
      ),
      Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FutureBuilder(
            future: fetData.setData(),
            // ignore: missing_return
            builder: (context, snapchot) {
              // ignore: missing_return

              switch (snapchot.connectionState) {
                case ConnectionState.active:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                  break;
                case ConnectionState.none:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                  break;
                case ConnectionState.waiting:
                  return LoadingBouncingLine.circle(
                    borderColor: Colors.cyan,
                    borderSize: 3.0,
                    size: 120.0,
                    backgroundColor: Colors.blue,
                    duration: Duration(milliseconds: 2000),
                  );
                  break;
                case ConnectionState.done:
                  return Container(
                    margin: EdgeInsets.all(25),
                    height: 70,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15.0),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => homePage()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(blurRadius: 50, color: Colors.green),
                          ],
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              ("عرض المطاعم"),
                              style: GoogleFonts.cairo(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[500]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                  break;
              }
            },
          ),
          SizedBox(
            height: 75,
          ),
        ],
      )),
    ]));
  }
}

class SingleTips extends StatelessWidget {
  final String title;
  final String info;
  final String image;

  SingleTips({this.title, this.info, this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            )),
        new Padding(
            padding: EdgeInsets.only(bottom: 70.0),
            child: Text(
              info,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
