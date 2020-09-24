import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  Future getData() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("xaakib").getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (_, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (_, index) {
            DocumentSnapshot data = snapshot.data[index];
            return Column(
              children: [
                Card(
                  child: ListTile(
                    leading: ClipRect(
                      child: Image.network(
                        data["imageUrl"],
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      data["name"],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      data["sub"],
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
               
              ],
            );
          },
        );
      },
    );
  }
}
