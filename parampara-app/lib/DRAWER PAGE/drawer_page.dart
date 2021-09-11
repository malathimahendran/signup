import 'package:flutter/material.dart';
import 'package:googleandfacebook/ALL%20NAVIGATION%20ROUTES/all_page_routes.dart';
import 'package:googleandfacebook/ALL%20NAVIGATION%20ROUTES/navigation_route_name.dart';
import 'package:googleandfacebook/HOME%20SCREEN%20PAGE/home_screen_page.dart';
import 'package:googleandfacebook/Login%20Page/login_page.dart';

import 'package:googleandfacebook/TreePages/TreeAdd.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:googleandfacebook/SHARED%20PREFERENCES/shared_preferences.dart';

class DrawerPage extends StatefulWidget {
  DrawerPage({this.textForDrawer});
  final textForDrawer;

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  var logger = Logger();
  bool isLoggedIn = true;
  var receiverPic, nive, receiverFromRegister1, nive1;
  @override
  void initState() {
    super.initState();
    save();
  }

  save() async {
    await Shared().shared().then((value) {
      receiverPic = value.getStringList('storeData');
      logger.w(receiverPic[0]);
      logger.w(receiverPic[1]);

      setState(() {
        nive = receiverPic[0];
        nive1 = receiverPic[1];
      });

      logger.wtf("drawer page");

      logger.w(nive1);
      logger.w(nive);
    });
  }

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
    print('home screen logout line 126');

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: nive == null ? Text('') : Text(nive),
            accountEmail: nive1 == null ? Text("") : Text(nive1),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.teal[400],
              child: Text("Hi"),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            leading: Image.asset('assets/Drawer/homeicon.png'),
            title: Text("Home", style: TextStyle(color: Colors.teal[800])),
          ),
          Divider(height: 10.0, color: Colors.transparent),
          ListTile(
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => null));
            },
            leading: Image.asset('assets/Drawer/message.png'),
            title: Text("Message", style: TextStyle(color: Colors.teal[800])),
          ),
          Divider(height: 10.0, color: Colors.transparent),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TreeAdd()));
            },
            leading: Image.asset('assets/Drawer/treee.png'),
            title:
                Text("Family Tree", style: TextStyle(color: Colors.teal[800])),
          ),
          Divider(height: 10.0, color: Colors.transparent),
          ListTile(
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => null));
            },
            leading: Image.asset('assets/Drawer/mapicon.png'),
            title: Text(
              "Location",
              style: TextStyle(color: Colors.teal[800]),
            ),
          ),
          Divider(height: 10.0, color: Colors.transparent),
          ListTile(
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => null));
            },
            leading: Image.asset('assets/Drawer/accounticon.png'),
            title: Text("Account", style: TextStyle(color: Colors.teal[800])),
          ),
          Divider(height: 10.0, color: Colors.transparent),
          ListTile(
            onTap: outTemporary,
            leading: Image.asset('assets/Drawer/logoutt.png'),
            title: Text("Logout", style: TextStyle(color: Colors.teal[800])),
          ),
          Divider(height: 10.0, color: Colors.transparent),
        ],
      ),
    );
  }
}
