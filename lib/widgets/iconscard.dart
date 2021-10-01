import 'package:flutter/material.dart';
import 'package:restaurants_shibin/api/model/iconsmodel.dart';
import 'package:restaurants_shibin/pages/fullrestaurants.dart';

class itameCard extends StatelessWidget {
  final itamsModel itams;

  const itameCard({ this.itams});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.green[100],
            ),
            child: Image.asset(itams.imageUrl,width: 50,height: 50,cacheHeight: 75,cacheWidth: 75,),
          ),
          Text(
            itams.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16),
          )
        ],
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    fullRestaurants()));
      },
    );
  }
}
