import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'google.dart';

class GoogleDisplayPage extends StatefulWidget {
  final userDetails;

  const GoogleDisplayPage({Key key, this.userDetails}) : super(key: key);
  @override
  _GoogleDisplayPageState createState() => _GoogleDisplayPageState();
}

class _GoogleDisplayPageState extends State<GoogleDisplayPage> {
  // var myName = FirebaseAuth.instance.currentUser;
  logOut() async {
    // FirebaseAuth.instance.signOut();

    // GoogleSignInAccount googleUser = await GoogleSignIn().signOut();
    // print(googleUser);

    // GoogleSignIn().currentUser.clearAuthCache();
    GoogleSignIn().signOut();
    // FirebaseAuth.instance.signOut();
    Navigator.pop(context, MaterialPageRoute(builder: (context) => Google()));
  }

  @override
  Widget build(BuildContext context) {
    var myName = widget.userDetails;
    print(myName);
    print('line32');

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.blue,
                  backgroundImage: NetworkImage(myName.photoUrl),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      myName.displayName,
                    ),
                    Text(myName.id),
                    Text(myName.email),
                    // Text(myName.uid),
                    // Text(myName['displayname']),
                    // Text(myName[0]),
                    // Text(myName[0]['displayname']),
                    // Text(myName.phoneNumber),
                    // Text(myName.uid),

                    Container(
                      child: TextButton(
                        onPressed: logOut,
                        child: Text('logout'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
