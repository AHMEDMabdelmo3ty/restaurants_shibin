import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurants_shibin/api/model/restmodel.dart';
import 'package:restaurants_shibin/pages/detailesrestaurants.dart';
import 'package:restaurants_shibin/utilltos/constants.dart';

class ResCard extends StatelessWidget {
  final BuildContext context;
  final resModel resm;
  final int rating;

  const ResCard({ this.context, this.resm, this.rating});

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Card(
        elevation: 10,
        borderOnForeground: true,
        shadowColor: Colors.indigo,
        color: Colors.grey[100],
        child: InkWell(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(25),
          ),
          child: Container(
            padding: EdgeInsets.all(5),
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: mq.width * 0.9,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(25),
                      ),
                      image: DecorationImage(
                          image: (resm.coverPhoto != null)
                              ? NetworkImage(
                                  resm.coverPhoto,
                                )
                              : AssetImage("asset/images/splash2.jpg"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 5,
                ),

                Row(children: [Container(
                  padding: EdgeInsets.only(right: 10),
                  child: TextRes(
                      string: resm.name, color: Colors.black, fontsize: 20),
                ),

                  Spacer(),
                  SizedBox(width: 50,),
                ],),
                SizedBox(
                  height: 2,
                ),
                Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        TextRes(
                            string: resm.Items,
                            color: Colors.grey,
                            fontsize: 17), Spacer(),


                        Row(
                          children: <Widget>[
                            getStar(rating, 1),
                            getStar(rating, 2),
                            getStar(rating, 3),
                            getStar(rating, 4),
                            getStar(rating, 5)
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => restDet(context, resm, 5)));
          },
        ),
      ),
    );
  }
  Widget getStar(rating, index) {
    if (rating >= index) {
      return Icon(Icons.star, color: Color(0xffFF9A0D));
    } else {
      return Icon(Icons.star, color: Colors.grey.withOpacity(0.5));
    }

  }
}
