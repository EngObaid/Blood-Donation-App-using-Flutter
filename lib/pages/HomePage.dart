import 'package:blood_donation_app/Content/imagewidget.dart';
import 'package:blood_donation_app/pages/Donate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainForm extends StatelessWidget {
  const MainForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blood Donation"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: ListView(children: [
        SizedBox(
            child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.all(10.0),
          color: Colors.blue[50],
          child: ImageWidget(ImageAsset: "images/Log.png", ImageHeight: 300),
        )),
        Container(
            child: SizedBox(
                height: 150,
                width: 530,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.all(10.0),
                    color: Colors.cyan,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text("Walaalkaa ku caawi Dhiig Walaal",
                            style: TextStyle(
                                fontFamily: "Comic Sans MS",
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        ListTile(
                          trailing: Icon(
                            Icons.launch,
                            color: Colors.white,
                          ),
                          title: Text("Donate Now",
                              style: TextStyle(
                                fontFamily: "Gotham",
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.white,
                              )),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Donate()));
                          },
                        )
                      ],
                    ))))
      ]),
    );
  }
}
