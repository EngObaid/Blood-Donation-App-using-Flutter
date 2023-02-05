import 'dart:developer';

import 'package:blood_donation_app/Content/TextfieldWidget.dart';
import 'package:blood_donation_app/Content/buttonWidget.dart';
import 'package:blood_donation_app/Content/imagewidget.dart';
import 'package:blood_donation_app/Content/mytext.dart';
import 'package:blood_donation_app/pages/Dashboard.dart';
import 'package:blood_donation_app/pages/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final username = TextEditingController();
  final password = TextEditingController();
  bool isLoading = false;
  void clean() {
    username.text = "";
    password.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const ImageWidget(ImageAsset: 'images/Log.png', ImageHeight: 250),
          MyText(MylableText: "Blood Donation App", FontSize: 30),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 25, right: 25),
            child: Container(
                width: double.infinity,
                height: 450,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                        obscureText: false,
                        Control: username,
                        HintText: "Email",
                        PrefixIcon: Icon(Icons.alternate_email_outlined)),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                        obscureText: true,
                        Control: password,
                        HintText: "Password",
                        PrefixIcon: Icon(Icons.lock_outline_rounded)),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      child: isLoading
                          ? CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            )
                          : MyButton(btnText: "Login"),
                      onTap: () async {
                        try {
                          isLoading = true;
                          setSate() {}
                          var response = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: username.text,
                                  password: password.text);
                          clean();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()));
                          
                        } catch (Err) {
                          log("Error");
                        }
                        isLoading = false;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          // ignore: sort_child_properties_last
                          child:
                              const MyText(MylableText: "SignUp", FontSize: 15),
                          onTap: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          }),
                        )
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
