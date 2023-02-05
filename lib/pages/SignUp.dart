import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Content/TextfieldWidget.dart';
import '../Content/buttonWidget.dart';
import '../Content/imagewidget.dart';
import '../Content/mytext.dart';
import 'Dashboard.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final username = TextEditingController();
  final password = TextEditingController();
  final password2 = TextEditingController();
  void clean() {
    username.text = "";
    password.text = "";
    password2.text = "";
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("Create User"),
          backgroundColor: Colors.red,
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )),
      body: ListView(
        children: [
          const ImageWidget(ImageAsset: 'images/Log.png', ImageHeight: 210),
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
                      height: 5,
                    ),
                    MyTextField(
                        obscureText: false,
                        Control: username,
                        HintText: "Email",
                        PrefixIcon: Icon(Icons.alternate_email_outlined)),
                    SizedBox(
                      height: 10,
                    ),
                    MyTextField(
                        obscureText: true,
                        Control: password,
                        HintText: "Password",
                        PrefixIcon: Icon(Icons.lock_outline_rounded)),
                    SizedBox(
                      height: 10,
                    ),
                    MyTextField(
                        obscureText: true,
                        Control: password2,
                        HintText: "Confirm Password",
                        PrefixIcon: Icon(Icons.lock_outline_rounded)),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      child: isLoading
                          ? CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            )
                          : MyButton(btnText: "SignUp"),
                      onTap: () async {
                        try {
                          if (password.text == password2.text) {
                            isLoading = true;
                            setSate() {}
                            var response = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: username.text,
                                    password: password.text);
                            clean();
                            Navigator.pop(context);
                          } else {
                            Widget okButton = TextButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            );
                            AlertDialog alert = AlertDialog(
                              title: Text(
                                  "please enter same as password on field Confirm password"),
                              actions: [okButton],
                            );
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alert;
                                });
                          }
                        } catch (Err) {
                          log("Error");
                        }
                        isLoading = false;
                      },
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
