import 'package:flutter/material.dart';
import 'package:googleandfacebook/DRAWER%20PAGE/drawer_page.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:developer' as dev;

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  var hasKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: hasKey,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          hasKey.currentState.showBottomSheet(
            (context) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green,
              ),
              height: 250,
            ),
          );
        },
      ),
      drawer: DrawerPage(),
      body: Container(
        child: Column(
          children: [
            Text(
              'nive',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.red,
                  decoration: TextDecoration.none),
            ),
            Text('hello'),
          ],
        ),
      ),
    );
  }

  void bottom() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 300,
            color: Color(0xFF737373),
            child: new Container(
              padding: EdgeInsets.only(
                left: 5.0,
                right: 5.0,
                top: 5.0,
                bottom: 5.0,
              ),
              decoration: new BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[
                        HexColor('#0A4E51'),
                        HexColor('#149BA1')
                      ]),
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(30.0),
                      topRight: const Radius.circular(30.0))),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "  Choose an action",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/TreePageImages/Tree/father.png',
                              height: 70,
                              width: 90,
                            ),
                            Text(
                              "Add father",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/TreePageImages/Tree/mother.png',
                              height: 70,
                              width: 90,
                            ),
                            Text(
                              "Add mother",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/TreePageImages/Tree/sisters.png',
                            height: 70,
                            width: 90,
                          ),
                          Text("Add Spouse",
                              style: TextStyle(color: Colors.white)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/TreePageImages/Tree/sisters.png',
                              height: 70,
                              width: 90,
                            ),
                            Text(
                              "Add child",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/TreePageImages/Tree/brothers.jpeg',
                              height: 70,
                              width: 90,
                            ),
                            Text("Add brother",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/TreePageImages/Tree/sisters.png',
                            height: 70,
                            width: 90,
                          ),
                          Text(
                            "Add sister",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
