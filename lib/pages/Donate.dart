// ignore: file_names
import 'dart:math';

import 'package:blood_donation_app/Content/buttonWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Donate extends StatelessWidget {
  Donate({super.key});

  bool isUpdating = false;
  TextEditingController displayNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  // TextEditingController dobController = TextEditingController();
  void clean() {
    displayNameController.text = "";
    phoneNumberController.text = "";
    addressController.text = "";
    bloodGroupController.text = "";
    genderController.text = "";
  }

  void saveData() async {
    try {
      await FirebaseFirestore.instance.collection("Donation").add({
        "Name": displayNameController.text,
        "Address": addressController.text,
        "tell": phoneNumberController.text,
        "blood": bloodGroupController.text,
        "sex": genderController.text
      });
      print("Suceess");
    } catch (e) {
      log(e.toString() as num);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text("Donor Info!!"),
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
        body: Builder(builder: (context) {
          return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                // key: _formKey,
                child: isUpdating
                    ? const CircularProgressIndicator()
                    : ListView(
                        children: <Widget>[
                          const SizedBox(
                            height: 20,
                          ),
                          const Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage('images/dn2.png'),
                              radius: 70.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'What is your sweet name?';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Donor Name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                              controller: displayNameController,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: TextFormField(
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return 'Reciever needs your location!';
                              //   }
                              //   return null;
                              // },
                              decoration: InputDecoration(
                                  fillColor: Colors.grey,
                                  // suffixIcon: IconButton(
                                  //     // ignore: prefer_const_constructors
                                  //     // icon: Icon(
                                  //     //   Icons.location_on,
                                  //     //   color: Colors.red,
                                  //     // ),
                                  //     onPressed: () {}),
                                  hintText: "Address",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                              controller: addressController,
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty || value.length != 10) {
                                  return 'Common! Number cannot be Empty';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                  hintText: "Phone Number",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                              controller: phoneNumberController,
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: DropdownButtonFormField(
                                  validator: (value) => value == null
                                      ? 'Please provide Blood Group'
                                      : null,
                                  onChanged: (val) {
                                    bloodGroupController.text = val!;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                  hint: const Text("Blood Group"),
                                  items: const [
                                    DropdownMenuItem(
                                      child: Text("A+"),
                                      value: "A+",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("B+"),
                                      value: "B+",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("O+"),
                                      value: "O+",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("AB+"),
                                      value: "AB+",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("A-"),
                                      value: "A-",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("B-"),
                                      value: "B-",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("O-"),
                                      value: "O-",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("AB-"),
                                      value: "AB-",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Flexible(
                                child: DropdownButtonFormField(
                                  validator: (value) => value == null
                                      ? 'Please provide Gender'
                                      : null,
                                  onChanged: (val) {
                                    genderController.text = val!;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                  hint: const Text("Choose your Sex"),
                                  items: const [
                                    DropdownMenuItem(
                                      child: Text("Male"),
                                      value: "Male",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Female"),
                                      value: "Female",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                child: MyButton(btnText: "Donate Now"),
                                onTap: () {
                                  saveData();
                                  Widget okButton = TextButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  );
                                  AlertDialog alert = AlertDialog(
                                    title: Text("Donor Registered"),
                                    actions: [okButton],
                                  );
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return alert;
                                      });
                                  clean();
                                }),
                          ),
                        ],
                      ),
              ));
        }));
  }
}
