import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:googleandfacebook/FamilyTourPlan/ReceivedTourPlan1.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'customfield/receivedCustomField.dart';
import 'package:http/http.dart' as http;

class Received extends StatefulWidget {
  Received({this.tourList, this.receiveuserId});
  final tourList;
  final receiveuserId;

  @override
  _ReceivedState createState() => _ReceivedState();
}

class _ReceivedState extends State<Received> {
  var text, text1;
  var organisedBy;
  var startdate;
  var enddate;
  var fromplace;
  var toplace;
  var depatureTime;
  var travelBy;
  var contactNo;
  var description;
  var tourId;
  var familyId;
  var userId;
  var checkFamilyId;
  var decodeDetails;

  void initState() {
    super.initState();
    displayProfile();
    triplist();
  }

  triplist() async {
    tourId = widget.tourList['id'].toString();
    // SharedPreferences prefer = await SharedPreferences.getInstance();
    // familyId = prefer.getStringList('idS');
    var url =
        Uri.parse('https://www.cviacserver.tk/parampara/v1/getOpinion/$tourId');
    var response = await http.get(url);
    print(response.body);
    decodeDetails = json.decode(response.body);
  }

  delData() async {
    tourId = widget.tourList['id'].toString();
    var url = Uri.parse(
        'https://www.cviacserver.tk/parampara/v1/deleteTourPlan/$tourId');
    var response = await http.delete(url);
    // print(response.body);
    var decodeddel = json.decode(response.body);
    print(decodeddel);
    var extractedDetail = decodeddel['status'];

    if (extractedDetail == true) {
      final snackBar = SnackBar(
        backgroundColor: Colors.teal,
        content: Text('TourPlan deleted'),
        duration: Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => new ReceivedTourPlan1()));
    }
  }

  request() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    familyId = prefer.getStringList('idS');
    setState(() {
      checkFamilyId = familyId[1];
      print(checkFamilyId);
    });

    var url =
        Uri.parse('https://www.cviacserver.tk/parampara/v1/postRequestAccept');
    var response = await http.post(url, body: {
      'id': familyId[1].toString(),
      'tour_id': widget.tourList['tour_id'].toString(),
    });
    print(response.body);
  }

  displayProfile() async {
    List newList = [];
    List newList1 = [];
    List newList3 = [];
    List newList4 = [];
    print(widget.tourList);
    var k = widget.tourList['startDate'].toString();
    print(startdate);
    newList.insert(0, k);

    for (var i = 0; i < newList[0].length; i++) {
      newList1.add(newList[0][i]);
      if (newList1.length == 10) break;
    }

    startdate = newList1.join();
    print(startdate);
    var end = widget.tourList['endDate'].toString();
    newList3.insert(0, end);

    for (var i = 0; i < newList3[0].length; i++) {
      newList4.add(newList3[0][i]);
      if (newList4.length == 10) break;
    }

    enddate = newList4.join();
    print(enddate);
    setState(() {
      userId = widget.tourList['id'].toString();
      print(userId);
      tourId = widget.tourList['id'].toString();
      print(tourId);
      organisedBy = widget.tourList['o_by'].toString();
      toplace = widget.tourList['toPlace'].toString();
      startdate = startdate;
      enddate = enddate;
      fromplace = widget.tourList['fromPlace'].toString();
      depatureTime = widget.tourList['departureTime'].toString();
      travelBy = widget.tourList['travelBy'].toString();
      contactNo = widget.tourList['contactNo'].toString();
      description = widget.tourList['description'].toString();
    });
  }

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
            "Tour Plan Details",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Container(
                //   height: height * 0.05,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Icon(Icons.edit),
                //     ],
                //   ),
                // ),
                // Container(
                //     height: height * 0.1,
                //     color: Colors.red[300],
                //     child: Image.asset(
                //       "assets/Try/shivangi.jpg",
                //     )),
                SizedBox(height: 30),
                customTextProfile(
                    text = "Organized  By", text1 = organisedBy ??= "", width),
                SizedBox(height: 35),
                customTextProfile(
                    text = "Trip Start Date", text1 = startdate ??= "", width),
                SizedBox(height: 35),
                customTextProfile(
                    text = "Trip End Date", text1 = enddate ??= "", width),
                SizedBox(height: 35),
                customTextProfile(
                    text = "From Place", text1 = fromplace ??= "", width),
                SizedBox(height: 35),
                customTextProfile(
                    text = "To Place", text1 = toplace ??= "", width),
                SizedBox(height: 35),
                customTextProfile(text = "Departure Timing",
                    text1 = depatureTime ??= "", width),
                SizedBox(height: 35),
                customTextProfile(
                    text = "Travel By", text1 = travelBy ??= "", width),
                SizedBox(height: 35),
                customTextProfile(
                    text = "Contact No", text1 = contactNo ??= "", width),
                SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: Text(
                    description ??= "",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: 35),
                Container(
                    height: 50,
                    width: width * 0.9,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            side: BorderSide(
                                color: HexColor('#0A4E51'), width: 2)),
                        color: HexColor('#0A4E51'),
                        onPressed: () {
                          request();
                        },
                        child: Text(
                          "    Accept    ",
                          style: TextStyle(color: Colors.white),
                        ))
                    // : Text('success'),
                    ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      // color: Colors.green,
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.share,
                          size: 30.0,
                          color: HexColor("#0A4E51"),
                        ),
                        label: Text(
                          '   Share    ',
                          style: TextStyle(color: HexColor("#0A4E51")),
                        ),
                        onPressed: () {
                          print('Pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side:
                              BorderSide(width: 1, color: HexColor("#0A4E51")),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      // color: Colors.green,
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.delete,
                          size: 30.0,
                          color: HexColor("#0A4E51"),
                        ),
                        label: Text(
                          '   Delete   ',
                          style: TextStyle(color: HexColor("#0A4E51")),
                        ),
                        onPressed: () {
                          delData();
                          print('Pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side:
                              BorderSide(width: 1, color: HexColor("#0A4E51")),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
