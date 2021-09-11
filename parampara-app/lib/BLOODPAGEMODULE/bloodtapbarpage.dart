import 'package:flutter/material.dart';
import 'package:googleandfacebook/BLOODPAGEMODULE/request_for_blood_page.dart';

import 'BloodHomePage.dart';
import 'MyRequest.dart';
import 'Recived_Requests.dart';
//import 'package:listview/BLOOD%20PAGE/received_requests.dart';

class BloodTabBar extends StatefulWidget {
  @override
  _BloodTabBarState createState() => _BloodTabBarState();
}

class _BloodTabBarState extends State<BloodTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffFFFFFF),
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Container(
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BloodFristpage()),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    child: Text(
                      "Blood Request",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
          flexibleSpace: Container(
            margin: EdgeInsets.only(top: 25),
            alignment: Alignment.center,
            child: Text(
              "See received blood requests and also\ncheck your requests status",
              style: TextStyle(color: Color(0xff0A4D46)),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: TabBar(
              unselectedLabelColor: Colors.white,
              tabs: [
                Container(
                  child: Text(
                    "Received Request",
                    style: TextStyle(color: Color(0xff0A5255)),
                  ),
                ),
                Container(
                  child: Text(
                    "My Request",
                    style: TextStyle(color: Color(0xff0A5255)),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(children: <Widget>[
          ReceivedRequests(),
          BloodListView(),
        ]),
        bottomSheet: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RequestForBlood()),
            );
          },
          child: Container(
            alignment: Alignment.center,
            height: 80,
            child: Image.asset("assets/Bloodmoduleimages/addicon.png"),
          ),
        ),
      ),
    );
  }
}
