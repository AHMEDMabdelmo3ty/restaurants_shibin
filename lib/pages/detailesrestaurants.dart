import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:restaurants_shibin/api/model/restmodel.dart';
import 'package:restaurants_shibin/api/provider/fetchrestprovider.dart';
import 'package:restaurants_shibin/utilltos/constants.dart';

class restDet extends StatefulWidget {
  final BuildContext context;
  final resModel resmod;
  final double loction;

  restDet(this.context, this.resmod, this.loction);

  @override
  _restDetState createState() => _restDetState();
}

class _restDetState extends State<restDet> {
  @override
  Widget build(BuildContext context) {
    final loc = Provider.of<restProvider>(context);
    final locMap =
        loc.distanceBetween(loc.latMap, loc.logMap, 30.256541, 31.9855500);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.6,
          child: (widget.resmod.coverPhoto != null)
              ? Image.network(
                  widget.resmod.coverPhoto,
                  fit: BoxFit.cover,
                )
              : Image.asset("images/null.jpg"),
        ),
        SingleChildScrollView(
          child: Transform.translate(
              offset: Offset(0, 450),
              child: Stack(
                children: [
                  Container(
                    height: 2200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            blurRadius: 90,
                            spreadRadius: 105),
                      ],
                    ),
                    padding: const EdgeInsets.all(1.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //صور المطعم
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 2.0, bottom: 10, left: 35, right: 35),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    " ${widget.resmod.address}   ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: ArabicFonts.Aref_Ruqaa,
                                        package: 'google_fonts_arabic',
                                        color: Colors.black),
                                  ),
                                  Icon(Icons.location_on_rounded,
                                      size: 29, color: Colors.green),
                                ],
                              )
                            ],
                          ),
                        ),
                        //اسم المطعم
                        Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 25, right: 25, bottom: 0),
                          child: Card(
                            elevation: 35,
                            color: Colors.grey[200],
                            shadowColor: Colors.green,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.green, width: 1)),
                              height: 75,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.motorcycle,
                                        size: 29,
                                        color: Colors.green,
                                      ),
                                      Text(
                                        widget.resmod.timedelivery,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: ArabicFonts.Aref_Ruqaa,
                                            package: 'google_fonts_arabic',
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Icon(Icons.restaurant,
                                          size: 29, color: Colors.green),
                                      Text(
                                        "متاح ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: ArabicFonts.Aref_Ruqaa,
                                            package: 'google_fonts_arabic',
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        widget.resmod.to,
                                        style: TextStyle(
                                            fontSize: 21,
                                            fontFamily: ArabicFonts.Aref_Ruqaa,
                                            package: 'google_fonts_arabic',
                                            color: Colors.green),
                                      ),
                                      Text(
                                        "الى ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: ArabicFonts.Aref_Ruqaa,
                                            package: 'google_fonts_arabic',
                                            color: Colors.black),
                                      ),
                                      Text(
                                        widget.resmod.from,
                                        style: TextStyle(
                                            fontSize: 21,
                                            fontFamily: ArabicFonts.Aref_Ruqaa,
                                            package: 'google_fonts_arabic',
                                            color: Colors.green),
                                      ),
                                      Text(
                                        "مواعيد العمل من الساعه",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: ArabicFonts.Aref_Ruqaa,
                                            package: 'google_fonts_arabic',
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ), //البيانات
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.all(50),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.green, blurRadius: 20)
                              ],
                              borderRadius: BorderRadius.circular(25),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                  color: Colors.green[500], width: 2)),
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  (" متر"),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: ArabicFonts.Cairo,
                                      package: 'google_fonts_arabic',
                                      color: Colors.black87),
                                ),
                                Text(
                                  (" ${locMap.floor()} "),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: ArabicFonts.Cairo,
                                      package: 'google_fonts_arabic',
                                      color: Colors.teal[900]),
                                ),
                                Text(
                                  (" يبعد عنك مسافة "),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: ArabicFonts.Cairo,
                                      package: 'google_fonts_arabic',
                                      color: Colors.black87),
                                ),
                              ],
                            ),
                          ),
                        ), //العناوين والارقام
                        Container(
                          margin: EdgeInsets.all(50),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.blue, blurRadius: 20)
                              ],
                              borderRadius: BorderRadius.circular(25),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                  color: Colors.blue[900], width: 2)),
                          child: TextButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    " الارقام والعناوين ",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: ArabicFonts.Aref_Ruqaa,
                                        package: 'google_fonts_arabic',
                                        color: Colors.black87),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.call,
                                    size: 30,
                                  ),
                                ],
                              ),
                              onPressed: () {
                                bottonshet(context, widget.resmod);
                              }),
                        ), //العناوين والارقام
                        Container(
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                  color: Colors.blue[900], width: 2)),
                          child: Text(
                            " المنيو ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 35,
                                fontFamily: ArabicFonts.Harmattan,
                                package: 'google_fonts_arabic',
                                color: Colors.black),
                          ),
                        ),

                        //المنيو
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Container(
                              height: 500,
                              child: Container(
                                  child: PhotoViewGallery.builder(
                                backgroundDecoration: BoxDecoration(
                                  color: Colors.blueGrey[600],
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                scrollPhysics: const BouncingScrollPhysics(),
                                builder: (BuildContext context, int index) {
                                  return PhotoViewGalleryPageOptions(
                                    imageProvider: NetworkImage(
                                      widget.resmod.menuImages[index].imageurl,
                                    ),
                                    initialScale:
                                        PhotoViewComputedScale.contained * 0.9,
                                    heroAttributes: PhotoViewHeroAttributes(
                                      tag: widget.resmod.menuImages[index],
                                    ),
                                  );
                                },
                                itemCount: widget.resmod.menuImages.length,
                                    loadingBuilder: (context, event) => Center(
                                      child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                       child: CircularProgressIndicator(
                                         value: event == null
                                          ? 0
                                          : event.cumulativeBytesLoaded /
                                              event.expectedTotalBytes,
                                    ),
                                  ),
                                ),
                              ))),
                        ) // صور المنيوهات
                        ,
                        Container(
                          margin: EdgeInsets.only(
                              left: 50, right: 25, top: 5, bottom: 10),
                          padding: EdgeInsets.only(left: 20, right: 44),
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                  color: Colors.blue[900], width: 2)),
                          child: Text(
                            " معرض الصور ",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 35,
                                fontFamily: ArabicFonts.Aref_Ruqaa,
                                package: 'google_fonts_arabic',
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Container(
                              child: Container(
                                  height: 500,

                                  child: PhotoViewGallery.builder(backgroundDecoration: BoxDecoration(
                                    color: Colors.blueGrey[600],borderRadius: BorderRadius.circular(25),
                                  ),
                                scrollPhysics: const BouncingScrollPhysics(),
                                builder: (BuildContext context, int index) {
                                  return PhotoViewGalleryPageOptions(
                                    imageProvider: NetworkImage(widget
                                        .resmod.photoGallery[index].imageurl),
                                    initialScale:
                                        PhotoViewComputedScale.contained * 0.9,
                                    heroAttributes: PhotoViewHeroAttributes(
                                        tag: widget.resmod.photoGallery[index]),
                                  );
                                },
                                itemCount: widget.resmod.photoGallery.length,
                                loadingBuilder: (context, event) => Center(
                                  child: Container(
                                    width: 20.0,
                                    height: 20.0,
                                    child: CircularProgressIndicator(
                                      value: event == null
                                          ? 0
                                          : event.cumulativeBytesLoaded /
                                              event.expectedTotalBytes,
                                    ),
                                  ),
                                ),
                              ))),
                        ),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(65, -120),
                    child: Text(
                      widget.resmod.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          color: Colors.black),
                    ),
                  ),
                ],
              )),
        )
      ],
    ));
  }
}

