import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Blood_my_request_api.dart';

class BloodListView extends StatefulWidget {
  @override
  _BloodListViewState createState() => _BloodListViewState();
}

class _BloodListViewState extends State<BloodListView> {
  var blooddata;
  var convertdate;

  @override
  void initState() {
    // TODO: implement initState
    BloodMyRequestApi().bloodRequestApi().then((value) {
      setState(() {
        blooddata = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double barApp = AppBar().preferredSize.height;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    var mc1 = height - barApp;
    var mc2 = mc1 * 0.20;

    return Scaffold(
      body: blooddata == null
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
              ),
            )
          : Container(
              height: height * 0.75,
              width: width,
              child: ListView.builder(
                  itemCount: blooddata.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      child: Container(
                        height: height * 0.20,
                        width: width,
                        // color: Colors.blue,
                        child: Column(
                          children: [
                            Container(
                                height: mc2 * 0.6,
                                //color: Colors.teal
                                child: Row(
                                  children: [
                                    Container(
                                        height: mc2 * 0.60,
                                        width: width * 0.17,
                                        //color: Colors.orange,
                                        child: Stack(
                                          children: [
                                            Container(
                                                alignment: Alignment.center,
                                                child: Image.asset(
                                                    'assets/Bloodmoduleimages/blooddropledingicon.png')),
                                            Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                blooddata[index]["blood_group"],
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        )),
                                    Container(
                                      height: mc2 * 0.60,
                                      width: width * 0.80,
                                      //color: Colors.purpleAccent,
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(top: 6.6),
                                            //color: Colors.grey,
                                            height: mc2 * 0.20,
                                            width: width * 0.80,
                                            child: Text(
                                              blooddata[index]["name"],
                                              style: TextStyle(
                                                fontSize: 21,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: mc2 * 0.4,
                                                  width: width * (0.20 + 0.06),
                                                  //color: Colors.white,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                          alignment: Alignment
                                                              .bottomLeft,
                                                          child: Text("Date")),
                                                      Container(
                                                          alignment: Alignment
                                                              .bottomLeft,
                                                          child: Text(
                                                              blooddata[index]
                                                                      ["date"]
                                                                  .substring(
                                                                      0, 10)))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  height: mc2 * 0.4,
                                                  width: width * (0.20 + 0.05),
                                                  //color: Colors.redAccent,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                          child: Text("Time")),
                                                      Container(
                                                          child: Text(
                                                              blooddata[index]
                                                                  ["time"]))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: mc2 * 0.4,
                                                  width: width * (0.20 + 0.05),
                                                  //color: Colors.yellow,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                          child:
                                                              Text("Location")),
                                                      Text(blooddata[index]
                                                          ["location"]),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            Container(
                                height: mc2 * 0.4,
                                //color: Colors.black,
                                child: Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(left: 30),
                                        color: Color(0xff0A4D46),
                                        height: mc2 * (0.4 - 0.15),
                                        width: width * 0.40,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 29,
                                              width: width * 0.1,
                                              child: Image.asset(
                                                  'assets/Bloodmoduleimages/tickcircle.png'),
                                            ),
                                            Text(
                                              "Accept Request",
                                              style: TextStyle(
                                                  color: Color(0xffFFFFFF)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(left: 30),
                                        color: Color(0xffC70E1E),
                                        height: mc2 * (0.4 - 0.15),
                                        width: width * 0.40,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 29,
                                              width: width * 0.1,
                                              child: Image(
                                                image: AssetImage(
                                                  'assets/Bloodmoduleimages/phoneicon.png',
                                                ),
                                              ),
                                            ),
                                            Text("Contact",
                                                style: TextStyle(
                                                    color: Color(0xffFFFFFF))),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}
