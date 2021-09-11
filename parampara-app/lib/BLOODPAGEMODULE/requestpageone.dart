import 'package:flutter/material.dart';

import 'Recived_Requests.dart';
import 'bloodtapbarpage.dart';
import 'request_for_blood_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
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
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffFFFFFF),
          child: Column(
            children: [
              Container(
                color: Color(0xffFFFFFF),
                height: height * 0.12,
                width: width,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 25,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 13),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Find a Donor",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: height * 0.04,
                width: width * 0.85,
                color: Color(0xffFFFFFF),
                child: Text(
                  " Search for blood donors around you",
                  style: TextStyle(fontSize: 18, color: Color(0xff0A5255)),
                ),
              ),
              Card(
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
                              Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: mc2 * 0.60,
                                    width: width * 0.17,
                                    //color: Colors.orange,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/Bloodmoduleimages/blooddropledingicon.png'),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: mc2 * 0.60,
                                    width: width * 0.17,
                                    child: Text(
                                      "A+",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
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
                                        "Yogeshwaran",
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
                                                    child: Text("Location")),
                                                Text("Madurai"),
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
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RequestForBlood(),
                                        ),
                                      );
                                    },
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
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 30),
                                  color: Colors.grey,
                                  height: mc2 * (0.4 - 0.15),
                                  width: width * 0.40,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 29,
                                        width: width * 0.1,
                                        child: Image(
                                          image: AssetImage(
                                              'assets/Bloodmoduleimages/removecircle.png'),
                                        ),
                                      ),
                                      Text("Cancel Request",
                                          style: TextStyle(
                                              color: Color(0xff070606))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Card(
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
                              Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: mc2 * 0.60,
                                    width: width * 0.17,
                                    //color: Colors.orange,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/Bloodmoduleimages/blooddropledingicon.png'),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: mc2 * 0.60,
                                    width: width * 0.17,
                                    child: Text(
                                      "A+",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
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
                                        "Yogeshwaran",
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
                                                    child: Text("Location")),
                                                Text("Madurai"),
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
                                        style:
                                            TextStyle(color: Color(0xffFFFFFF)),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 30),
                                  color: Colors.grey,
                                  height: mc2 * (0.4 - 0.15),
                                  width: width * 0.40,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 29,
                                        width: width * 0.1,
                                        child: Image(
                                          image: AssetImage(
                                              'assets/Bloodmoduleimages/removecircle.png'),
                                        ),
                                      ),
                                      Text("Cancel Request",
                                          style: TextStyle(
                                              color: Color(0xff070606))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Card(
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
                              Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: mc2 * 0.60,
                                    width: width * 0.17,
                                    //color: Colors.orange,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/Bloodmoduleimages/blooddropledingicon.png'),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: mc2 * 0.60,
                                    width: width * 0.17,
                                    child: Text(
                                      "A+",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
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
                                        "Yogeshwaran",
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
                                                    child: Text("Location")),
                                                Text("Madurai"),
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
                                        style:
                                            TextStyle(color: Color(0xffFFFFFF)),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 30),
                                  color: Colors.grey,
                                  height: mc2 * (0.4 - 0.15),
                                  width: width * 0.40,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 29,
                                        width: width * 0.1,
                                        child: Image(
                                          image: AssetImage(
                                              'assets/Bloodmoduleimages/removecircle.png'),
                                        ),
                                      ),
                                      Text("Cancel Request",
                                          style: TextStyle(
                                              color: Color(0xff070606))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Card(
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
                              Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: mc2 * 0.60,
                                    width: width * 0.17,
                                    //color: Colors.orange,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/Bloodmoduleimages/blooddropledingicon.png'),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: mc2 * 0.60,
                                    width: width * 0.17,
                                    child: Text(
                                      "A+",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
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
                                        "Yogeshwaran",
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
                                                    child: Text("Location")),
                                                Text("Madurai"),
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
                                        style:
                                            TextStyle(color: Color(0xffFFFFFF)),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 30),
                                  color: Colors.grey,
                                  height: mc2 * (0.4 - 0.15),
                                  width: width * 0.40,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 29,
                                        width: width * 0.1,
                                        child: Image(
                                          image: AssetImage(
                                              'assets/Bloodmoduleimages/removecircle.png'),
                                        ),
                                      ),
                                      Text("Cancel Request",
                                          style: TextStyle(
                                              color: Color(0xff070606))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BloodTabBar()));
                },
                child: Container(
                  //color: Colors.red,
                  height: height * 0.08,
                  width: width * 0.2,
                  child: Image(
                    image: AssetImage("assets/Bloodmoduleimages/addicon.png"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