class Headerprofile extends StatelessWidget {
  final resModel resmod;

  const Headerprofile({Key key, this.resmod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                child: (resmod.coverPhoto != null)
                    ? Image.network(
                        resmod.coverPhoto,
                        fit: BoxFit.cover,
                      )
                    : Image.asset("images/null.jpg"),
              ),
              Transform.translate(
                  offset: Offset(250, 50),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          image: DecorationImage(
                              image: (resmod.profileimage != null)
                                  ? NetworkImage(resmod.profileimage)
                                  : AssetImage("images/null.jpg"),
                              fit: BoxFit.cover)),
                    ),
                  )),
              Transform.translate(
                  offset: Offset(80, 0),
                  child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        resmod.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: ArabicFonts.Harmattan,
                            package: 'google_fonts_arabic',
                            color: Colors.white),
                      ))),
            ],
          ),
        ],
      ),
    );
  }
}

void bottonshet(BuildContext context, resModel resmod) {
  showModalBottomSheet(
      backgroundColor: Color(0xff14213d),
      context: context,
      builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  image: DecorationImage(
                      image: (resmod.profileimage != null)
                          ? NetworkImage(resmod.coverPhoto)
                          : AssetImage("images/null.jpg"),
                      fit: BoxFit.cover)),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.facebook),
                    color: Colors.blue[900],
                    iconSize: 60,
                    focusColor: Colors.white,
                    highlightColor: Colors.white,
                    hoverColor: Colors.white,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.whatsapp),
                    color: Colors.green,
                    focusColor: Colors.white,
                    highlightColor: Colors.white,
                    hoverColor: Colors.white,
                    iconSize: 60,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.location_on_outlined),
                    color: Colors.white,
                    focusColor: Colors.blueAccent,
                    highlightColor: Colors.blueAccent,
                    hoverColor: Colors.indigo,
                    iconSize: 60,
                    onPressed: () {
                      url_launcher.launchInBrowser(resmod.location);
                    },
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.call),
                    color: Colors.white,
                    iconSize: 60,
                    focusColor: Colors.blueAccent,
                    highlightColor: Colors.blueAccent,
                    hoverColor: Colors.blueAccent,
                    onPressed: () {
                      url_launcher.makePhoneCall(resmod.mobileNumber);
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      });
}
