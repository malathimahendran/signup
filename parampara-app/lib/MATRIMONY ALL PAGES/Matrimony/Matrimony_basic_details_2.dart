import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:googleandfacebook/MATRIMONY%20ALL%20PAGES/MANAGE%20PHOTOS%20PAGE/manage_photos.dart';
import 'package:googleandfacebook/models/matrimonyusermodel.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Matrimonysecondpage.dart';
// import 'package:image_picker/image_picker.dart';
import 'customfield/basic_details_support_page.dart';

class MatrimonyBasicDetails2 extends StatefulWidget {
  MatrimonyBasicDetails2({this.passdata});
  final MatrimonyUserData passdata;

  @override
  _MatrimonyBasicDetails2State createState() =>
      _MatrimonyBasicDetails2State(passdata: passdata);
}

class _MatrimonyBasicDetails2State extends State<MatrimonyBasicDetails2> {
  _MatrimonyBasicDetails2State({this.passdata});
  final passdata;
  var text;
  var controllerselect, controllertext;
  var items;

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'werwer',
      'label': 'werwer',
    },
    {
      'value': 'weqwew',
      'label': 'rrrr',
    },
    {
      'value': 'www',
      'label': 'www',
    },
  ];
  final List<Map<String, dynamic>> educationitems = [
    {
      'value': 'UG',
      'label': 'UG',
    },
    {
      'value': 'PG',
      'label': 'PG',
    },
    {
      'value': '10th',
      'label': '10th',
    },
    {
      'value': '12th',
      'label': '12th',
    },
    {
      'value': 'Below 10th',
      'label': 'Below 10th',
    },
    {
      'value': 'UnEducated',
      'label': 'UnEducated',
    },
  ];
  final List<Map<String, dynamic>> jobcategoryitems = [
    {
      'value': 'Private',
      'label': 'Private',
    },
    {
      'value': 'Government',
      'label': 'Government',
    },
    {
      'value': 'Business',
      'label': 'Business',
    },
  ];
  MatrimonyUserData setUserData1() {
    return MatrimonyUserData(
        annualIncome: annualIncome.text,
        education: education.text,
        jobcategory: jobcategory.text,
        joblocation: joblocation.text,
        fathersname: fathersname.text,
        fathersjob: fathersjob.text,
        mothersname: mothersname.text,
        mothersjob: mothersjob.text,
        currentaddress: currentaddress.text,
        notes: notes.text);
  }

  final TextEditingController annualIncome = TextEditingController();
  final TextEditingController education = TextEditingController();
  final TextEditingController jobcategory = TextEditingController();
  final TextEditingController joblocation = TextEditingController();
  final TextEditingController fathersname = TextEditingController();
  final TextEditingController mothersname = TextEditingController();
  final TextEditingController fathersjob = TextEditingController();
  final TextEditingController mothersjob = TextEditingController();
  final TextEditingController currentaddress = TextEditingController();
  final TextEditingController notes = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print('${passdata.name},108');
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[HexColor('#0A4E51'), HexColor('#149BA1')])),
        ),
        backgroundColor: Colors.teal,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Basic Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customSelectFormField1(height, width, text = "Education",
                  items = educationitems, controllerselect = education),
              SizedBox(height: (height - 20) * 0.02),
              customSelectFormField1(height, width, text = "Job Category",
                  items = jobcategoryitems, controllerselect = jobcategory),
              SizedBox(height: (height - 20) * 0.02),
              customTextFormField1(height, width, text = "Job Location",
                  controllertext = joblocation),
              SizedBox(height: (height - 20) * 0.02),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  height: (height - 20) * 0.05,
                  width: (width - 30) * 0.4,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Annual Income",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: (height - 20) * 0.05,
                  width: (width - 30) * 0.6,
                  child: TextFormField(
                    controller: annualIncome,
                    keyboardType: TextInputType.number,
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
              ]),
              SizedBox(height: (height - 20) * 0.02),
              customTextFormField1(height, width, text = "Father's Name",
                  controllertext = fathersname),
              SizedBox(height: (height - 20) * 0.02),
              customSelectFormField1(height, width, text = "Father's Job",
                  items = jobcategoryitems, controllerselect = fathersjob),
              SizedBox(height: (height - 20) * 0.02),
              customTextFormField1(height, width, text = "Mother's Name",
                  controllertext = mothersname),
              SizedBox(height: (height - 20) * 0.02),
              customSelectFormField1(height, width, text = "Mother's Job",
                  items = jobcategoryitems, controllerselect = mothersjob),
              SizedBox(height: (height - 20) * 0.02),
              Row(children: [
                Container(
                  height: (height - 20) * 0.1,
                  width: (width - 30) * 0.4,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Current Address",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: (height - 20) * 0.1,
                  width: (width - 30) * 0.6,
                  child: TextFormField(
                    controller: currentaddress,
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
              ]),
              SizedBox(height: (height - 20) * 0.02),
              Container(
                height: 100,
                child: TextFormField(
                  controller: notes,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    labelText: "Notes",
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
              SizedBox(height: (height - 20) * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 40,
                    width: width * 0.35,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            side: BorderSide(
                                color: HexColor('#0A4E51'), width: 2)),
                        color: Colors.white,
                        onPressed: () {},
                        child: Text("cancel")),
                  ),
                  Container(
                    height: 40,
                    width: width * 0.35,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            side: BorderSide(
                                color: HexColor('#0A4E51'), width: 2)),
                        // onHighlightChanged: (value) => onPressed,
                        highlightColor: HexColor('#0A4E51'),
                        color: Colors.white,
                        onPressed: () {
                          // print(postmatrimony1);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ManagePhotos(
                                      passdata1: setUserData1(),
                                      passdata: widget.passdata)));
                        },
                        child: Text(
                          "save",
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
