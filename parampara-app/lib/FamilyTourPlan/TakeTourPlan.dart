import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'TakeTourPlan1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'TourPlanProfile.dart';

class TakeTourPlan extends StatefulWidget {
  TakeTourPlan({Key key}) : super(key: key);

  @override
  _TakeTourPlanState createState() => _TakeTourPlanState();
}

class _TakeTourPlanState extends State<TakeTourPlan> {
  var result;
  var toplace;
  var depatureTime;
  var departureTime;
  var decodeDetails;
  var familyId;
  bool isCheck = false;
  @override
  void initState() {
    super.initState();
    displayProfile();
  }

  displayProfile() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    familyId = prefer.getStringList('idS');
    var url = Uri.parse(
        'https://www.cviacserver.tk/parampara/v1/getTourSinglePlan/${familyId[1]}');
    var response = await http.get(url);
    decodeDetails = json.decode(response.body);
    // var result1 = decodeDetails['result'][decodeDetails['result'].length - 1];
    // print(result1);
    setState(() {
      result = decodeDetails['result'];
      isCheck = true;
    });
    var extractedDetail = decodeDetails['status'];
    print(extractedDetail);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var appbarr = AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: <Color>[HexColor('#0A4E51'), HexColor('#149BA1')])),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        "Take a Tour Plan",
        style: TextStyle(color: Colors.white),
      ),
    );
    var appbar = appbarr.preferredSize.height;
    print(appbar);
    return Scaffold(
      appBar: appbarr,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1),
          color: Colors.white12,
        ),
        padding: EdgeInsets.only(top: 20),
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 510,
                width: width * 0.9,
                child: decodeDetails == null && isCheck == false
                    ? Container(
                        child: Center(
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: result?.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: (height - appbar) * 0.15,
                            width: width - 40,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TourPlanProfile(
                                              tourList: result[index],
                                            )));
                              },
                              child: Card(
                                color: Colors.teal,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                // color: Colors.red,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: ((height - appbar) * 0.15) * 0.17,
                                      left: 25),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Event Place: ${result[index]['toPlace'] ??= ""}',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'RobotoMono',
                                            color: Colors.white),
                                      ),
                                      SizedBox(height: 15),
                                      Text(
                                        'Event Time: ${result[index]['departureTime'] ??= ""}',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'RobotoMono',
                                            color: Colors.white),
                                      ),
                                      SizedBox(height: 15),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        })),
            Container(
              height: 50,
              width: 100,
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TakeTourPlan1()));
                  },
                  child: Image.asset("assets/FamilyTourPlan/add.png")),
            ),
          ],
        ),
      ),
    );
  }
}
