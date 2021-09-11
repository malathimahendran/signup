import 'package:flutter/material.dart';

import 'Find_donor.dart';

class BloodFristpage extends StatefulWidget {
  @override
  _BloodFristpageState createState() => _BloodFristpageState();
}

class _BloodFristpageState extends State<BloodFristpage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              height: height * 0.08,
              width: width * 0.85,
              child: Text(
                "Find a Donor",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: height * 0.07,
              width: width * 0.85,
              child: Text(
                "Find Blood Donors &\nRequest for Donors",
                style: TextStyle(
                  color: Color(0xff0A5255),
                  fontSize: 17,
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: height * 0.85,
                  child: Container(
                    alignment: Alignment.topCenter,
                    height: height * 0.4,
                    child: Image.asset(
                      "assets/Bloodmoduleimages/image_2021_08_11T11_46_41_203Z.png",
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: height * 0.31,
                    width: width,
                    decoration: BoxDecoration(
                        color: Color(0xff0A5255),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(29),
                            topLeft: Radius.circular(29))),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: height * 0.19,
                          width: width * 0.85,
                          child: Text(
                            "Users will be able to find blood\n donors and request for blood\nfor specific date, time and place",
                            style: TextStyle(
                                fontSize: 18, color: Color(0xffFFFFFF)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FindDonorPage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            height: height * 0.07,
                            width: width * 0.6,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FindDonorPage(),
                                    ));
                              },
                              child: Text(
                                "NEXT",
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xff345759)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
