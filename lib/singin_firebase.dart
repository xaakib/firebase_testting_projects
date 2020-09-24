import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_testting/firebase_listtile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseInputeData extends StatefulWidget {
  @override
  _FirebaseInputeDataState createState() => _FirebaseInputeDataState();
}

class _FirebaseInputeDataState extends State<FirebaseInputeData> {
  var email;
  var password;

  register() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final FirebaseUser user = (await firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: email))
        .user;

    if (user != null) {
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => DetailsScreen()));
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "registation",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                  child: Text(
                    "SingUp",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: register),
              Text(
                "Already Regiostared?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RaisedButton(onPressed: () {}),
            ],
          ),
        ),
      )),
    );
  }
}
