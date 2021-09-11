import 'package:flutter/material.dart';
import 'api_find_a_donor_listview.dart';
import 'request_for_blood_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var data4;
  var bloodgrp;
  //var data2;
  Donors pro = Donors();
  @override
  void initState() {
    prov();
    super.initState();
  }

  prov() async {
    await pro.donorList().then((value) {
      setState(() {
        data4 = value;
        print(data4);
        print("23");
        bloodgrp = data4[0]['blood_group'];
        print(data4[0]['blood_group']);
      });
    });
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: (height - barApp) * 0.15,
        title: Column(
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Find a Donor",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "Search for blood donors around you",
              style: TextStyle(color: Color(0xff0A5255)),
            )
          ],
        ),
      ),
      body: data4 == null
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : ListView.builder(
              itemCount: data4.length,
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
                                          child: Image(
                                            image: AssetImage(
                                                'assets/Bloodmoduleimages/blooddropledingicon.png'),
                                          ),
                                        ),
                                        Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                                data4[index]["blood_group"])),
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
                                          data4[index]["name"],
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
                                                      padding: EdgeInsets.only(
                                                          top: 10),
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Text("Date")),
                                                  Container(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Text("01-07-2021"))
                                                ],
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              height: mc2 * 0.4,
                                              width: width * (0.20 + 0.05),
                                              //color: Colors.redAccent,
                                              child: Column(
                                                children: [
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          top: 10),
                                                      child: Text("Time")),
                                                  Container(
                                                      child: Text("03:00 pm"))
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: mc2 * 0.4,
                                              width: width * (0.20 + 0.05),
                                              //color: Colors.yellow,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: 10),
                                                    child: Text("Location"),
                                                  ),
                                                  Container(
                                                    child: Text(data4[index]
                                                        ["location"]),
                                                  ),
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
      bottomSheet: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RequestForBlood()),
          );

          print("sdfgdfgs");
        },
        child: Container(
          alignment: Alignment.center,
          height: 80,
          child: Image.asset("assets/Bloodmoduleimages/addicon.png"),
        ),
      ),
    );
  }
}
