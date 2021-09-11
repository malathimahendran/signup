import 'package:flutter/material.dart';
import 'package:googleandfacebook/models/matrimonyusermodel.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:select_form_field/select_form_field.dart';
import 'Matrimonyfirstpage.dart';

import 'customfield/basic_details_support_page.dart';
import 'Matrimony_basic_details_2.dart';

class MatrimonySecond extends StatefulWidget {
  // MatrimonySecond({this.datapass});
  // final datapass;
  // MatrimonySecond({Key key}) : super(key: key);

  @override
  _MatrimonySecondState createState() => _MatrimonySecondState();
}

class _MatrimonySecondState extends State<MatrimonySecond> {
  var text;
  var controllertext, controllerselect;
  var items;
  final name = TextEditingController();
  final dob = TextEditingController();
  final numofchildren = TextEditingController();
  final mobilenumber = TextEditingController();
  final whatsappnumber = TextEditingController();
  final email = TextEditingController();
  final bodytype = TextEditingController();
  final physicalstatus = TextEditingController();
  final complexion = TextEditingController();
  final height1 = TextEditingController();
  final maritalstatus = TextEditingController();
  final gender = TextEditingController();
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
  final List<Map<String, dynamic>> bodytypeitems = [
    {
      'value': 'Athletic',
      'label': 'Athletic',
    },
    {
      'value': 'Average',
      'label': 'Average',
    },
    {
      'value': 'Heavy',
      'label': 'Heavy',
    },
    {
      'value': 'Slim',
      'label': 'Slim',
    },
  ];
  final List<Map<String, dynamic>> physicalstatusitems = [
    {
      'value': 'Any',
      'label': 'Any',
    },
    {
      'value': 'NormalPerson',
      'label': 'NormalPerson',
    },
    {
      'value': 'Deaf/Dumb',
      'label': 'Deaf/Dumb',
    },
    {
      'value': 'Blind',
      'label': 'Blind',
    },
    {
      'value': 'Physically Challenged By Birth',
      'label': 'Physically Challenged By Birth',
    },
    {
      'value': 'Physically Challenged By Incident',
      'label': 'Physically Challenged By Incident',
    },
    {
      'value': 'Mentally Challenged By Birth',
      'label': 'Mentally Challenged By Birth',
    },
    {
      'value': 'Mentally Challenged By Incident',
      'label': 'Mentally Challenged By Incident',
    },
    {
      'value': 'With other disability',
      'label': 'With other disability',
    },
  ];
  final List<Map<String, dynamic>> complexionitems = [
    {
      'value': 'Fair',
      'label': 'Fair',
    },
    {
      'value': 'Dark',
      'label': 'Dark',
    },
    {
      'value': 'Medium',
      'label': 'Medium',
    },
    {
      'value': 'VeryFair',
      'label': 'VeryFair',
    },
    {
      'value': 'Wheatish',
      'label': 'Wheatish',
    },
  ];
  final List<Map<String, dynamic>> maritalstatusitems = [
    {
      'value': 'Unmarried',
      'label': 'Unmarried',
    },
    {
      'value': 'Divorced',
      'label': 'Divorced',
    },
    {
      'value': 'Separated',
      'label': 'Separated',
    },
    {
      'value': 'Widow/Widower',
      'label': 'Widow/Widower',
    },
  ];
  final List<Map<String, dynamic>> genderitems = [
    {
      'value': 'Male',
      'label': 'Male',
    },
    {
      'value': 'Female',
      'label': 'Female',
    },
    {
      'value': 'TransGender',
      'label': 'TransGender',
    },
  ];
  final List<Map<String, dynamic>> heightitems = [
    {
      'value': '4ft',
      'label': '4ft',
    },
    {
      'value': '5ft',
      'label': '5ft',
    },
    {
      'value': '6ft',
      'label': '6ft',
    },
    {
      'value': '7ft',
      'label': '7ft',
    },
  ];
  var appBar, hintText;
  MatrimonyUserData setUserData() {
    return MatrimonyUserData(
        name: name.text,
        dob: dob.text,
        numofchildren: numofchildren.text,
        mobilenumber: mobilenumber.text,
        whatsappnumber: whatsappnumber.text,
        email: email.text,
        bodytype: bodytype.text,
        physicalstatus: physicalstatus.text,
        complexion: complexion.text,
        height1: height1.text,
        maritalstatus: maritalstatus.text,
        gender: gender.text);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var onPressed;

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
              customTextFormField1(
                  height, width, text = "Name", controllertext = name),
              SizedBox(height: (height - 20) * 0.02),
              customSelectFormField1(height, width, text = "Body Type",
                  items = bodytypeitems, controllerselect = bodytype),
              SizedBox(height: (height - 20) * 0.02),
              customSelectFormField1(
                  height,
                  width,
                  text = "Physical Status",
                  items = physicalstatusitems,
                  controllerselect = physicalstatus),
              SizedBox(height: (height - 20) * 0.02),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  height: (height - 20) * 0.05,
                  width: (width - 30) * 0.4,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "DOB",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: (height - 20) * 0.05,
                  width: (width - 30) * 0.6,
                  child: TextFormField(
                    readOnly: true,
                    controller: dob,
                    onTap: () async {
                      var date = await showDatePicker(
                          context: context,
                          // initialDate: DateTime(1900),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      dob.text = date.toString().substring(0, 10);
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () async {
                            var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));
                            dob.text = date.toString().substring(0, 10);
                          }),
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
              customSelectFormField1(height, width, text = "Complexion",
                  items = complexionitems, controllerselect = complexion),
              SizedBox(height: (height - 20) * 0.02),
              customSelectFormField1(height, width, text = "Height",
                  items = heightitems, controllerselect = height1),
              SizedBox(height: (height - 20) * 0.02),
              customSelectFormField1(height, width, text = "Marital Status",
                  items = maritalstatusitems, controllerselect = maritalstatus),
              SizedBox(height: (height - 20) * 0.02),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  height: (height - 20) * 0.05,
                  width: (width - 30) * 0.4,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Number of children",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: (height - 20) * 0.05,
                  width: (width - 30) * 0.6,
                  child: TextFormField(
                    controller: numofchildren,
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
              customSelectFormField1(height, width, text = "Gender",
                  items = genderitems, controllerselect = gender),
              SizedBox(height: (height - 20) * 0.02),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  height: (height - 20) * 0.05,
                  width: (width - 30) * 0.4,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Mobile Number",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: (height - 20) * 0.05,
                  width: (width - 30) * 0.6,
                  child: TextFormField(
                    controller: mobilenumber,
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  height: (height - 20) * 0.05,
                  width: (width - 30) * 0.4,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Whatsapp Number",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: (height - 20) * 0.05,
                  width: (width - 30) * 0.6,
                  child: TextFormField(
                    controller: whatsappnumber,
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  height: (height - 20) * 0.05,
                  width: (width - 30) * 0.4,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: (height - 20) * 0.05,
                  width: (width - 30) * 0.6,
                  child: TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
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
                          Map<dynamic, dynamic> postmat = {
                            "name": name.text,
                          };
                          print(postmat);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MatrimonyBasicDetails2(
                                        passdata: setUserData(),
                                      )));
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
