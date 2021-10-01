import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:loading_overlay_pro/animations/bouncing_line.dart';
import 'package:provider/provider.dart';
import 'package:restaurants_shibin/api/provider/fetchrestprovider.dart';
import 'package:restaurants_shibin/widgets/Widget/rescard.dart';

class fullRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        backgroundColor: Colors.blue[50],
        body: Consumer<restProvider>(
          builder: (context, rest, child) {
            return SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "المطاعم",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontFamily: ArabicFonts.Lemonada,
                            package: 'google_fonts_arabic',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: 5,
                  ),
                  FutureBuilder(
                    future: rest.fetchResturant(),
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
                          List rest = snapchot.data.reversed.toList();

                          return Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.blue[50],
                            height: rest.length.toDouble() * 330,
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: rest.length,
                                itemBuilder: (context, index) {
                                  return ResCard(
                                    context: context,
                                    resm: rest[index],
                                  );
                                }),
                          );
                          break;
                      }
                    },
                  ),

                ],
              ),
            );
          },
        ));
  }
}
