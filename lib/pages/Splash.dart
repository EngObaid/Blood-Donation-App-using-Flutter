import 'dart:async';

import 'package:blood_donation_app/Content/buttonWidget.dart';
import 'package:flutter/material.dart';

import 'LoginForm.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //       Duration(seconds: 1), () => Navigator.of(context).pushReplacement(MaterialPageRoute(
  //       builder: (BuildContext context) => LoginForm())));

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Blood Donation"),
      centerTitle: true,
      backgroundColor: Colors.red,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30,right: 30),
          child: Column(
            children: [
              SizedBox(height: 100,),
              Image.asset(
                'images/dn2.png',
                width: 900.0,
              ),
              SizedBox(height: 70,),
              GestureDetector(
                child: MyButton(btnText: "Get Started"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginForm()));
              },
              )
            ],
          ),
        ),
      ),
    );
  }
}
