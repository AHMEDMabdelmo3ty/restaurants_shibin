import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurants_shibin/api/fetchData.dart';
import 'package:restaurants_shibin/api/provider/fetchrestprovider.dart';
import 'package:restaurants_shibin/utilltos/constants.dart';
import 'package:restaurants_shibin/widgets/Widget/rescard.dart';

// ignore: camel_case_types
class searchPage extends StatefulWidget {
  @override
  _searchPageState createState() => _searchPageState();
}

// ignore: camel_case_types
class _searchPageState extends State<searchPage> {
  TextEditingController _searchtextEditingController = TextEditingController();
  String inputvalu = "";
  fetchDate _fetchData = fetchDate();

  @override
  void dispose() {
    _searchtextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text('عن ماذا تبحث ؟',
            style: TextStyle(
            fontSize: 35,
            fontFamily: ArabicFonts.Mada,
            package: 'google_fonts_arabic',
            color: Colors.white),

        ),
        centerTitle: true,
      ),
      body: Consumer<restProvider>(
    builder: (context, rest, child) {


      return SingleChildScrollView(

        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              color: Colors.grey[200],
              child: TextFormField(
                controller: _searchtextEditingController,
                onChanged: (String _searchtextEditingController) {
                  setState(() {
                    inputvalu = _searchtextEditingController;
                  });
                },
                decoration: InputDecoration(
                  counterStyle:  TextStyle(
                    fontSize: 35,
                    fontFamily: ArabicFonts.Aref_Ruqaa,
                    package: 'google_fonts_arabic',
                    color: Colors.black),
                    hintText: "ابحث عن ما تريد ",
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.search,
                      color: mainDarkBluColor,
                    )),
              ),
            ),

            Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: FutureBuilder(
                          future:  _fetchData.fetchSearchrestaurant(inputvalu),
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
                                  height: MediaQuery.of(context).size.height * 0.85,
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
                      )
                    ],
                  ),
                )),

          ],
        ),
      );})
    );
  }
}
