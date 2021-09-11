import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'google_display.dart';

class Google extends StatefulWidget {
  @override
  _GoogleState createState() => _GoogleState();
}

class _GoogleState extends State<Google> {
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    FirebaseAuth.instance.signInWithCredential(credential);
    print('line 37');
    print(googleUser.displayName);
    print(googleUser.email);
    print(googleUser.photoUrl);
    print(googleUser.id);
    print(googleUser.authentication);
    print('line 40');
    // var user1 = FirebaseAuth.instance.currentUser;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GoogleDisplayPage(
                  userDetails: googleUser,
                )));
    // Once signed in, return the UserCredential
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          children: [
            Container(
              child: ElevatedButton(
                onPressed: signInWithGoogle,
                child: Text('google'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
