import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'health_care.dart';

class HealthTip1 extends StatefulWidget {
  @override
  _HealthTip1State createState() => _HealthTip1State();
}

class _HealthTip1State extends State<HealthTip1> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: <Color>[HexColor('#0A4E51'), HexColor('#149BA1')])),
          ),
          backgroundColor: Colors.teal,
          iconTheme: IconThemeData(color: Colors.white),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '     Health Tips',
                style: TextStyle(color: Colors.white),
              ),
              Icon(
                Icons.notifications,
                size: 30,
              )
            ],
          ),
        ),
        body: Container(
          height: height,
          width: width,
          child: Column(
            children: [
              SizedBox(height: height * 0.02),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HealthTips()));
                },
                child: Container(
                  width: width * 0.9,
                  height: height * 0.18,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/HealthTips/PostHealthTips/posthealthtips.png"),
                          fit: BoxFit.fill)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Health Care",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                width: width * 0.9,
                height: height * 0.18,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/HealthTips/PostHealthTips/exercise.png"),
                        fit: BoxFit.fill)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Health Exercise",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                width: width * 0.9,
                height: height * 0.18,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/HealthTips/PostHealthTips/childcare.png"),
                        fit: BoxFit.fill)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Child Care",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
