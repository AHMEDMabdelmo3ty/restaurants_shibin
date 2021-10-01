import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurants_shibin/pages/drawer/mydrawer.dart';

import '../fullrestaurants.dart';
import '../homepage.dart';

class bottomNavBar extends StatefulWidget {
  @override
  _bottomNavBarState createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      endDrawer: MyDrawer(),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            homePage(),
            fullRestaurants(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(

        animationDuration: Duration(seconds: 1),
        backgroundColor: Colors.white,
        mainAxisAlignment: MainAxisAlignment.center,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('المطاعم'),
              icon: Icon(
                Icons.home,
                size: 25,
              )),
          BottomNavyBarItem(
              title: Text('جميع المطاعم'),
              icon: FaIcon(
                FontAwesomeIcons.pizzaSlice,
                color: Colors.red,
              )),
        ],
      ),
    );
  }
}
