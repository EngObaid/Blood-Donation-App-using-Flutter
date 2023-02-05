import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ListDonars extends StatelessWidget {
  const ListDonars({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Donors"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Donation").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Error accur"));
          }
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) =>
                    // Center(child: Text(snapshot.data!.docs[index]["blood"]),)
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        margin: EdgeInsets.all(10.0),
                        color: Colors.green,
                        child: ListTile(
                  textColor: Colors.white,
                  leading: CircleAvatar(child: ClipOval(child: Image.asset('images/dn.png',height: 200,),
                  
                  ),
                  ),
                  
                  title: Text(snapshot.data!.docs[index]['Name']),
                  subtitle: Text(snapshot.data!.docs[index]['tell']),
                  trailing: Text(snapshot.data!.docs[index]['blood']),
                )
                )
                );
          } else
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
              ),
            );
        },
      ),
    );
  }
}
