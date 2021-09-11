import 'package:flutter/material.dart';
import 'package:googleandfacebook/FamilyTourPlan/TakeTourPlan.dart';
import 'package:googleandfacebook/FamilyTourPlan/tripList.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'TakeTourPlan1.dart';
import 'customfield/TourPlanProfileCustomField.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TourPlanProfile extends StatefulWidget {
  TourPlanProfile({this.tourList});
  final tourList;

  @override
  _TourPlanProfileState createState() => _TourPlanProfileState();
}

class _TourPlanProfileState extends State<TourPlanProfile> {
  TextEditingController organisedByController = TextEditingController();
  TextEditingController startdateController = TextEditingController();
  TextEditingController enddateController = TextEditingController();
  TextEditingController fromplaceController = TextEditingController();
  TextEditingController toplaceController = TextEditingController();
  TextEditingController departureTimeController = TextEditingController();
  TextEditingController travelByController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayProfile();
  }

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
  var decodeDetails;
  var details;
  var detail;
  var details1;
  var sendinguserId;
  bool isCheck = false;
  TimeOfDay initialTime = TimeOfDay.now();
  var appbar = AppBar().preferredSize.height;

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
      tourId = widget.tourList['tour_id'];
      organisedBy = widget.tourList['o_by'].toString();
      organisedByController.text = widget.tourList['o_by'].toString();
      toplace = widget.tourList['toPlace'].toString();
      toplaceController.text = widget.tourList['toPlace'].toString();
      startdate = startdate;
      startdateController.text = startdate;
      enddate = enddate;
      enddateController.text = enddate;
      fromplace = widget.tourList['fromPlace'].toString();
      fromplaceController.text = widget.tourList['fromPlace'].toString();
      depatureTime = widget.tourList['departureTime'].toString();
      departureTimeController.text =
          widget.tourList['departureTime'].toString();
      travelBy = widget.tourList['travelBy'].toString();
      travelByController.text = widget.tourList['travelBy'].toString();
      contactNo = widget.tourList['contactNo'].toString();
      contactNoController.text = widget.tourList['contactNo'].toString();
      description = widget.tourList['description'].toString();
      descriptionController.text = widget.tourList['description'].toString();
    });

    // var url = Uri.parse(
    //     'https://www.cviacserver.tk/parampara/v1/getTourSinglePlan/4');
    // var response = await http.get(url);
    // // print(response.body);
    // var decodeDetails = json.decode(response.body);
    // // print(decodeDetails);
    // var result = decodeDetails['result'][decodeDetails['result'].length - 1];
    // print(result);
    // setState(() {
    //   organisedBy =
    //       decodeDetails['result'][decodeDetails['result'].length - 1]['o_by'];
    //   print(organisedBy);
    //   var k = decodeDetails['result'][decodeDetails['result'].length - 1]
    //           ['startDate']
    //       .toString();
    //   print(startdate);
    //   newList.insert(0, k);

    //   for (var i = 0; i < newList[0].length; i++) {
    //     newList1.add(newList[0][i]);
    //     if (newList1.length == 10) break;
    //   }

    //   startdate = newList1.join();
    //   print(startdate);

    //   var end = decodeDetails['result'][decodeDetails['result'].length - 1]
    //           ['endDate']
    //       .toString();

    //   newList3.insert(0, end);

    //   for (var i = 0; i < newList3[0].length; i++) {
    //     newList4.add(newList3[0][i]);
    //     if (newList4.length == 10) break;
    //   }

    //   enddate = newList4.join();
    //   print(enddate);

    //   fromplace = decodeDetails['result'][decodeDetails['result'].length - 1]
    //       ['fromPlace'];
    //   print(fromplace);
    //   toplace = decodeDetails['result'][decodeDetails['result'].length - 1]
    //       ['toPlace'];
    //   print(toplace);
    //   depatureTime = decodeDetails['result'][decodeDetails['result'].length - 1]
    //           ['departureTime']
    //       .toString();
    //   print(depatureTime);
    //   travelBy = decodeDetails['result'][decodeDetails['result'].length - 1]
    //       ['travelBy'];
    //   print(travelBy);
    //   contactNo = decodeDetails['result'][decodeDetails['result'].length - 1]
    //           ['contactNo']
    //       .toString();
    //   print(contactNo);
    //   description = decodeDetails['result'][decodeDetails['result'].length - 1]
    //       ['description'];
    //   print(description);
    // });
  }

  updateData() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    familyId = prefer.getStringList('idS');

    var url = Uri.parse(
        'https://www.cviacserver.tk/parampara/v1/updateTourPlan/${tourId}');
    var response = await http.put(url, body: {
      'id': familyId[0].toString(),
      'startDate': startdateController.text.toString(),
      'endDate': enddateController.text.toString(),
      'fromPlace': fromplaceController.text.toString(),
      'toPlace': toplaceController.text.toString(),
      'departureTime': departureTimeController.text.toString(),
      'o_by': organisedByController.text.toString(),
      'travelBy': travelByController.text.toString(),
      'description': descriptionController.text.toString(),
      'contactNo': contactNoController.text.toString()
    });
    print(response.body);
    var decoded = json.decode(response.body);
    print(decoded);
    var extractedDetail = decoded['status'];
    print(extractedDetail);
    if (extractedDetail == true) {
      final snackBar = SnackBar(
        backgroundColor: Colors.teal,
        content: Text('Updated Successfully'),
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
    }
  }

  triplist() async {
    // SharedPreferences prefer = await SharedPreferences.getInstance();
    // familyId = prefer.getStringList('idS');
    var url = Uri.parse(
        'https://www.cviacserver.tk/parampara/v1/getOpinion/${tourId}');
    var response = await http.get(url);
    print(response.body);
    decodeDetails = json.decode(response.body);
    setState(() {
      details = decodeDetails['result'];
      detail = decodeDetails['result'][0]['user_name'];
      sendinguserId = decodeDetails['result'][0]['id'];
      print(detail);

      print(details);
    });
  }

  delData() async {
    var url = Uri.parse(
        'https://www.cviacserver.tk/parampara/v1/deleteTourPlan/${tourId}');
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
              builder: (BuildContext context) => new TakeTourPlan()));
    }
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: InkWell(
                  onTap: () async {
                    await triplist();
                    showDialog(
                        context: context,
                        builder: (context) => Material(
                                child: Column(children: [
                              Container(
                                  height: 510,
                                  width: width * 0.9,
                                  child: details == null && isCheck == false
                                      ? Container(
                                          child: Center(
                                            child: SizedBox(
                                              height: 100,
                                              width: 100,
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ),
                                        )
                                      : ListView.builder(
                                          itemCount: details?.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              height: (height - appbar) * 0.15,
                                              width: width - 40,
                                              child: Card(
                                                color: Colors.teal,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                // color: Colors.red,
                                                child: Container(
                                                  height:
                                                      (height - appbar) * 0.15,
                                                  width: width - 40,
                                                  padding: EdgeInsets.only(
                                                      top: ((height - appbar) *
                                                              0.15) *
                                                          0.17,
                                                      left: 25),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      details[index][
                                                                  'user_name'] ==
                                                              null
                                                          ? Text("")
                                                          : Text(
                                                              'Accepted By:${details[index]['user_name']}',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      'RobotoMono',
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                      SizedBox(height: 15),
                                                      // Text(
                                                      //   'Organised By: ${details1['o_by'] ??= ''}',
                                                      //   style: TextStyle(
                                                      //       fontSize: 15,
                                                      //       fontFamily:
                                                      //           'RobotoMono',
                                                      //       color:
                                                      //           Colors.white),
                                                      // ),
                                                      SizedBox(height: 15),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          })),
                            ])));
                  },
                  child: Icon(Icons.bus_alert)),
            ),
            InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => Material(
                            child: Container(
                              // color: Colors.teal,
                              padding:
                                  EdgeInsets.only(top: 0, left: 50, right: 40),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 0, top: 20),
                                      child: Icon(Icons.edit),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      controller: organisedByController,
                                      decoration: InputDecoration(
                                        labelText: 'OrganisedBy',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: HexColor("#0A4E51"),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: HexColor("#0A4E51"),
                                              width: 1),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      controller: startdateController,
                                      decoration: InputDecoration(
                                        labelText: 'StartDate',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: HexColor("#0A4E51"),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: HexColor("#0A4E51"),
                                              width: 1),
                                        ),
                                      ),
                                      onTap: () async {
                                        var date = await showDatePicker(
                                            selectableDayPredicate: (day) {
                                              if ((day.month ==
                                                      DateTime.now().month) &&
                                                  (day.day <
                                                      DateTime.now().day)) {
                                                return false;
                                              } else {
                                                return true;
                                              }
                                            },
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2100));
                                        startdateController.text =
                                            date.toString().substring(0, 10);
                                      },
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      controller: enddateController,
                                      decoration: InputDecoration(
                                        labelText: 'EndDate',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: HexColor("#0A4E51"),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: HexColor("#0A4E51"),
                                              width: 1),
                                        ),
                                      ),
                                      onTap: () async {
                                        var date = await showDatePicker(
                                            selectableDayPredicate: (day) {
                                              if ((day.month ==
                                                      DateTime.now().month) &&
                                                  (day.day <
                                                      DateTime.now().day)) {
                                                return false;
                                              } else {
                                                return true;
                                              }
                                            },
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2100));
                                        enddateController.text =
                                            date.toString().substring(0, 10);
                                      },
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      controller: fromplaceController,
                                      decoration: InputDecoration(
                                        labelText: 'FromPlace',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: HexColor("#0A4E51"),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: HexColor("#0A4E51"),
                                              width: 1),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      controller: toplaceController,
                                      decoration: InputDecoration(
                                        labelText: 'ToPlace',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: HexColor("#0A4E51"),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: HexColor("#0A4E51"),
                                              width: 1),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      onTap: () async {
                                        TimeOfDay picked = await showTimePicker(
                                          context: context,
                                          initialTime: initialTime,
                                          // builder: (BuildContext context, Widget child) {
                                          //   return MediaQuery(
                                          //     data: MediaQuery.of(context)
                                          //         .copyWith(alwaysUse24HourFormat: true),
                                          //     child: child,
                                          //   );
                                          // },
                                        );
                                        departureTimeController.text =
                                            picked.format(context);
                                      },
                                      controller: departureTimeController,
                                      decoration: InputDecoration(
                                        labelText: 'Departure Timing',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: HexColor("#0A4E51"),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: HexColor("#0A4E51"),
                                              width: 1),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      controller: travelByController,
                                      decoration: InputDecoration(
                                        labelText: 'Travel By',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: HexColor("#0A4E51"),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: HexColor("#0A4E51"),
                                              width: 1),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      controller: contactNoController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        labelText: 'Contact No',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: HexColor("#0A4E51"),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: HexColor("#0A4E51"),
                                              width: 1),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      controller: descriptionController,
                                      decoration: InputDecoration(
                                        labelText: 'Description',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: HexColor("#0A4E51"),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: HexColor("#0A4E51"),
                                              width: 1),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        RaisedButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(6)),
                                                side: BorderSide(
                                                    color: HexColor('#0A4E51'),
                                                    width: 2)),
                                            color: HexColor('#0A4E51'),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TakeTourPlan()));
                                            },
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        RaisedButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(6)),
                                                side: BorderSide(
                                                    color: HexColor('#0A4E51'),
                                                    width: 2)),
                                            color: HexColor('#0A4E51'),
                                            onPressed: () {
                                              updateData();
                                            },
                                            child: Text(
                                              "Update",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(Icons.edit),
                )),
          ],
          title: Text(
            "Tour Plan",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                ),
                // Container(
                //     height: height * 0.1,
                //     color: Colors.red[300],
                //     child: Image.asset(
                //       "assets/Try/shivangi.jpg",
                //     )),
                SizedBox(height: 10),
                customTextProfile(text = "Organized  By :",
                    text1 = organisedBy ??= "", width),
                SizedBox(height: 40),
                customTextProfile(text = "Trip Start Date :",
                    text1 = startdate ??= "", width),
                SizedBox(height: 40),
                customTextProfile(
                    text = "Trip End Date :", text1 = enddate ??= "", width),
                SizedBox(height: 40),
                customTextProfile(
                    text = "From  Place :", text1 = fromplace ??= "", width),
                SizedBox(height: 40),
                customTextProfile(
                    text = "To Place :", text1 = toplace ??= "", width),
                SizedBox(height: 40),
                customTextProfile(text = "Departure Timing :",
                    text1 = depatureTime ??= "", width),
                SizedBox(height: 40),
                customTextProfile(
                    text = "Travel By :", text1 = travelBy ??= "", width),
                SizedBox(height: 40),
                customTextProfile(
                    text = "Contact No :", text1 = contactNo ??= "", width),
                SizedBox(height: 30),
                // customTextProfile(text = "Request Accepted", text1 = "", width),
                // SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    description ??= "",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: 20),
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
                          Share.share(
                              "https://faq.whatsapp.com/android/chats/how-to-create-and-invite-into-a-group/?lang=en",
                              subject: "Nivetha Invites You");
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
