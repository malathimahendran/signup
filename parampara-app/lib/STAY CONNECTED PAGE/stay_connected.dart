import 'package:flutter/material.dart';
import 'package:googleandfacebook/HOME%20SCREEN%20PAGE/home_screen_page.dart';
import 'package:logger/logger.dart';

class StayConnectedPage extends StatefulWidget {
  @override
  _StayConnectedPageState createState() => _StayConnectedPageState();
}

class _StayConnectedPageState extends State<StayConnectedPage> {
  var logger = Logger();
  @override
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
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child:
                  Image.asset('assets/STAY CONNECTED PAGE/Stayconnected.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 440, left: 60),
              child: Text(
                'Thank You! Stay Connected',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 450, left: 65),
              child: Text(
                ' \n \n Stay connected with your family \n           amid  your busy life..',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 570, left: 130),
              child: Container(
                height: 40,
                width: 100,
                child: ElevatedButton(
                  onPressed: navigateToHomeScreen,
                  child: Text(
                    'Next',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15.0),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.lightBlue.shade900),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0)))),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  navigateToHomeScreen() async {
    logger.log(Level.error, "came into navigate");

    await Navigator.popAndPushNamed(context, '/homeScreenPage');
  }
}
