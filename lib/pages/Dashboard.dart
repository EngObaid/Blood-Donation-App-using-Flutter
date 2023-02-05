import 'package:blood_donation_app/pages/AboutPage.dart';
import 'package:blood_donation_app/pages/Donate.dart';
import 'package:blood_donation_app/pages/HomePage.dart';
import 'package:blood_donation_app/pages/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'ListDonors.dart';

class Dashboard extends StatefulWidget {

  Dashboard({super.key});


  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
 final PageController _pageController=PageController();
int _index=0;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),
         topRight: Radius.circular(30.0), ),
        child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // fixedColor: Colors.black,
        // selectedItemColor: Colors.deepPurple,
        fixedColor: Colors.white,
        backgroundColor: Colors.green,
        elevation:10,
        items:  const [
          BottomNavigationBarItem(
            
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.bloodtype_sharp), label: 'Donate'),
          BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle_sharp), label: 'List Donors'),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: 'About')
        ],
        onTap:_onTappedBar,
        currentIndex: _index,
           ),
      ),


      body: PageView(controller:_pageController,
      children:  [
        MainForm(),
        Donate(),
        ListDonars(),
        AboutPage()
      ],
      ),
    );
  }
 void _onTappedBar(int value) {
setState(() {
  _index = value;
});
_pageController.jumpToPage(value);
}
}
