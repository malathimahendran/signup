import 'package:flutter/material.dart';
import 'package:googleandfacebook/ALL%20NAVIGATION%20ROUTES/navigation_route_name.dart';
import 'package:googleandfacebook/GETSTARTED/getStarted.dart';
import 'package:googleandfacebook/HOME%20SCREEN%20PAGE/home_screen_page.dart';
import 'package:googleandfacebook/Login%20Page/login_page.dart';

import 'package:googleandfacebook/SHARED%20PREFERENCES/shared_preferences.dart';
import 'package:googleandfacebook/STAY%20CONNECTED%20PAGE/stay_connected.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shimmer/shimmer.dart';

// class LoginPage1 extends StatefulWidget {
//   @override
//   _LoginPage1State createState() => _LoginPage1State();
// }

// class _LoginPage1State extends State<LoginPage1> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class Log extends StatefulWidget {
  @override
  _LogState createState() => _LogState();
}

class _LogState extends State<Log> {
  var logger = Logger();
  var selectHere;
  // Future<bool> _mockCheckForSession() async {
  //   await Future.delayed(Duration(seconds: 185), () {
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (BuildContext context) => LoginPage1()));
  //   });

  //   return true;
  // }

  void initState() {
    super.initState();
    selectingHere().whenComplete(() {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.popAndPushNamed(
            context,
            selectHere == null
                ? AllRouteNames.getStartedPage
                : AllRouteNames.homeScreenPage);
      });
    });
    // _mockCheckForSession();
    // selectingHere().whenComplete(
    //   () => Future.delayed(
    //     Duration(seconds: 3),
    //     () => Navigator.pushAndRemoveUntil(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) =>
    //                 selectHere == null ? GetStarted() : HomeScreen()), (route) {
    //       return false;
    //     }),

    //   ),
    // );
  }

  Future selectingHere() async {
    await Shared().shared().then((val) {
      selectHere = val.getStringList('storeData');
      logger.w(selectHere);
      logger.wtf('in splashscreen selectingHereFunction');
    });

    // var shared = await SharedPreferences.getInstance();
    // setState(() {
    //   selectHere = shared.getStringList('pic');
    // });
    // print(selectHere);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
              'assets/Login Page Folder/Images/background_image.png'),
        ),
      ),
      child: Center(
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // Opacity(
              //   opacity: 0.5,
              //   child: Image.asset('assests/images/tree.jpg'),
              // ),
              Shimmer.fromColors(
                  period: Duration(seconds: 4),
                  baseColor: Colors.white,
                  highlightColor: Colors.white,
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text("PARAMBARA",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Pacifico',
                        )),
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
