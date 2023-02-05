import 'package:blood_donation_app/pages/HomePage.dart';
import 'package:blood_donation_app/pages/LoginForm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MiddleWare extends StatelessWidget {
  const MiddleWare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return MainForm();
                } else {
                  return LoginForm();
                }
              }))),
    );
  }
}
