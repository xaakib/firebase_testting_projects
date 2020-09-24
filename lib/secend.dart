import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_testting/details.dart';
import 'package:flutter/material.dart';

class HomeSconce extends StatefulWidget {
  @override
  _HomeSconceState createState() => _HomeSconceState();
}

class _HomeSconceState extends State<HomeSconce> {
  Future getData() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("xaakib").getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appbar"),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (_, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (_, index) {
              DocumentSnapshot data = snapshot.data[index];
              return ListTile(
                title: Text(data["name"]),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(data["imageUrl"]),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsScreen()),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
