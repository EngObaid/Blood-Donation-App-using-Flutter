// ignore: file_names
import 'package:blood_donation_app/Content/imagewidget.dart';
import 'package:flutter/material.dart';



class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      SizedBox(
        height: 30,
      ),
      Padding(
        padding: EdgeInsets.only(left: 30),
        child: Text(
          "ABOUT ME ",
          style: TextStyle(
            fontSize: 40,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        child: const Padding(
          padding: EdgeInsets.only(left: 30, top: 20),
          
          child: CircleAvatar(
            
            radius: 120,
            backgroundColor: Colors.white10,
            child: Padding(
              padding: EdgeInsets.only(left: 0),
              child: ClipOval(
                
                child: Image(image: AssetImage("images/ccss1.jpeg",))
                
              ),
            ),
          ),
          
      ),
      ),
      SizedBox(
        height: 20,
      ),
      SizedBox(
        height: 150,
        width: 500,
        
        child: Card(
          
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            margin: EdgeInsets.all(10.0),
            
            color: Colors.blue[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                // Image(
                //   image: AssetImage('images/Log.png'),
                //   width: 130,
                //   height: 100.0,
                // ),
                SizedBox(height: 20,),
                Text(
                "Name: Ubeyd Haji AbdiRahman",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.left,
              ),
              SizedBox(height: 10,),
              Text(
                "Phone: 0619346686",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
              
              SizedBox(height: 10),
              Text(
                "G-mail: Faasle113@gmail.com",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.left),
              
              ],
            ),

            ),
            
      )
    ]))
    );
  }
}
