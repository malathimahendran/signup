import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:googleandfacebook/FamilyTourPlan/TakeTourPlan.dart';
import 'package:googleandfacebook/FamilyTourPlan/TourPlanProfile.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'customfield/TourPlan1customfield.dart';
import 'package:http/http.dart' as http;

class TakeTourPlan1 extends StatefulWidget {
  TakeTourPlan1({Key key}) : super(key: key);

  @override
  _TakeTourPlan1State createState() => _TakeTourPlan1State();
}

class _TakeTourPlan1State extends State<TakeTourPlan1> {
  var dateController = TextEditingController();
  var dateController1 = TextEditingController();
  var timeController = TextEditingController();
  var organisedBy = TextEditingController();
  var fromPlace = TextEditingController();
  var toPlace = TextEditingController();
  var depatureTiming = TextEditingController();
  var travelBy = TextEditingController();
  var contactNo = TextEditingController();
  var desc = TextEditingController();
  var familyId;
  var controller;
  TimeOfDay initialTime = TimeOfDay.now();
  Map duplicate = {};
  // mapPost() {
  //   setState(() {
  //     duplicate = {
  //       'id': '4',
  //       'startDate': dateController.text.toString(),
  //       'endDate': dateController1.text.toString(),
  //       'fromPlace': fromPlace.text.toString(),
  //       'toPlace': toPlace.text.toString(),
  //       'departureTime': timeController.text.toString(),
  //       'o_by': organisedBy.text.toString(),
  //       'travelBy': travelBy.text.toString(),
  //       'description': desc.text.toString(),
  //       'contactNo': contactNo.text.toString()
  //     };
  //   });
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => TakeTourPlan(
  //                 details: duplicate,
  //               )));
  // }
  apiPost() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    familyId = prefer.getStringList('idS');
    var url = Uri.parse('https://www.cviacserver.tk/parampara/v1/newTourPlan');
    var response = await http.post(url, body: {
      'id': familyId[1].toString(),
      'startDate': dateController.text.toString(),
      'endDate': dateController1.text.toString(),
      'fromPlace': fromPlace.text.toString(),
      'toPlace': toPlace.text.toString(),
      'departureTime': timeController.text.toString(),
      'o_by': organisedBy.text.toString(),
      'travelBy': travelBy.text.toString(),
      'description': desc.text.toString(),
      'contactNo': contactNo.text.toString()
    });
    print(response.body);
    var decodeDetails = json.decode(response.body);
    print(decodeDetails);
    var extractedDetail = decodeDetails['status'];
    print(extractedDetail);
    if (extractedDetail == true) {
      final snackBar = SnackBar(
        backgroundColor: Colors.teal,
        content: Text('TourPlan Created'),
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
              builder: (BuildContext context) => new TakeTourPlan()));
    } else {
      final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text('Please Check Your From and To dates'),
        duration: Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => StayConnectedPage()));
    }
  }

  var text;
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
            "Take a Tour Plan",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  customRowTextfieldTourPlan(height, width,
                      text = "Organized By", controller = organisedBy),
                  SizedBox(height: (height - 20) * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: (height - 20) * 0.05,
                        width: (width - 30) * 0.4,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Trip Start Date",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        height: (height - 20) * 0.05,
                        width: (width - 30) * 0.6,
                        child: TextFormField(
                          readOnly: true,
                          controller: dateController,
                          onTap: () async {
                            var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2100));
                            dateController.text =
                                date.toString().substring(0, 10);
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              borderSide: BorderSide(
                                  color: HexColor("#0A4E51"), width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              borderSide: BorderSide(
                                  color: HexColor("#0A4E51"), width: 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: (height - 20) * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: (height - 20) * 0.05,
                        width: (width - 30) * 0.4,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Trip End Date",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        height: (height - 20) * 0.05,
                        width: (width - 30) * 0.6,
                        child: TextFormField(
                          readOnly: true,
                          controller: dateController1,
                          onTap: () async {
                            var date = await showDatePicker(
                                selectableDayPredicate: (day) {
                                  if ((day.month == DateTime.now().month) &&
                                      (day.day < DateTime.now().day)) {
                                    return false;
                                  } else {
                                    return true;
                                  }
                                },
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));
                            dateController1.text =
                                date.toString().substring(0, 10);
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              borderSide: BorderSide(
                                  color: HexColor("#0A4E51"), width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              borderSide: BorderSide(
                                  color: HexColor("#0A4E51"), width: 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: (height - 20) * 0.02),
                  customRowTextfieldTourPlan(
                    height,
                    width,
                    text = "From Place",
                    controller = fromPlace,
                  ),
                  SizedBox(height: (height - 20) * 0.02),
                  customRowTextfieldTourPlan(
                    height,
                    width,
                    text = "To Place",
                    controller = toPlace,
                  ),
                  SizedBox(height: (height - 20) * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: (height - 20) * 0.05,
                        width: (width - 30) * 0.4,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "DepatureTiming",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        height: (height - 20) * 0.05,
                        width: (width - 30) * 0.6,
                        child: TextFormField(
                          readOnly: true,
                          controller: timeController,
                          onTap: () async {
                            TimeOfDay picked = await showTimePicker(
                              context: context,
                              initialTime: initialTime,
                              builder: (BuildContext context, Widget child) {
                                return MediaQuery(
                                  data: MediaQuery.of(context)
                                      .copyWith(alwaysUse24HourFormat: true),
                                  child: child,
                                );
                              },
                            );
                            timeController.text = picked
                                .format(context)
                                .toString()
                                .substring(0, 5);
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              borderSide: BorderSide(
                                  color: HexColor("#0A4E51"), width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              borderSide: BorderSide(
                                  color: HexColor("#0A4E51"), width: 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: (height - 20) * 0.02),
                  customRowTextfieldTourPlan(
                    height,
                    width,
                    text = "Travel By",
                    controller = travelBy,
                  ),
                  SizedBox(height: (height - 20) * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: (height - 20) * 0.05,
                        width: (width - 30) * 0.4,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Contact No",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        height: (height - 20) * 0.05,
                        width: (width - 30) * 0.6,
                        child: TextFormField(
                          controller: contactNo,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              borderSide: BorderSide(
                                  color: HexColor("#0A4E51"), width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              borderSide: BorderSide(
                                  color: HexColor("#0A4E51"), width: 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: (height - 20) * 0.04),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Description : ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  SizedBox(height: (height - 20) * 0.02),
                  Container(
                    height: (height - 20) * 0.1,
                    width: (width - 30) * 0.90,
                    child: TextFormField(
                      controller: desc,
                      maxLines: 4,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          borderSide:
                              BorderSide(color: HexColor("#0A4E51"), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          borderSide:
                              BorderSide(color: HexColor("#0A4E51"), width: 1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: (height - 20) * 0.06),
                  Container(
                    height: 60,
                    width: width,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            side: BorderSide(
                                color: HexColor('#0A4E51'), width: 2)),
                        color: HexColor('#0A4E51'),
                        onPressed: () {
                          apiPost();
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
