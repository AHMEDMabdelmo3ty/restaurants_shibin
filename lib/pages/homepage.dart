import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:loading_overlay_pro/animations/bouncing_line.dart';
import 'package:provider/provider.dart';
import 'package:restaurants_shibin/api/model/iconsmodel.dart';
import 'package:restaurants_shibin/api/provider/fetchrestprovider.dart';
import 'package:restaurants_shibin/widgets/Widget/rescard.dart';
import 'package:restaurants_shibin/widgets/iconscard.dart';

import 'searchpage/searchpage.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final log = Provider.of<restProvider>(context);
    final orientation = MediaQuery.of(context).orientation;
    List<itamsModel> itams = [
      itamsModel(id: '1', name: 'بيتزا', imageUrl: 'asset/icons/pizza.png'),
      itamsModel(id: '2', name: 'برجر', imageUrl: 'asset/icons/burger.png'),
      itamsModel(
          id: '3', name: 'دليفري', imageUrl: 'asset/icons/food-delivery.png'),
      itamsModel(id: '4', name: 'عصائر', imageUrl: 'asset/icons/milkshake.png'),
      itamsModel(id: '5', name: 'كريب', imageUrl: 'asset/icons/taco.png'),
    ];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'delivering To',
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                Row(
                  children: [
                    Text(
                      'current Location',
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Colors.green[600],
                    )
                  ],
                )
              ],
            ),
          ),
          body: Consumer<restProvider>(
            builder: (context, rest, child) {
              return Container(
                padding: EdgeInsets.only(right: 10),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300], blurRadius: 8)
                                ],
                                border: Border.all(
                                    color: Colors.grey[600], width: 1),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.search,
                                        color: Colors.black,
                                        size: 35,
                                      ),
                                      Text(
                                        "بحث عن مطاعم",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey,
                                          fontFamily: ArabicFonts.Lemonada,
                                          package: 'google_fonts_arabic',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    print(log.latMap);

                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return searchPage();
                                    }));
                                  }),
                            ),
                          ),
                          Padding(
                            child: Icon(
                              Icons.filter_alt_outlined,
                              color: Colors.green[600],
                            ),
                            padding: EdgeInsets.all(15),
                          )
                        ],
                      ),
                      // SizedBox(
                      //     height: 200.0,
                      //     width: 350.0,
                      //     child: Carousel(
                      //       images: [
                      //         ExactAssetImage("asset/images/splash2.png"),
                      //         ExactAssetImage("asset/images/splash2.png"),
                      //         ExactAssetImage("asset/images/splash2.png"),
                      //         ExactAssetImage("asset/images/splash2.png"),
                      //       ],
                      //       dotSize: 4.0,
                      //       dotSpacing: 15.0,
                      //       dotColor: Colors.blue[100],
                      //       indicatorBgPadding: 5.0,
                      //       dotBgColor: Colors.blue[50],
                      //       borderRadius: true,
                      //       moveIndicatorFromBottom: 180.0,
                      //       noRadiusForIndicator: true,
                      //     )),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "الاقسام ",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 150,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return itameCard(
                                itams: itams[index],
                              );
                            }),
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "المطاعم المضافة حديثا",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: FutureBuilder(
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
                                    borderColor: Colors.green[600],
                                    borderSize: 3.0,
                                    size: 120.0,
                                    backgroundColor: Colors.green[600],
                                    duration: Duration(milliseconds: 2000),
                                  );
                                  break;
                                case ConnectionState.done:
                                  List rest = snapchot.data.reversed.toList();

                                  return Container(
                                    padding: EdgeInsets.all(5),
                                    color: Colors.green[50],
                                    height: rest.length.toDouble() * 330,
                                    child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: rest.length,
                                        itemBuilder: (context, index) {
                                          return ResCard(
                                            context: context,
                                            resm: rest[index],
                                            rating: 5,
                                          );
                                        }),
                                  );
                                  break;
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
