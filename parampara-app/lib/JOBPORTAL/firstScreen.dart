import 'package:flutter/material.dart';
import 'package:googleandfacebook/DRAWER%20PAGE/drawer_page.dart';
import 'package:googleandfacebook/JOBPORTAL/Jobsearch.dart';
import 'package:hexcolor/hexcolor.dart';

import 'jobRecruitmentlist.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    print(height);
    var width = MediaQuery.of(context).size.width;
    print(width);
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
          "Job Portal",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/JOBPORTAL/Joblaptop.jpg'),
              SizedBox(
                height: 10,
              ),
              Text(
                'Find your jobs quick and easy',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15.0),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Jobsearch()));
                  },
                  child: Text('Job Search'),
                  style:
                      ElevatedButton.styleFrom(primary: HexColor('#0A4E51'))),
              SizedBox(
                height: 10,
              ),
              Image.asset('assets/JOBPORTAL/Jobsearch.jpg'),
              SizedBox(
                height: 10,
              ),
              Text(
                'Find your best employee for \n             your company',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15.0),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JobRecruitmentList()));
                  },
                  child: Text('Job Recurite'),
                  style:
                      ElevatedButton.styleFrom(primary: HexColor('#0A4E51'))),
            ],
          ),
        ),
      ),
    );
  }
}
