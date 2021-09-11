import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'dart:core';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BloodHomePage.dart';
import 'Find_a_donor_page.dart';
import 'Find_donor.dart';

class RequestForBlood extends StatefulWidget {
  @override
  _RequestForBloodState createState() => _RequestForBloodState();
}

class _RequestForBloodState extends State<RequestForBlood> {
  var logger = Logger();
  var date;
  var requestStartDate = TextEditingController();
  var requestStartTime = TextEditingController();
  var requestLocation = TextEditingController();
  var requestBloodUnit = TextEditingController();
  var requestPatientName = TextEditingController();
  var requestContactNumber = TextEditingController();

  var functionStop = 0;
  String bloodGroup = "";
  String gender = "";
  bool isClick = false;
  bool aplus = false,
      aminus = false,
      bplus = false,
      bminus = false,
      oplus = false,
      ominus = false,
      abplus = false,
      abminus = false,
      value1 = false;

  bool genderClick = false;
  bool genderFemaleClick = false;

  Future datePicking() async {
    var myFormat = DateFormat('yyyy-MM-dd');
    var today = DateTime.now();

    date = await showDatePicker(
        context: context,
        initialDate: today,
        firstDate: today,
        lastDate: DateTime(today.year + 5));
    // d = DateTime.parse(myFormat.format(date!));
    // var dateTime1 = DateFormat('d/M/yyyy').parse(requestStartDate.toString());
    if (date == null) return;
    if (date != null) {
      print(date);
      setState(() {
        requestStartDate.text = "${myFormat.format(date)}";
        // DateTime datefromat = DateTime.parse(requestStartDate.text);
        // print(datefromat.runtimeType);
        print(requestStartDate.text);
      });
    }
  }
  // var dates = DateTime.tryParse(date);

