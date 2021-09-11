import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:googleandfacebook/SHARED%20PREFERENCES/shared_preferences.dart';

class LogOutTemporary extends StatefulWidget {
  @override
  _LogOutTemporaryState createState() => _LogOutTemporaryState();
}

class _LogOutTemporaryState extends State<LogOutTemporary> {
  bool isLoggedIn = true;
  outTemporary() async {
    await FacebookAuth.instance.logOut().then((value) {
      setState(() {
        isLoggedIn = false;
        print('logged out');
      });
    });
    GoogleSignIn().signOut();
    Shared().shared().then((value) {
      value.clear();
      print('clear');

      var hello = value.getStringList('storeData');
      print(hello);
      print('logout temporart');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text('Logout'),
            onPressed: outTemporary,
          ),
        ),
      ),
    );
  }
}
