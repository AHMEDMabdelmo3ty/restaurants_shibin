import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurants_shibin/api/provider/fetchrestprovider.dart';
import 'package:restaurants_shibin/widgets/Widget/rescard.dart';

class favRestaurant extends StatefulWidget {
  @override
  _favRestaurantState createState() => _favRestaurantState();
}

class _favRestaurantState extends State<favRestaurant> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        backgroundColor: Colors.blue[50],
        body: Consumer<restProvider>(
          builder: (context, rest, child) {
            return SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "  المطاعم المفضلة",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: ArabicFonts.Baloo_Bhaijaan,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    flex: 0,
                    child: Container(
                      child: FutureBuilder(
                        future: rest.fetchfavresturants(),
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
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                              break;
                            case ConnectionState.done:
                              List rest = snapchot.data.toList();

                              return Container(
                                padding: EdgeInsets.all(10),
                                color: Colors.blue[50],
                                height:
                                MediaQuery.of(context).size.height * 0.9,
                                child: GridView.builder(
                                    gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 10,
                                        crossAxisCount: (orientation ==
                                            Orientation.portrait)
                                            ? 2
                                            : 3),
                                    itemCount: rest.length,
                                    itemBuilder: (context, index) {
                                      return  Stack(children: [
                                        ResCard(
                                          context: context,
                                          resm: rest[index],
                                        ),
                                        Consumer<restProvider>(
                                            builder: (context, resta,child) {
                                              return ElevatedButton.icon(
                                                onPressed: () {

                                                  Provider.of<restProvider>(context,listen: false)
                                                      .favresturants
                                                      .remove(rest[index]);

                                                },
                                                icon: Icon(Icons.favorite),
                                                label: Text('f'),
                                              );
                                            }
                                        ),
                                      ],

                                      );;
                                    }),
                              );
                              break;
                          }
                        },
                      ),
                    ),
                  ),

                ],
              ),
            );
          },
        ));
  }
}
