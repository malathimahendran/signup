import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class BestMatchesFullDetails extends StatefulWidget {
  BestMatchesFullDetails({this.bestMatches});
  final bestMatches;

  @override
  _BestMatchesFullDetailsState createState() => _BestMatchesFullDetailsState();
}

class _BestMatchesFullDetailsState extends State<BestMatchesFullDetails> {
  var decodeDetails;
  var name;

  var physicalstatus;
  var dateofbirth;
  var fname, mname, heightinch, image, text1, text2;

  var response1;
  var mobilenumber;
  var familyId,
      bodyType,
      complexion,
      maritalStatus,
      gender,
      whatsappNumber,
      email;
  @override
  void initState() {
    super.initState();
    func();
  }

  func() {
    setState(() {
      name = widget.bestMatches['name'];
      dateofbirth = widget.bestMatches['date_of_birth'];
      mobilenumber = widget.bestMatches['mobile_number'];
      physicalstatus = widget.bestMatches['physical_status'];
      fname = widget.bestMatches['f_name'];
      mname = widget.bestMatches['m_name'];
      heightinch = widget.bestMatches['height'];
      image = widget.bestMatches['photo2'];
      bodyType = widget.bestMatches['body_type'];
      complexion = widget.bestMatches['complexion'];
      maritalStatus = widget.bestMatches['marital_status'];
      gender = widget.bestMatches['gender'];
      whatsappNumber = widget.bestMatches['w_number'];
      email = widget.bestMatches['email'];
      print(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.bestMatches);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                HexColor('#0A4E51'),
                HexColor('#149BA1'),
              ],
            ),
          ),
        ),
        // backgroundColor: Colors.teal.shade700,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Best Matches',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "     View Details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(height: 30),
              Image.network(
                baseImageUrl + image,
                fit: BoxFit.fill,
                height: 150,
                width: 150,
              ),
              SizedBox(height: 20),
              Container(
                  // height: height,
                  width: width * 0.9,
                  color: Colors.teal[50],
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text("              Basic Details",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17)),
                        ),
                      ),
                      SizedBox(height: 10),
                      customContainer(text1 = "Name", text2 = "$name"),
                      SizedBox(height: 10),
                      customContainer(text1 = "Body Type", text2 = "$bodyType"),
                      SizedBox(height: 10),
                      customContainer(
                          text1 = "Physical Status", text2 = "$physicalstatus"),
                      SizedBox(height: 10),
                      customContainer(
                          text1 = "Date Of Birth", text2 = "$dateofbirth"),
                      SizedBox(height: 10),
                      customContainer(
                          text1 = "Complexion", text2 = "$complexion"),
                      SizedBox(height: 10),
                      customContainer(text1 = "Height", text2 = "$heightinch"),
                      SizedBox(height: 10),
                      customContainer(
                          text1 = "Marital Status", text2 = "$maritalStatus"),
                      SizedBox(height: 10),
                      customContainer(text1 = "Gender", text2 = "$gender"),
                      SizedBox(height: 10),
                      customContainer(
                          text1 = "Mobile No", text2 = "$mobilenumber"),
                      SizedBox(height: 10),
                      customContainer(
                          text1 = "Whatsapp No", text2 = "$whatsappNumber"),
                      SizedBox(height: 10),
                      customContainer(text1 = "Email", text2 = "$email"),
                    ],
                  )),

              // CustomText(text = "Name:", text1 = "$name"),
              // SizedBox(height: 10),
              // CustomText(text = "Date Of Birth:", text1 = "$dateofbirth"),
              // SizedBox(height: 10),
              // CustomText(text = "Mobile Number:", text1 = "$mobilenumber"),
              // SizedBox(height: 10),
              // CustomText(text = "physical_status:", text1 = "$physicalstatus"),
              // SizedBox(height: 10),
              // CustomText(text = "Father's name:", text1 = "$fname"),
              // SizedBox(height: 10),
              // CustomText(text = "Mother's name:", text1 = "$mname"),
              // SizedBox(height: 10),
              // CustomText(text = "Height:", text1 = "$heightinch"),
            ],
          ),
        ),
      ),
    );
  }

  Container customContainer(text1, text2) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(text2)
          ],
        ),
      ),
    );
  }
}
