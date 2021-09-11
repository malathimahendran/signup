import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'BloodHomePage.dart';

class WillingDonate extends StatefulWidget {
  @override
  _WillingDonateState createState() => _WillingDonateState();
}

var text = Text(
  "Select",
  style: TextStyle(fontWeight: FontWeight.bold),
);

class _WillingDonateState extends State<WillingDonate> {
  var requestDonorName = TextEditingController();
  var requestBloodGroup = TextEditingController();
  var requestLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double barApp = AppBar().preferredSize.height;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0,
        shadowColor: Color(0xffFFFFFF),
        title: Row(
          children: [
            Container(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
              ),
            ),
            Container(
              child: Text(
                "Willing to Donate Blood",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      body: Container(
        color: Color(0xffFFFFFF),
        height: height - barApp,
        width: width,
        child: Column(
          children: [
            Container(
              height: (height - barApp) * 0.3,
              width: width * 0.75,
              child: Image.asset("assets/Bloodmoduleimages/blooddonate.png"),
            ),
            Container(
              height: ((height - barApp) * 0.3) * 0.95,
              width: width * 0.75,
              child: Column(
                children: [
                  Container(
                    height: (((height - barApp) * 0.3) * 0.95) / 3,
                    width: width * 0.75,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: (((height - barApp) * 0.3) * 0.95) / 3,
                          width: (width * 0.75) / 2,
                          child: Text(
                            "Donor Name",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          height: (((height - barApp) * 0.3) * 0.95) / 3,
                          width: (width * 0.75) / 2,
                          //color: Colors.blue,
                          child: TextField(
                            controller: requestDonorName,
                            decoration:
                                InputDecoration(hintText: 'Enter your Name'),
                          ),
                          // Text("James",style: TextStyle(fontSize: 19,color: Color(0xff0A5255)),),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: (((height - barApp) * 0.3) * 0.95) / 3,
                    width: width * 0.85,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: (((height - barApp) * 0.3) * 0.95) / 3,
                          width: (width * 0.75) / 2,
                          child: Text(
                            "Blood Group",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          height: (((height - barApp) * 0.3) * 0.95) / 3,
                          width: (width * 0.75) / 2,
                          //color: Colors.blue,
                          child: SelectFormField(
                            controller: requestBloodGroup,
                            labelText: "Select",
                            items: _items,
                          ),
                          // child: Text("O+Ve",style: TextStyle(fontSize: 19,color: Color(0xff0A5255)),),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: (((height - barApp) * 0.3) * 0.95) / 3,
                    width: width * 0.85,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: (((height - barApp) * 0.3) * 0.95) / 3,
                          width: (width * 0.75) / 2,
                          child: Text(
                            "Location",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          height: (((height - barApp) * 0.3) * 0.95) / 3,
                          width: (width * 0.75) / 2,
                          //color: Colors.blue,
                          child: TextField(
                            controller: requestLocation,
                            decoration:
                                InputDecoration(hintText: 'Enter your Loction'),
                          ),

                          // Text("Madurai",style: TextStyle(fontSize: 19,color: Color(0xff0A5255)),),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height * 0.15,
              width: width,
              child: Container(
                alignment: Alignment.centerRight,
                height: ((height - barApp) * 0.30) * 0.3,
                width: width * 0.70,
              ),
            ),
            InkWell(
              onTap: apiPost,
              child: Container(
                alignment: Alignment.center,
                height: height * 0.08,
                width: width * 0.72,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff0A5255)),
                child: Text(
                  "WILLING TO DONATE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  apiPost() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    var gettingId = prefer.getStringList('idS');
    var gettingUserId = gettingId[1];
    var url = Uri.parse('https://www.cviacserver.tk/parampara/v1/postDonar');
    var response = await http.post(url, body: <String, dynamic>{
      "id": gettingUserId.toString(),
      "blood_group": requestBloodGroup.text.toString(),
      "location": requestLocation.text.toString(),
    });
    print(json.decode(response.body));
    print(response.statusCode);
  }
}

final List<Map<String, dynamic>> _items = [
  {
    'value': 'O+ve',
    'label': 'O+ve',
  },
  {
    'value': 'O-ve',
    'label': 'O-ve',
  },
  {
    'value': 'B+ve',
    'label': 'B+ve',
  },
  {
    'value': 'B-ve',
    'label': 'B-ve',
  },
  {
    'value': 'A+ve',
    'label': 'A+ve',
  },
  {
    'value': 'A-ve',
    'label': 'A-ve',
  },
  {
    'value': 'AB+ve',
    'label': 'AB+ve',
  },
  {
    'value': 'AB-ve',
    'label': 'AB-ve',
  },
];
