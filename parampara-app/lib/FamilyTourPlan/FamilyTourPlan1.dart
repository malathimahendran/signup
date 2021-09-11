import 'package:flutter/material.dart';
import 'package:googleandfacebook/DRAWER%20PAGE/drawer_page.dart';
import 'package:hexcolor/hexcolor.dart';
import 'ReceivedTourPlan1.dart';
import 'TakeTourPlan.dart';

class FamilyTourPlan1 extends StatefulWidget {
  FamilyTourPlan1({Key key}) : super(key: key);

  @override
  _FamilyTourPlan1State createState() => _FamilyTourPlan1State();
}

class _FamilyTourPlan1State extends State<FamilyTourPlan1> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   image: new DecorationImage(
        //       image: ExactAssetImage('assets/FamilyTourPlan/TourFirstTop.jpg'),
        //       fit: BoxFit.fill),
        // ),
        height: height,
        width: width,
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
                          image: ExactAssetImage(
                              'assets/FamilyTourPlan/TourFirstTop.jpg'),
                          fit: BoxFit.fitHeight),
                    ),
                    height: height * 0.63,
                    width: width,
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
                              topRight: Radius.circular(30))),
                      child: Column(
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Image.asset(
                                    'assets/FamilyTourPlan/TourFirstBottom.png',
                                    height: 60,
                                  ),
                                ),
                              ]),
                          SizedBox(height: 20),
                          Text(
                            "Family Tour Plan",
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
                                        builder: (context) => TakeTourPlan()));
                              },
                              color: Colors.white,
                              child: Text(
                                "Create a Tour Plan",
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
                                              ReceivedTourPlan1()));
                                },
                                color: HexColor('#0A4E51'),
                                child: Text(
                                  "Tour Plan",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                        color: HexColor('#0A4E51'), width: 1))),
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
    );
  }
}
