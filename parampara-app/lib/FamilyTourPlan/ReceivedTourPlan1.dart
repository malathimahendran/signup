import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Received2.dart';

class ReceivedTourPlan1 extends StatefulWidget {
  ReceivedTourPlan1({Key key}) : super(key: key);

  @override
  _ReceivedTourPlan1State createState() => _ReceivedTourPlan1State();
}

class _ReceivedTourPlan1State extends State<ReceivedTourPlan1> {
  void initState() {
    super.initState();
    displayProfile();
  }

  var result;
  bool isCheck = false;

  var decodeDetails;
  var familyId;
  displayProfile() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    familyId = prefer.getStringList('idS');
    var url = Uri.parse(
        'https://www.cviacserver.tk/parampara/v1/getFamilyTourPlan/${familyId[0]}');
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

    var appBarr = AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: <Color>[HexColor('#0A4E51'), HexColor('#149BA1')])),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        "Tour Plan",
        style: TextStyle(color: Colors.white),
      ),
    );
    var appbar = appBarr.preferredSize.height;
    return Scaffold(
      appBar: appBarr,
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
                                        builder: (context) => Received(
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
          ],
        ),
      ),
    );
  }
}
