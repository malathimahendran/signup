import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googleandfacebook/HOME%20SCREEN%20PAGE/home_screen_page.dart';
import 'package:googleandfacebook/MATRIMONY%20ALL%20PAGES/BEST%20MATCHES%20PAGE/best_matches.dart';
import 'package:hexcolor/hexcolor.dart';

import '../matrimony_search_your_partner.dart';
import 'Matrimonysecondpage.dart';

class MatrimonyFirstPage extends StatefulWidget {
  const MatrimonyFirstPage({Key key}) : super(key: key);

  @override
  _MatrimonyFirstPageState createState() => _MatrimonyFirstPageState();
}

class _MatrimonyFirstPageState extends State<MatrimonyFirstPage> {
  bool shouldPop = true;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context)
            .pop(MaterialPageRoute(builder: (context) => HomeScreen()));
        return shouldPop;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: height,
          width: width,
          child: Column(
            children: [
              Container(
                height: height,
                width: width,
                child: Stack(
                  // alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                            image: AssetImage(
                                'assets/Matrimony/matrimonynew.jpeg'),
                            fit: BoxFit.cover),
                        // color: Colors.amber
                      ),
                      height: height * 0.63,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: height * 0.4,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Image.asset(
                                'assets/Matrimony/matrimonybottom.jpg',
                                height: 60,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Find Your Special One",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(height: 20),
                            Container(
                              height: 50,
                              width: width * 0.7,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MatrimonySecond()));
                                },
                                color: Colors.white,
                                child: Text(
                                  "Feed Your Detail",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                        color: HexColor('#0A4E51'), width: 1)),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              height: 50,
                              width: width * 0.7,
                              child: RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BestMatches()));
                                  },
                                  color: HexColor('#0A4E51'),
                                  child: Text(
                                    "Search Your Special One",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: HexColor('#0A4E51'),
                                          width: 1))),
                            )
                          ],
                        ),
                      ),
                    )
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
