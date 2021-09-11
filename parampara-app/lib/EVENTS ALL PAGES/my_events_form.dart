import 'package:flutter/material.dart';
import 'package:googleandfacebook/EVENTS%20ALL%20PAGES/event_main_first.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import 'EVENTS SUPPORT/custom_description_text_form_field.dart';
import 'EVENTS SUPPORT/custom_text_text_form_field.dart';
import 'EVENTS SUPPORT/custom_text_text_form_field_icon.dart';

class MyEventsFormPage extends StatefulWidget {
  @override
  _MyEventsFormPageState createState() => _MyEventsFormPageState();
}

class _MyEventsFormPageState extends State<MyEventsFormPage> {
  var dateController = TextEditingController();
  var selectedDate;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var statusBar = MediaQuery.of(context).padding.top;
    var appBar = AppBar().preferredSize.height;
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
        actions: <Widget>[
          FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (BuildContext context) => null));
              },
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Back",
                    style: TextStyle(color: Colors.white),
                  ))),
        ],
        title: Text(
          "My Events",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: (height - appBar),
        width: width,
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: (height - appBar) * 0.70,
                width: width,
                padding: EdgeInsets.only(
                  top: 15,
                  left: 10,
                  right: 10,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextAndTextFormField(
                        height: height,
                        appBar: appBar,
                        width: width,
                        text: 'Event Name',
                      ),
                      SizedBox(
                        height: ((height - appBar) * 0.80) * 0.01,
                      ),
                      CustomTextTextFormFieldIcon(
                        height: height,
                        appBar: appBar,
                        width: width,
                        icon: Icons.calendar_today,
                        text: 'Date',
                        onPressed: showDate,
                        controller: dateController,
                      ),
                      SizedBox(
                        height: ((height - appBar) * 0.80) * 0.01,
                      ),
                      CustomTextTextFormFieldIcon(
                        height: height,
                        appBar: appBar,
                        width: width,
                        icon: Icons.lock_clock,
                        text: 'Time',
                        onPressed: () {},
                        controller: null,
                      ),
                      SizedBox(
                        height: ((height - appBar) * 0.80) * 0.01,
                      ),
                      CustomTextAndTextFormField(
                        height: height,
                        appBar: appBar,
                        width: width,
                        text: 'Place',
                      ),
                      SizedBox(
                        height: ((height - appBar) * 0.80) * 0.01,
                      ),
                      CustomTextAndTextFormField(
                        height: height,
                        appBar: appBar,
                        width: width,
                        text: 'Contact No',
                      ),
                      SizedBox(
                        height: ((height - appBar) * 0.80) * 0.02,
                      ),
                      Container(
                        height: ((height - appBar) * 0.80) * 0.05,
                        width: width,
                        child: Text(
                          'Description',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ((height - appBar) * 0.80) * 0.01,
                      ),
                      CustomDescriptionTextFormField(
                          height: height, appBar: appBar, width: width),
                      SizedBox(
                        height: ((height - appBar) * 0.80) * 0.02,
                      ),
                      Container(
                        height: ((height - appBar) - 15) * 0.08,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.teal.shade700),
                        ),
                        child: Center(
                          child: Text(
                            'Upload picture',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyEventsAdd()));
              },
              child: Container(
                height: ((height - appBar)) * 0.08,
                width: width,
                color: Colors.teal.shade900,
                child: Center(
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDate() async {
    selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2022),
    );

    setState(() {
      dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
    });
  }
}
