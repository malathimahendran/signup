import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'health_care_description.dart';

class HealthTips extends StatefulWidget {
  @override
  _HealthTipsState createState() => _HealthTipsState();
}

class _HealthTipsState extends State<HealthTips> {
  List headings = [
    'To Stop Hairfall',
    'For weight Gain',
    'For Weight loss',
    'For Hair Growth',
    'Ashtma Disease',
    'Mugaparu Pokka',
    'Pal Vali Kuraiya'
  ];
  List images = [
    'assets/HealthTips/Image 30.png',
    'assets/HealthTips/Image 31.png',
    'assets/HealthTips/Image 32.png',
    'assets/HealthTips/Image 33.png',
    'assets/HealthTips/OIP.jpg',
    'assets/HealthTips/Image 34.png',
    'assets/HealthTips/Image 34.png',
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var bottom = kBottomNavigationBarHeight;
    print(bottom);
    var status = MediaQuery.of(context).padding.top;
    print(status);
    print(height);
    print(width);
    var appbarr = AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: <Color>[HexColor('#0A4E51'), HexColor('#149BA1')])),
      ),
      title: Text(
        'HealthCare',
        style: TextStyle(color: Colors.white),
      ),
    );
    var appbar = appbarr.preferredSize.height;
    print(appbar);
    return Scaffold(
      appBar: appbarr,
      body: Container(
        height: (height - (appbar + status)),
        width: width,
        child: ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return Container(
                height: (height - (appbar + status)) * 0.15,
                width: width - 40,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Contentscreen()));
                  },
                  child: Card(
                    child: Container(
                      height: (height - (appbar + status)) * 0.17,
                      width: width,
                      color: HexColor('#C5D9D9').withOpacity(0.6),
                      child: Row(
                        children: [
                          Container(
                            height: (height - (appbar + status)) * 0.3,
                            width: width * 0.3,
                            child: Image.asset(
                              images[index],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Text(
                              headings[index],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
    // return Scaffold(
    //   body: Container(
    //     width: width,
    //     height: height,
    //     child: Column(
    //       children: [
    //         Container(
    //           width: width,
    //           height: height,
    //           child: Stack(children: [
    //             Container(
    //               width: width,
    //               height: height * 0.69,
    //               decoration: BoxDecoration(
    //                 image: new DecorationImage(
    //                     image: AssetImage('assets/HEALTHTIPS/fruits.png'),
    //                     fit: BoxFit.cover),
    //                 // color: Colors.amber
    //               ),
    //             ),
    //             Positioned(
    //                 bottom: 0,
    //                 child: Container(
    //                   width: width,
    //                   height: height * 0.35,
    //                   decoration: BoxDecoration(
    //                     color: Colors.white,
    //                     borderRadius: BorderRadius.only(
    //                       topLeft: Radius.circular(30),
    //                       topRight: Radius.circular(30),
    //                     ),
    //                   ),
    //                 ))
    //           ]),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
