import 'package:flutter/material.dart';
import 'package:googleandfacebook/EVENTS%20ALL%20PAGES/my_events_single.dart';
import 'package:hexcolor/hexcolor.dart';
import 'event_main_first.dart';

class MainEvent extends StatefulWidget {
  MainEvent({Key key}) : super(key: key);

  @override
  _MainEventState createState() => _MainEventState();
}

class _MainEventState extends State<MainEvent> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: width * 0.7,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyEventsAdd()));
                },
                style: ElevatedButton.styleFrom(
                  primary: HexColor("#0A4E51"),
                  side: BorderSide(width: 1, color: HexColor("#0A4E51")),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                ),
                child: Text(
                  "My Events",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              height: 60,
              width: width * 0.7,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyEventsSingle()));
                },
                style: ElevatedButton.styleFrom(
                  primary: HexColor("#0A4E51"),
                  side: BorderSide(width: 1, color: HexColor("#0A4E51")),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                ),
                child: Text(
                  "Collected Events",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
