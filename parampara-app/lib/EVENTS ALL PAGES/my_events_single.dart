import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';

class MyEventsSingle extends StatefulWidget {
  @override
  _MyEventsSingleState createState() => _MyEventsSingleState();
}

class _MyEventsSingleState extends State<MyEventsSingle> {
  var dateToday = DateTime.now();
  var timeToday = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    var timeFormat = DateFormat('HH:mm').format(dateToday);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var statusBar = MediaQuery.of(context).padding.top;
    var appBar = AppBar().preferredSize.height;
    var amOrPm = int.parse(timeFormat[0]) < 2 && int.parse(timeFormat[1]) < 3
        ? 'Am'
        : 'Pm';
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
        title: Text(
          "Received Events",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 20,
          right: 10,
        ),
        height: (height - (appBar + statusBar)),
        width: width,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: (height - (appBar + statusBar)) * 0.10,
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/EVENTS ALL PAGE/imageGirl.png'),
                                // backgroundColor: Colors.teal.shade700,
                                radius: 40,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sunena',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Sunena@gmail.com',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.teal.shade900,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.mode_edit,
                                      size: 30,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: (height - (appBar + statusBar)) * 0.02,
                    ),
                    Container(
                      height: (height - (appBar + statusBar)) * 0.03,
                      width: width,
                      child: Text(
                        'Birthday Function',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: (height - (appBar + statusBar)) * 0.10,
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              DateFormat('dd-MMMM-yyyy').format(
                                dateToday,
                              ),
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Expanded(
                              child: Text(
                            '$timeFormat $amOrPm',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )),
                        ],
                      ),
                    ),
                    Container(
                      height: (height - (appBar + statusBar)) * 0.05,
                      width: width,
                      child: Text(
                        "Madurai",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      height: (height - (appBar + statusBar)) * 0.05,
                      width: width,
                      child: Text(
                        "8752365856",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      height: (height - (appBar + statusBar)) * 0.10,
                      width: width,
                      child: Text(
                        'Hi dear, Please come and join with your family.Enjoy night dinner also',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      height: (height - (appBar + statusBar)) * 0.20,
                      width: width,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              height: (height - (appBar + statusBar)) * 0.20,
                              width: (width - 30) * 0.50,
                              child: Image.asset(
                                  'assets/EVENTS ALL PAGE/imageCake.png'),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: (height - (appBar + statusBar)) * 0.20,
                              width: (width - 30) * 0.50,
                              child: Image.asset(
                                'assets/EVENTS ALL PAGE/imageChild.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: (height - (appBar + statusBar)) * 0.02,
                    ),
                    Container(
                      height: (height - (appBar + statusBar)) * 0.20,
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: (height - (appBar + statusBar)) * 0.20,
                            width: (width - 30) * 0.50,
                            child: Image.asset(
                                'assets/EVENTS ALL PAGE/imageCake.png'),
                          ),
                          Container(
                            height: (height - (appBar + statusBar)) * 0.20,
                            width: (width - 30) * 0.50,
                            child: Image.asset(
                              'assets/EVENTS ALL PAGE/imageChild.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: (height - (appBar + statusBar)) * 0.08,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Share.share(
                          "https://faq.whatsapp.com/android/chats/how-to-create-and-invite-into-a-group/?lang=en",
                          subject: "Nivetha Invites You ");
                    },
                    child: Container(
                      height: (height - (appBar + statusBar)) * 0.06,
                      width: (width - 30) * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color: Colors.teal.shade700,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.share,
                            size: 20,
                            color: Colors.teal.shade700,
                          ),
                          Text(
                            'Share',
                            style: TextStyle(
                                fontSize: 15, color: Colors.teal.shade700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: (height - (appBar + statusBar)) * 0.06,
                    width: (width - 30) * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                        color: Colors.teal.shade700,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.delete,
                          size: 20,
                          color: Colors.teal.shade700,
                        ),
                        Text(
                          'Delete',
                          style: TextStyle(
                              fontSize: 15, color: Colors.teal.shade700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
