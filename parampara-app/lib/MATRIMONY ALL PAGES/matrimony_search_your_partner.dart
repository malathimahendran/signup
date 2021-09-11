import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googleandfacebook/MATRIMONY%20ALL%20PAGES/BEST%20MATCHES%20PAGE/best_matches.dart';
import 'package:googleandfacebook/MATRIMONY%20ALL%20PAGES/MANAGE%20PHOTOS%20PAGE/manage_photos.dart';
import 'package:googleandfacebook/MATRIMONY%20ALL%20PAGES/Matrimony/Matrimonyfirstpage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:logger/logger.dart';
import 'package:select_form_field/select_form_field.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'BEST MATCHES PAGE/best_matches_filter.dart';
import 'MATRIMONY SUPPORT PAGES/custom_text_form_field_button.dart';
import 'MATRIMONY SUPPORT PAGES/custom_two_empty_text_form_field.dart';

class MatrimonySearchYourPartner extends StatefulWidget {
  @override
  _MatrimonySearchYourPartnerState createState() =>
      _MatrimonySearchYourPartnerState();
}

class _MatrimonySearchYourPartnerState
    extends State<MatrimonySearchYourPartner> {
  final l = Logger();
  var text1, text2;
  var gender = TextEditingController();
  var maritalstatus = TextEditingController();
  var height1 = TextEditingController();
  var agestart = TextEditingController();
  var ageend = TextEditingController();
  var weight = TextEditingController();
  var educationcontroller = TextEditingController();
  var occupationcontroller = TextEditingController();
  var locationcontroller = TextEditingController();
  var district = TextEditingController();
  var country = TextEditingController();
  var state = TextEditingController();
  var startingAgeController = TextEditingController();
  var endingAgeController = TextEditingController();
  var onTapStart;
  var onTapEnd;
  var controller;
  var controller1, controller2;
  var text;
  var items1;
  var familyId;
  var icon, icon1;
  var name, email;
  var item1, item2, results;
  bool isClicked = false, isClickedSecond = false;
  var hintText;
  var hintText1;
  var genderres,
      maritalstatusres,
      heightres,
      ageres,
      educationres,
      occupationres,
      locationres;
  double changingValue = 0.0;
  getMatFam() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    familyId = prefer.getStringList('idS');
    print(familyId[0]);
    print(familyId[1]);
    var url = Uri.parse(
        "https://www.cviacserver.tk/parampara/v1/filterMaritalStatus");
    var response = await http.post(url, body: {
      'family_id': familyId[0].toString(),
      'gender': gender.text.toString(),
      'status': maritalstatus.text.toString(),
      'education': educationcontroller.text.toString(),
      'occupation': occupationcontroller.text.toString(),
      'location': district.text.toString(),
      'height': height1.text.toString(),
      'weight': weight.text.toString(),
    });
    print(response.body);
    var decodeDetails = json.decode(response.body);
    results = decodeDetails['results'];

    print(results);
    print(76);
    print(decodeDetails);
    var extractedDetail = decodeDetails['status'];

    print(extractedDetail);
    print(82);

    if (extractedDetail == true) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BestMatchesFilter(result: results)));
    } else {
      final snackBar = SnackBar(content: Text(" No datas found"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  List<Map<String, dynamic>> genderitem = [
    {
      'value': "Male",
      'label': 'Male',
    },
    {
      'value': "Female",
      'label': 'Female',
    },
  ];
  List<Map<String, dynamic>> statusitem = [
    {
      'value': "Unmarried",
      'label': 'Unmarried',
    },
    {
      'value': "Divorced",
      'label': 'Divorced',
    },
    {
      'value': "Separated",
      'label': 'Separated',
    },
    {
      'value': "Widow/Widower",
      'label': 'Widow/Widower',
    },
  ];
  List<Map<String, dynamic>> religion = [
    {
      'value': "Hindu",
      'label': 'Hindu',
    },
    {
      'value': "Muslim",
      'label': 'Muslim',
    },
    {
      'value': "Christian",
      'label': 'Christian',
    },
  ];
  List<Map<String, dynamic>> occupation = [
    {
      'value': "Private",
      'label': 'Private',
    },
    {
      'value': "Government",
      'label': 'Government',
    },
    {
      'value': "Business",
      'label': 'Business',
    },
    {
      'value': "UnEmployee",
      'label': 'UnEmployee',
    },
  ];

  List<Map<String, dynamic>> education = [
    {
      'value': "UG",
      'label': 'UG',
    },
    {
      'value': "PG",
      'label': 'PG',
    },
    {
      'value': "12th",
      'label': '12th',
    },
    {
      'value': "10th",
      'label': '10th',
    },
    {
      'value': "Below 10th",
      'label': 'Below 10th',
    },
    {
      'value': "UnEducated",
      'label': 'UnEducated',
    },
  ];
  List<Map<String, dynamic>> items = [
    {
      'value': "123",
      'label': '454',
    },
    {
      'value': "127",
      'label': '658',
    },
    {
      'value': "124",
      'label': '89',
    },
  ];
  List<Map<String, dynamic>> heightitem = [
    {
      'value': "4ft",
      'label': '4ft',
    },
    {
      'value': "5ft",
      'label': '5ft',
    },
    {
      'value': "6ft",
      'label': '6ft',
    },
    {
      'value': "7ft",
      'label': '7ft',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var status = MediaQuery.of(context).padding.top;
    var appBar = AppBar().preferredSize.height;

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
          'Search your Partner',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        height: (height - appBar),
        width: width,
        padding: EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customTwoHeading(height, appBar, width,
                  text1 = "I am looking for a ", text2 = "Marital Status"),
              SizedBox(
                height: ((height - appBar) * 0.004),
              ),
              customTwoEmptyTextFormField(
                height,
                appBar,
                width,
                icon = null,
                icon1 = null,
                hintText = null,
                hintText1 = null,
                controller1 = gender,
                controller2 = maritalstatus,
                item1 = genderitem,
                item2 = statusitem,
              ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              customOneHeading(
                height,
                appBar,
                width,
                text = "Height",
              ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              Container(
                height: (height - appBar) * 0.05,
                width: (width),
                child: SelectFormField(
                  controller: height1,
                  // icon: Icon(Icons.people, color: Colors.black),
                  // labelText: 'Gender',
                  changeIcon: true,
                  dialogTitle: 'Pick a item',
                  dialogCancelBtn: 'CANCEL',
                  enableSearch: true,
                  dialogSearchHint: 'Search item',
                  items: heightitem,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                    filled: true,
                    suffixIcon: Icon(
                      Icons.arrow_drop_down,
                    ),
                    fillColor: Colors.white,

                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.teal, width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.teal, width: 1),
                    ),
                    // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.teal, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              customOneHeading(
                height,
                appBar,
                width,
                text = "Age",
              ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              Container(
                height: (height - appBar) * 0.05,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: (height - appBar) * 0.05,
                      width: (width - 40) * 0.47,
                      child: TextFormField(
                        controller: agestart,
                        decoration: InputDecoration(
                          // hintText: hintText,

                          hintStyle: TextStyle(color: Colors.grey),
                          // suffixIcon: Icon(icon),
                          disabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                              color: HexColor('#0A4E51'),
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                              color: HexColor('#0A4E51'),
                              width: 1,
                            ),
                          ),
                          // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                              color: HexColor('#0A4E51'),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                              color: HexColor('#0A4E51'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: (height - appBar) * 0.05,
                      width: (width - 40) * 0.47,
                      child: TextFormField(
                        controller: ageend,
                        decoration: InputDecoration(
                          hintText: hintText1,
                          hintStyle: TextStyle(color: Colors.grey),

                          disabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                              color: HexColor('#0A4E51'),
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                              color: HexColor('#0A4E51'),
                              width: 1,
                            ),
                          ),
                          // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                              color: HexColor('#0A4E51'),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                              color: HexColor('#0A4E51'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   height: (height - appBar) * 0.05,
              //   width: (width),
              //   child: SliderTheme(
              //     data: SliderThemeData(
              //       thumbColor: Colors.amber,
              //       activeTickMarkColor: Colors.black,
              //     ),
              //     child: Slider(
              //       divisions: 100,
              //       label: changingValue.abs().toString(),
              //       activeColor: Colors.teal,
              //       inactiveColor: Colors.red,
              //       min: startValue,
              //       max: endValue,
              //       value: changingValue,
              //       onChanged: (val) {
              //         setState(() {
              //           changingValue = val;
              //         });
              //       },
              //     ),
              //   ),
              // ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),

              customOneHeading(
                height,
                appBar,
                width,
                text = "Education Catergory",
              ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              customSelectFormField(height, appBar, width, hintText = null,
                  items1 = education, controller = educationcontroller),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              customOneHeading(
                height,
                appBar,
                width,
                text = "Occupation Category",
              ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              customSelectFormField(height, appBar, width, hintText = null,
                  items1 = occupation, controller = occupationcontroller),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              customOneHeading(
                height,
                appBar,
                width,
                text = "Location",
              ),

              // customTwoEmptyTextFormField(
              //   height,
              //   appBar,
              //   width,
              //   icon = Icons.arrow_drop_down,
              //   icon1 = Icons.arrow_drop_down,
              //   hintText = 'Country',
              //   hintText1 = 'State',
              //   controller1 = country,
              //   controller2 = state,
              // ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
              Container(
                height: (height - appBar) * 0.05,
                width: (width),
                child: TextFormField(
                  // icon: Icon(Icons.people, color: Colors.black),
                  // labelText: 'Gender',
                  controller: district,
                  decoration: InputDecoration(
                    hintText: null,
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                    filled: true,

                    fillColor: Colors.white,

                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.teal, width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.teal, width: 1),
                    ),
                    // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.teal, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ((height - appBar) * 0.15),
              ),
              Container(
                height: (height - appBar) * 0.05,
                width: width,
                child: doubleRowButton(height, appBar, width),
              ),
              SizedBox(
                height: ((height - appBar) * 0.015),
              ),
            ],
          ),
        ),
      ),
    );
  }

  startIncrementDecrement() {}
  endIncrementDecrement() {}
  Container customSelectFormField(double height, double appBar, double width,
      hintText, items1, controller) {
    return Container(
      height: (height - appBar) * 0.05,
      width: (width),
      child: SelectFormField(
        controller: controller,
        // icon: Icon(Icons.people, color: Colors.black),
        // labelText: 'Gender',
        changeIcon: true,
        dialogTitle: 'Pick a item',
        dialogCancelBtn: 'CANCEL',
        enableSearch: true,
        dialogSearchHint: 'Search item',
        items: items1,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
          filled: true,
          suffixIcon: Icon(
            Icons.arrow_drop_down,
          ),
          fillColor: Colors.white,

          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.teal, width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.teal, width: 1),
          ),
          // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.teal, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.teal),
          ),
        ),
      ),
    );
  }

  Widget doubleRowButton(double height, double appBar, double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isClicked = !isClicked;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.teal.shade700),
              color: isClicked == true ? Colors.teal : Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            height: (height - appBar) * 0.05,
            width: (width - 40) * 0.45,
            child: Center(
                child: Text(
              'Save',
              style: TextStyle(
                fontSize: 20,
                color: isClicked == true ? Colors.white : Colors.black,
              ),
            )),
          ),
        ),
        InkWell(
          onTap: () {
            getMatFam();
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.teal.shade700),
              color: isClickedSecond == true ? Colors.teal : Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            height: (height - appBar) * 0.05,
            width: (width - 40) * 0.45,
            child: Center(
                child: Text(
              'Search',
              style: TextStyle(
                fontSize: 20,
                color: isClickedSecond == true ? Colors.white : Colors.black,
              ),
            )),
          ),
        ),
      ],
    );
  }

  Container customOneHeading(double height, double appBar, double width, text) {
    return Container(
      height: (height - appBar) * 0.03,
      width: width,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget customTwoHeading(
      double height, double appBar, double width, text1, text2) {
    return Container(
      height: ((height - appBar)) * 0.05,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              text1,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: width * 0.04,
          ),
          Container(
            padding: EdgeInsets.only(
              right: 40,
            ),
            child: Text(
              text2,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
