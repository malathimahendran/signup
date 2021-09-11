import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Healthtips.dart';
import 'PostHealthTipsFirst.dart';

class HealthTipsFirstPage extends StatefulWidget {
  HealthTipsFirstPage({Key key}) : super(key: key);

  @override
  _HealthTipsFirstPageState createState() => _HealthTipsFirstPageState();
}

class _HealthTipsFirstPageState extends State<HealthTipsFirstPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            width: width,
            height: height,
            child: Column(
              children: [
                Container(
                    height: height,
                    width: width,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: new DecorationImage(
                                image: AssetImage(
                                    'assets/HealthTips/HealthTipsFirst.png'),
                                fit: BoxFit.cover),
                            // color: Colors.amber
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: ((width) * 0.1),
                              top: height * 0.2,
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('HealthTips',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.white)),
                            ),
                          ),
                          height: height * 0.7,
                          width: width,
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: height * 0.38,
                            width: width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: height * 0.09,
                                    width: width * 0.8,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: HexColor('#0A4E51'),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PostHealthTipsFirst()));
                                        },
                                        child: Text(
                                          "Post Health Tips",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                SizedBox(height: height * 0.03),
                                Container(
                                    height: height * 0.09,
                                    width: width * 0.8,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            primary: HexColor('#0A4E51')),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HealthTip1()));
                                        },
                                        child: Text(
                                          "Health Tips",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )))
                              ],
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            )));
  }
}
