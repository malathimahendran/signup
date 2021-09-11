import 'package:flutter/material.dart';
import 'package:googleandfacebook/EVENTS%20ALL%20PAGES/my_events_form.dart';
import 'package:googleandfacebook/EVENTS%20ALL%20PAGES/my_events_single.dart';
import 'package:hexcolor/hexcolor.dart';

class MyEventsAdd extends StatefulWidget {
  MyEventsAdd({Key key}) : super(key: key);

  @override
  _MyEventsAddState createState() => _MyEventsAddState();
}

class _MyEventsAddState extends State<MyEventsAdd> {
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
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "My Events",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: height * 0.2,
                width: width * 0.99,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/EVENTS ALL PAGE/birthday function.png'),
                        fit: BoxFit.fill)),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.03),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                          child: Image.asset("assets/Try/shivangi.jpg",
                              height: 30, width: 30),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                    Container(
                      color: Colors.transparent,
                      height: height * 0.05,
                      width: width * 0.5,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyEventsSingle()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[300],
                          side:
                              BorderSide(width: 1, color: HexColor("#0A4E51")),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                        ),
                        child: Text(
                          "Birthday Function",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: 100,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyEventsFormPage()));
                    },
                    child: Image.asset("assets/FamilyTourPlan/add.png")),
              ),
            ],
          ),
        ));
  }
}
