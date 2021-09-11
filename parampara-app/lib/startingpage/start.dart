import 'package:flutter/material.dart';
import 'package:googleandfacebook/Google%20And%20Facebook/facebook/facebook.dart';
import 'package:googleandfacebook/Google%20And%20Facebook/google/google.dart';

class StartingPage extends StatefulWidget {
  @override
  _StartingPageState createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextFormField(
            controller: email,
            decoration: InputDecoration(
              hintText: "Email",
              icon: Icon(Icons.person),
            ),
          ),
          TextFormField(
            controller: password,
            decoration: InputDecoration(
              hintText: "Password",
              icon: Icon(Icons.person),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Google(),
              FaceBook(),
            ],
          ),
        ],
      ),
    );
  }
}
