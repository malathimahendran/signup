import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'customTextField.dart';
import 'jobRecruitmentlist.dart';

class JobRecruitment extends StatefulWidget {
  @override
  _JobRecruitmentState createState() => _JobRecruitmentState();
}

class _JobRecruitmentState extends State<JobRecruitment> {
  final dateController = TextEditingController();
  final dateController1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var appbarr = AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: <Color>[HexColor('#0A4E51'), HexColor('#149BA1')])),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        "Job Recruitment",
        style: TextStyle(color: Colors.white),
      ),
    );
    var height = MediaQuery.of(context).size.height;
    print(height);
    var width = MediaQuery.of(context).size.width;
    print(width);
    var appbar = appbarr.preferredSize.height;
    print(appbar);
    var bottom = kBottomNavigationBarHeight;
    print(bottom);
    var status = MediaQuery.of(context).padding.top;
    print(status);
    var text;
    return Scaffold(
        appBar: appbarr,
        body: Container(
            child: Padding(
          padding: EdgeInsets.only(top: 20, left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                customRowTextfieldJobRecruit(
                    height, width, text = "CompanyName"),
                SizedBox(height: (height - 20) * 0.02),
                customRowTextfieldJobRecruit(
                    height, width, text = "Designation"),
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
                          "Scheduling Date",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      height: (height - 20) * 0.05,
                      width: (width - 30) * 0.6,
                      child: TextFormField(
                        controller: dateController,
                        onTap: () async {
                          var date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));
                          dateController.text =
                              date.toString().substring(0, 10);
                        },
                        decoration: InputDecoration(
                          labelText: 'FromDate',
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
                          "",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      height: (height - 20) * 0.05,
                      width: (width - 30) * 0.6,
                      child: TextFormField(
                        controller: dateController1,
                        onTap: () async {
                          var date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));
                          dateController.text =
                              date.toString().substring(0, 10);
                        },
                        decoration: InputDecoration(
                          labelText: 'ToDate',
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
                customRowTextfieldJobRecruit(
                    height, width, text = "No Of Position"),
                SizedBox(height: (height - 20) * 0.02),
                customRowTextfieldJobRecruit(height, width, text = "Salary"),
                SizedBox(height: (height - 20) * 0.02),
                customRowTextfieldJobRecruit(
                    height, width, text = "Contact Name"),
                SizedBox(height: (height - 20) * 0.02),
                customRowTextfieldJobRecruit(height, width, text = "Travel By"),
                SizedBox(height: (height - 20) * 0.02),
                customRowTextfieldJobRecruit(
                    height, width, text = "Contact MailId"),
                SizedBox(height: (height - 20) * 0.04),
                customRowTextfieldJobRecruit(
                    height, width, text = "Contact No"),
                SizedBox(height: (height - 20) * 0.04),
                customRowTextfieldJobRecruit(height, width, text = "Skills"),
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
                  child: TextField(
                    maxLines: 7,
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
                          side:
                              BorderSide(color: HexColor('#0A4E51'), width: 2)),
                      color: HexColor('#0A4E51'),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => null));
                      },
                      child: Text(
                        "Apply For Job",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        )));
  }
}
