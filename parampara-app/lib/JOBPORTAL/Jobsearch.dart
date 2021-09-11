import 'package:flutter/material.dart';
import 'package:googleandfacebook/JOBPORTAL/uploadresume.dart';
import 'package:hexcolor/hexcolor.dart';

class Jobsearch extends StatefulWidget {
  @override
  _JobsearchState createState() => _JobsearchState();
}

class _JobsearchState extends State<Jobsearch> {
  List headings = [
    'FullTime',
    'FullTime',
    'FullTime',
    'FullTime',
    'FullTime',
    'FullTime',
    'FullTime',
    'FullTime',
  ];
  List jobRole = [
    'Graphic Designer',
    'Graphic Designer',
    'Graphic Designer',
    'Graphic Designer',
    'Graphic Designer',
    'Graphic Designer',
    'Graphic Designer',
    'Graphic Designer',
  ];
  List companyName = [
    'RapidCard Inc.. Madurai',
    'RapidCard Inc.. Madurai',
    'RapidCard Inc.. Madurai',
    'RapidCard Inc.. Madurai',
    'RapidCard Inc.. Madurai',
    'RapidCard Inc.. Madurai',
    'RapidCard Inc.. Madurai',
    'RapidCard Inc.. Madurai',
    'RapidCard Inc.. Madurai',
  ];
  List salary = [
    'Rs.30000/Monthly',
    'Rs.30000/Monthly',
    'Rs.30000/Monthly',
    'Rs.30000/Monthly',
    'Rs.30000/Monthly',
    'Rs.30000/Monthly',
    'Rs.30000/Monthly',
    'Rs.30000/Monthly'
  ];

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
        "Job Search",
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

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appbarr,
        body: Container(
            color: Colors.grey[300],
            // margin: EdgeInsets.only(top: 10),
            height: (height - (appbar + status)),
            width: width,
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.zero,
                    width: width,
                    height: ((height - (appbar + status))) * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: (height - (appbar + status)) * 0.07,
                          width: width * 0.45,
                          child: TextFormField(
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white),
                              ),
                              hintText: "SearchJobHere",
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Container(
                          height: (height - (appbar + status)) * 0.08,
                          width: width * 0.45,
                          child: TextFormField(
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    width: 2, color: Colors.grey[300]),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    width: 2, color: Colors.grey[300]),
                              ),
                              hintText: "Location",
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    )),
                Container(
                  padding: EdgeInsets.zero,
                  width: width,
                  height: ((height - (appbar + status))) * 0.90,
                  // color: Colors.green,
                  child: ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Container(
                          height: (height - appbar) * 0.2,
                          width: width,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            // color: Colors.red,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            headings[index],
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'RobotoMono',
                                                color: HexColor('#0A4E51')),
                                          ),
                                          SizedBox(height: 15),
                                          Text(jobRole[index]),
                                          SizedBox(height: 15),
                                          Text(companyName[index]),
                                          SizedBox(height: 15),
                                          Text(salary[index]),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Uploadresume()));
                                            },
                                            child: Text(
                                              'Apply',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              primary: HexColor('#0A4E51'),
                                              onPrimary: HexColor('#0A4E51'),
                                              side: BorderSide(
                                                  width: 1,
                                                  color: HexColor('#0A4E51')),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Text('12-11-2000'),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                                // Padding(
                                //   padding: const EdgeInsets.only(right: 250),
                                //   child: Text(
                                //     headings[index],
                                //     style: TextStyle(
                                //         fontSize: 15,
                                //         fontFamily: 'RobotoMono',
                                //         color: HexColor('#0A4E51')),
                                //   ),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.only(right: 210),
                                //   child: Text(jobRole[index]),
                                // ),
                                // Text(companyName[index]),
                                // Text(salary[index]),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            )

            //     child: Container(
            //   child: ListView.builder(
            //       itemCount: 4,
            //       itemBuilder: (context, index) {
            //         return GestureDetector(
            //           onTap: () {},
            //           child: Card(
            //             child: Column(
            //               children: <Widget>[
            //                 Container(
            //                     child: Container(
            //                   child: ListView.builder(
            //                       itemCount: 4,
            //                       itemBuilder: (context, index) {
            //                         return GestureDetector(
            //                           onTap: () {},
            //                           child: Card(
            //                             child: Column(
            //                               children: <Widget>[Card()],
            //                             ),
            //                           ),
            //                         );
            //                       }),
            //                 )),
            //               ],
            //             ),
            //           ),
            //         );
            //       }),
            // )),
            ));
  }
}
