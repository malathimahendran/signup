import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Find_a_donor_page.dart';
import 'bloodtapbarpage.dart';
import 'request_for_blood_page.dart';
import 'willingtodonate.dart';

class FindDonorPage extends StatefulWidget {
  @override
  _FindDonorPage createState() => _FindDonorPage();
}

class _FindDonorPage extends State<FindDonorPage> {
  bool isClickOO = false;
  bool isClickABA = false;
  bool isClickABB = false,
      isClickAA = false,
      isClickA = false,
      isClickB = false,
      isClickBB = false,
      isClickO = false;
  String bloodGroup = "";
  var location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double barApp = AppBar().preferredSize.height;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          height: height,
          width: width,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    //color: Colors.red,
                    width: width - 20,
                    height: (height) * 0.12,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Container(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 13),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Find a Donor",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 19),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Container(),
                  // Container(),
                ],
              ),
              Container(
                //color: Colors.blue,
                height: height * 0.25,
                width: width,
                child: Image(
                  image: AssetImage("assets/Bloodmoduleimages/bloodpacket.png"),
                ),
              ),
              Container(
                //color: Colors.black,
                height: height * 0.03,
                width: width * 0.80,
                child: Text(
                  "Search for blood donors around you",
                  style: TextStyle(color: Color(0xff0A5255), fontSize: 19),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                //color: Colors.grey,
                height: height * 0.03,
                width: width * 0.80,
                child: Text(
                  "Choose Blood Group",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.all(1),
                height: height * 0.09,
                width: width * 0.87,
                child: Card(
                  elevation: 5,
                  child: Container(
                    color: Color(0xffCFCECE),
                    height: height * 0.08,
                    width: width * 0.60,
                    child: Wrap(
                      spacing: 1.9,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isClickA = true;
                              isClickAA = false;
                              isClickB = false;
                              isClickBB = false;
                              isClickO = false;
                              isClickOO = false;
                              isClickABA = false;
                              isClickABB = false;
                              // isClickA ==false ?bloodGroup
                              isClickA == true
                                  ? bloodGroup = "A+"
                                  : bloodGroup = "";
                            });
                            print(bloodGroup);
                          },
                          child: bloodGroupContainer(height, width,
                              text: "A+", val: isClickA),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isClickA = false;
                              isClickAA = true;
                              isClickB = false;
                              isClickBB = false;
                              isClickO = false;
                              isClickOO = false;
                              isClickABA = false;
                              isClickABB = false;
                              isClickAA == true
                                  ? bloodGroup = "A-"
                                  : bloodGroup = "";
                              print(bloodGroup);
                            });
                          },
                          child: bloodGroupContainer(height, width,
                              text: "A-", val: isClickAA),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                isClickA = false;
                                isClickAA = false;
                                isClickB = true;
                                isClickBB = false;
                                isClickO = false;
                                isClickOO = false;
                                isClickABA = false;
                                isClickABB = false;
                                isClickB == true
                                    ? bloodGroup = "B+"
                                    : bloodGroup = "";
                                print(bloodGroup);
                              });
                            },
                            child: bloodGroupContainer(height, width,
                                text: "B+", val: isClickB)),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isClickA = false;
                              isClickAA = false;
                              isClickB = false;
                              isClickBB = true;
                              isClickO = false;
                              isClickOO = false;
                              isClickABA = false;
                              isClickABB = false;
                              isClickBB == true
                                  ? bloodGroup = "B-"
                                  : bloodGroup = "";
                              print(bloodGroup);
                            });
                          },
                          child: bloodGroupContainer(height, width,
                              text: "B-", val: isClickBB),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isClickA = false;
                              isClickAA = false;
                              isClickB = false;
                              isClickBB = false;
                              isClickO = true;
                              isClickOO = false;
                              isClickABA = false;
                              isClickABB = false;
                              isClickO == true
                                  ? bloodGroup = "O+"
                                  : bloodGroup = "";
                              print(bloodGroup);
                            });
                          },
                          child: bloodGroupContainer(height, width,
                              text: "O+", val: isClickO),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                height: 1,
                thickness: 0.01,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(1),
                      height: height * 0.09,
                      width: width * 0.87,
                      child: Card(
                        elevation: 5,
                        child: Container(
                          color: Color(0xffCFCECE),
                          height: height * 0.09,
                          width: width * 0.60,
                          child: Wrap(
                            spacing: 1.9,
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      isClickA = false;
                                      isClickAA = false;
                                      isClickB = false;
                                      isClickBB = false;
                                      isClickO = false;
                                      isClickOO = true;
                                      isClickABA = false;
                                      isClickABB = false;
                                      isClickOO == true
                                          ? bloodGroup = "O-"
                                          : bloodGroup = "";
                                      print(bloodGroup);
                                    });
                                  },
                                  child: bloodGroupContainer(height, width,
                                      text: "O-", val: isClickOO)),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      isClickA = false;
                                      isClickAA = false;
                                      isClickB = false;
                                      isClickBB = false;
                                      isClickO = false;
                                      isClickOO = false;
                                      isClickABA = true;
                                      isClickABB = false;
                                      isClickABA == true
                                          ? bloodGroup = "AB+"
                                          : bloodGroup = "";
                                      print(bloodGroup);
                                    });
                                  },
                                  child: bloodGroupContainer(height, width,
                                      text: "AB+", val: isClickABA)),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      isClickA = false;
                                      isClickAA = false;
                                      isClickB = false;
                                      isClickBB = false;
                                      isClickO = false;
                                      isClickOO = false;
                                      isClickABA = false;
                                      isClickABB = true;
                                      isClickABB == true
                                          ? bloodGroup = "AB-"
                                          : bloodGroup = "";
                                      print(bloodGroup);
                                    });
                                  },
                                  child: bloodGroupContainer(height, width,
                                      text: "AB-", val: isClickABB)),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: width * 0.80,
                //color: Colors.grey,
                height: height * 0.06,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Location",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: width * 0.85,
                child: Card(
                  child: TextField(
                    controller: location,
                    decoration: InputDecoration(
                      hintText: '  Enter Your Location',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                child: Container(
                  height: height * 0.07,
                  width: (width - 0.20) * 0.65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color(0xff0A5255),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPage()));
                      print(location);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "SEARCH DONOR",
                        style: TextStyle(color: Color(0xffFFFFFF)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      //color: Colors.greenAccent,
                      width: (width - 0.20) * 0.20,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RequestForBlood(),
                                ));
                          },
                          child: Image(
                            image: AssetImage(
                                "assets/Bloodmoduleimages/addicon.png"),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      width: (width - 0.20) * 0.22,
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WillingDonate()));
                          },
                          child: Image(
                            image: AssetImage(
                                "assets/Bloodmoduleimages/image_2021_08_11T11_46_41_203Z.png"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 0.10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BloodTabBar()));
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        width: (width - 0.20) * 0.24,
                        child: Image(
                          image: AssetImage(
                              "assets/Bloodmoduleimages/greencalender.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container bloodGroupContainer(double height, double width, {text, val}) {
    return Container(
      alignment: Alignment.center,
      height: (height * 0.08) * 0.93,
      width: ((width * 0.80)) / 4.9,
      color: val == false ? Colors.white : Color(0xff0A5255),
      child: Text(
        text,
        style: TextStyle(
          color: val == false ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
