import 'package:blood_donation_app/pages/AboutPage.dart';
import 'package:blood_donation_app/pages/Dashboard.dart';
import 'package:blood_donation_app/pages/Donate.dart';
import 'package:blood_donation_app/pages/HomePage.dart';
import 'package:blood_donation_app/pages/LoginForm.dart';
import 'package:blood_donation_app/pages/ListDonors.dart';
import 'package:blood_donation_app/pages/SignUp.dart';
import 'package:blood_donation_app/pages/Splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: "Blood Donation",
      home:SplashScreen() ));
}


