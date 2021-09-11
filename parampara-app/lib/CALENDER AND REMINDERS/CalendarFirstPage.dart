import 'package:flutter/material.dart';

import 'calendartask.dart';

class CalendarFirstPage extends StatefulWidget {
  @override
  _CalendarFirstPageState createState() => _CalendarFirstPageState();
}

class _CalendarFirstPageState extends State<CalendarFirstPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: new DecorationImage(
                image: AssetImage('assets/welcome.png'), fit: BoxFit.cover),
            // color: Colors.amber
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalendarTask()));
                  },
                  child: Text("Calendar>>>"))
            ],
          )),
    );
  }
}