  Future timePicking() async {
    var times = TimeOfDay.now();
    var time = await showTimePicker(context: context, initialTime: times);
    if (time == null) return;
    if (time != null) {
      setState(() {
        requestStartTime.text = time.format(context).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dateformat = int.parse(requestContactNumber.toString());
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double barApp = AppBar().preferredSize.height;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        // automaticallyImplyLeading: false,
        title: Row(
          children: [
            // Container(
            //   child: IconButton(
            //     onPressed: () {

            //     },
            //     icon: Icon(
            //       Icons.arrow_back,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
            Container(
              child: Text(
                "Request For Blood",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Container(
                    height: height * 0.05,
                    width: width * 0.90,
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Choose Blood Group",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(1),
                  height: height * 0.09,
                  width: width * 0.87,
                  child: Card(
                    elevation: 5,
                    child: Container(
                      color: Color(0xffCFCECE),
                      height: height * 0.09,
                      width: width * 0.60,
                      child: Wrap(
                        spacing: 1.7,
                        children: [
                          bloodGroupInkWell(
                              height: height,
                              width: width,
                              text: "A+",
                              onTap: () {
                                setState(() {
                                  aplus = true;
                                  aminus = false;
                                  bplus = false;
                                  bminus = false;
                                  oplus = false;
                                  ominus = false;
                                  abplus = false;
                                  abminus = false;
                                  aplus == true
                                      ? bloodGroup = 'A+'
                                      : bloodGroup = '';
                                  print(bloodGroup);
                                });
                              },
                              val: aplus),
                          bloodGroupInkWell(
                              height: height,
                              width: width,
                              text: "A-",
                              onTap: () {
                                setState(() {
                                  aminus = !aminus;
                                  bplus = false;
                                  bminus = false;
                                  oplus = false;
                                  aplus = false;
                                  ominus = false;
                                  abplus = false;
                                  abminus = false;
                                  aminus == true
                                      ? bloodGroup = 'A-'
                                      : bloodGroup = '';
                                  print(bloodGroup);
                                });
                              },
                              val: aminus),
                          bloodGroupInkWell(
                              height: height,
                              width: width,
                              text: "B+",
                              onTap: () {
                                setState(() {
                                  bplus = !bplus;
                                  bminus = false;
                                  oplus = false;
                                  aplus = false;
                                  aminus = false;
                                  ominus = false;
                                  abplus = false;
                                  abminus = false;
                                  bplus == true
                                      ? bloodGroup = 'B+'
                                      : bloodGroup = '';
                                  print(bloodGroup);
                                });
                              },
                              val: bplus),
                          bloodGroupInkWell(
                              height: height,
                              width: width,
                              text: "B-",
                              onTap: () {
                                setState(() {
                                  bminus = !bminus;
                                  oplus = false;
                                  aplus = false;
                                  aminus = false;
                                  bplus = false;
                                  ominus = false;
                                  abplus = false;
                                  abminus = false;
                                  bminus == true
                                      ? bloodGroup = 'B-'
                                      : bloodGroup = '';
                                  print(bloodGroup);
                                });
                              },
                              val: bminus),
                          bloodGroupInkWell(
                              height: height,
                              width: width,
                              text: "O+",
                              onTap: () {
                                setState(() {
                                  oplus = !oplus;
                                  aplus = false;
                                  aminus = false;
                                  bplus = false;
                                  bminus = false;
                                  ominus = false;
                                  abplus = false;
                                  abminus = false;
                                  oplus == true
                                      ? bloodGroup = 'O+'
                                      : bloodGroup = '';
                                  print(bloodGroup);
                                });
                              },
                              val: oplus),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(1),
                        height: height * 0.09,
                        width: width * 0.87,
                        child: Card(
                          elevation: 5,
                          child: Container(
                            color: Color(0xffCFCECE),
                            height: height * 0.09,
                            width: width * 0.60,
                            child: Wrap(
                              spacing: 1.7,
                              children: [
                                bloodGroupInkWell(
                                    height: height,
                                    width: width,
                                    text: "O-",
                                    onTap: () {
                                      setState(() {
                                        ominus = !ominus;
                                        bplus = false;
                                        bminus = false;
                                        oplus = false;
                                        aplus = false;
                                        aminus = false;
                                        abplus = false;
                                        abminus = false;
                                        ominus == true
                                            ? bloodGroup = 'O-'
                                            : bloodGroup = '';
                                        print(bloodGroup);
                                      });
                                    },
                                    val: ominus),
                                bloodGroupInkWell(
                                    height: height,
                                    width: width,
                                    text: "AB+",
                                    onTap: () {
                                      setState(() {
                                        abplus = !abplus;
                                        bplus = false;
                                        bminus = false;
                                        oplus = false;
                                        aplus = false;
                                        aminus = false;
                                        ominus = false;
                                        abminus = false;
                                        abplus == true
                                            ? bloodGroup = 'AB+'
                                            : bloodGroup = '';
                                        print(bloodGroup);
                                      });
                                    },
                                    val: abplus),
                                bloodGroupInkWell(
                                    height: height,
                                    width: width,
                                    text: "AB"
                                        "-",
                                    onTap: () {
                                      setState(() {
                                        abminus = !abminus;
                                        bplus = false;
                                        bminus = false;
                                        oplus = false;
                                        aplus = false;
                                        aminus = false;
                                        ominus = false;
                                        abplus = false;
                                        abminus == true
                                            ? bloodGroup = 'AB-'
                                            : bloodGroup = '';
                                        print(bloodGroup);
                                      });
                                    },
                                    val: abminus),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: height * 0.05,
                  width: width * 0.90,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Location",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    width: width * 0.85,
                    child: TextField(
                      controller: requestLocation,
                      decoration: InputDecoration(
                        labelText: "Enter Your Location",
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height * 0.05,
                  width: width * 0.90,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Date",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    width: width * 0.85,
                    child: TextFormField(
                      enabled: false,
                      controller: requestStartDate,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        suffixIcon: InkWell(
                          onTap: datePicking,
                          child: Container(
                              height: (width * 0.85) * 0.1,
                              child: Image.asset(
                                  "assets/Bloodmoduleimages/blackcalender.png")),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height * 0.05,
                  width: width * 0.90,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Time",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    width: width * 0.85,
                    child: TextFormField(
                      enabled: false,
                      controller: requestStartTime,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        suffixIcon: InkWell(
                          onTap: timePicking,
                          child: Container(
                              height: (width * 0.85) * 0.1,
                              child: Image.asset(
                                  "assets/Bloodmoduleimages/time.png")),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height * 0.05,
                  width: width * 0.90,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Blood Unit",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    width: width * 0.86,
                    child: TextField(
                      controller: requestBloodUnit,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Enter Uint of blood you need",
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height * 0.05,
                  width: width * 0.90,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Patient",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  height: height * 0.1,
                  width: width * 0.90,
                  child: Card(
                    elevation: 5,
                    child: Row(
                      children: [
                        Container(
                          child: Container(
                            height: height * 0.1,
                            width: width * 0.52,
                            child: TextFormField(
                              controller: requestPatientName,
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                labelText: "Enter patient name",
                              ),
                            ),
                          ),
                        ),
                        genderFunction(
                            val: genderClick,
                            height: height,
                            width: width,
                            gender: 'Male',
                            onTap: () {
                              setState(() {
                                genderClick = !false;
                                genderFemaleClick = false;
                                genderClick == true
                                    ? gender = "Male"
                                    : gender = "";
                                print(gender);
                              });
                            }),
                        genderFunction(
                            val: genderFemaleClick,
                            height: height,
                            width: width,
                            gender: 'Female',
                            onTap: () {
                              setState(() {
                                genderFemaleClick = !false;
                                genderClick = false;
                                genderFemaleClick == true
                                    ? gender = "Female"
                                    : gender = "";
                                print("Female");
                              });
                            }),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height * 0.05,
                  width: width * 0.90,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Contact No",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    width: width * 0.88,
                    child: TextField(
                      controller: requestContactNumber,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Enter Your Contact No",
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: apiPost,
                  // apiPost,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 20),
                    height: height * 0.07,
                    width: width * 0.7,
                    color: Color(0xff0A5255),
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  InkWell genderFunction({
    height,
    val,
    width,
    gender,
    onTap,
  }) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        height: height * 0.09,
        width: (width * 0.52) * 0.344,
        color: val == false ? Colors.white : Color(0xff0A5255),
        // color: Color(0xff0A5255),
        child: Text(
          gender,
          style: TextStyle(
            color: val == false ? Colors.black : Colors.white,
          ),
        ),
      ),
      onTap: onTap,
    );
  }

  bloodGroupInkWell({height, width, text, onTap, val}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: (height * 0.08) * 0.93,
        width: (width * 0.80) / 4.9,
        color: val == false ? Colors.white : Color(0xff0A5255),
        child: Text(
          text,
          style: TextStyle(
            color: val == false ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  apiPost() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    var gettingId = prefer.getStringList('idS');
    var gettingUserId = gettingId[1];
    var gettingFamilyId = gettingId[0];
    logger.w(gettingUserId);
    logger.w(gettingFamilyId);
    var url =
        Uri.parse('https://www.cviacserver.tk/parampara/v1/postBloodRequest');
    var response = await http.post(url, body: <String, dynamic>{
      "id": gettingUserId.toString(),
      "blood_group": bloodGroup.toString(),
      "date": requestStartDate.text.toString(),
      "time": requestStartTime.text.toString(),
      "location": requestLocation.text.toString(),
      "gender": gender.toString(),
      "contact_no": requestContactNumber.text.toString(),
      "blood_unit": requestBloodUnit.text.toString(),
      "name": requestPatientName.text.toString(),
    });
    print(json.decode(response.body));
    print(response.statusCode);
    var decodeDetails = json.decode(response.body);
    print(decodeDetails);
    var extractedDetail = decodeDetails['status'];
    print(extractedDetail);
    if (extractedDetail == true) {
      final snackBar = SnackBar(
        backgroundColor: Colors.teal,
        content: Text('Requested Successfully'),
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
              builder: (BuildContext context) => FindDonorPage()));
    } else {
      final snackBar = SnackBar(
        backgroundColor: Colors.teal,
        content: Text('Request Failed'),
        duration: Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
