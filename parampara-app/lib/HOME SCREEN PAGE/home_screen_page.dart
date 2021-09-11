import 'package:flutter/material.dart';
import 'package:googleandfacebook/BLOODPAGEMODULE/BloodHomePage.dart';

import 'package:googleandfacebook/CALENDER%20AND%20REMINDERS/CalendarFirstPage.dart';
import 'package:googleandfacebook/CHAT%20ALL%20PAGES/home.dart';

import 'package:googleandfacebook/COOKINGTIPS/cookingpage.dart';
import 'package:googleandfacebook/DRAWER%20PAGE/drawer_page.dart';
import 'package:googleandfacebook/EVENTS%20ALL%20PAGES/event_main_event.dart';
import 'package:googleandfacebook/FamilyTourPlan/FamilyTourPlan1.dart';
import 'package:googleandfacebook/HealthTips/HealthTipsFirstScreen.dart';
import 'package:googleandfacebook/Image%20Gallery/ImageGallery1.dart';
import 'package:googleandfacebook/JOBPORTAL/firstScreen.dart';
import 'package:googleandfacebook/MATRIMONY ALL PAGES/Matrimony/Matrimonyfirstpage.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({this.googleLanding, this.faceBookLanding, this.emptyLanding});
  var faceBookLanding;
  var googleLanding;
  var emptyLanding;
  var extractedDetail;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var appbar = AppBar(
    elevation: 0,
    backgroundColor: Colors.teal,
    actions: <Widget>[
      IconButton(
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          onPressed: () {}),
    ],
  );
  bool _isSigningOut = false;
  var extractedDetail;
  List images = [
    'assets/HomeScreen_images/matrimony.png',
    'assets/HomeScreen_images/job.png',
    'assets/HomeScreen_images/car.png',
    'assets/HomeScreen_images/party.png',
    'assets/HomeScreen_images/image-gallery.png',
    'assets/HomeScreen_images/calender.png',
    'assets/HomeScreen_images/blood-donation.png',
    'assets/HomeScreen_images/call.png',
    'assets/HomeScreen_images/healthcare.png',
    'assets/HomeScreen_images/cooking.png'
  ];
  List headings = [
    'Matrimony',
    'Job Portal',
    'Family Tour Plan',
    'Events',
    'Image Gallery',
    'Calender',
    'Blood Donate',
    'Chat',
    'Health Tips',
    'Cooking Tips'
  ];
  List movingpages = [
    MatrimonyFirstPage(),
    FirstScreen(),
    FamilyTourPlan1(),
    MainEvent(),
    CamGallery1(),
    CalendarFirstPage(),
    BloodFristpage(),
    ChatHomeScreen(),
    HealthTipsFirstPage(),
    CookingTips()
  ];
  bool shouldPop = true;
  var username = TextEditingController();
  var email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;

    print("71 from homescreen");
    return WillPopScope(
      onWillPop: () async {
        print('line 109');

        return shouldPop;
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.transparent,
        drawer: DrawerPage(),
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: ExactAssetImage(
                  'assets/HomeScreen_images/backgroundimages/bottombackground.png'),
              fit: BoxFit.cover,
            ),
          ),
          height: sizeHeight,
          width: sizeWidth,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: ((sizeHeight) * 0.30),
                    width: sizeWidth,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: ExactAssetImage(
                            'assets/HomeScreen_images/backgroundimages/happy-family.webp'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Container(
                    height: ((sizeHeight) * 0.30),
                    width: sizeWidth,
                    color: HexColor('9904777d'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    scaffoldKey.currentState.openDrawer();
                                  },
                                  child: Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                    size: 35,
                                  )),
                              Icon(Icons.notifications,
                                  color: Colors.white, size: 35)
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          height: 45,
                          width: 280,
                          child: TextFormField(
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
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
                              hintText: "Search ",
                              hintStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: ((sizeHeight) * 0.70),
                child: GridView.builder(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 7),
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 11,
                        mainAxisSpacing: 6,
                        childAspectRatio: 1.0),
                    itemBuilder: (context, index) {
                      return Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => movingpages[index]));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5)),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Center(
                                      child: Image.asset(
                                        images[index],
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.cyan[900],
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5)),
                                      border: Border.all(color: Colors.white)),
                                  height: 60,
                                  child: Center(
                                    child: Text(
                                      headings[index],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // elevation: 5,
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
