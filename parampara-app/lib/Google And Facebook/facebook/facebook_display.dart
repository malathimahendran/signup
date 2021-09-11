import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'facebook.dart';

class FacebookDisplay extends StatefulWidget {
  final Map details;

  const FacebookDisplay({Key key, this.details}) : super(key: key);

  @override
  _FacebookDisplayState createState() => _FacebookDisplayState();
}

class _FacebookDisplayState extends State<FacebookDisplay> {
  bool _isLoggedIn = true;
  @override
  Widget build(BuildContext context) {
    Map allDetails = widget.details;
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(allDetails["picture"]["data"]["url"]),
              Text(allDetails["name"]),
              allDetails["email"] == null
                  ? Text('hello')
                  : Text(allDetails['email']),
              Text(allDetails['id']),
              // Text(allDetails['mobile']),
              TextButton(
                  onPressed: () {
                    FacebookAuth.instance.logOut().then((value) {
                      setState(() {
                        _isLoggedIn = false;
                        allDetails = {};
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FaceBook()));
                      });
                    });
                  },
                  child: Text("Logout"))
            ],
          ),
        ),
      ),
    );
  }
}
