import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class Uploadresume extends StatefulWidget {
  @override
  _UploadresumeState createState() => _UploadresumeState();
}

class _UploadresumeState extends State<Uploadresume> {
  var file;
  File files;
  void uploadResume() {
    final fileName = FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc']);

    fileName.then((value) {
      print(value.names);
      print(value.files.length);

      print(value.paths);
      setState(() {
        file = value.paths[0];
        print(file);
        files = File(file);
      });
    });
    print(14);
  }

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
      appBar: appbarr,
      body: Container(
        width: width,
        // height: (height - (appbar + status)) - 60,
        margin: EdgeInsets.only(top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/JOBPORTAL/profile.jpg',
                      width: 150,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Nivetha',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'RobotoMono',
                          color: HexColor('#0A4E51')),
                    )
                  ],
                )),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Upload Your CV',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'RobotoMono',
                            color: HexColor('#0A4E51')),
                      ),
                      Container(
                        width: width * 0.5,
                        height: height * 0.06,
                        child: ElevatedButton(
                          onPressed: () {
                            uploadResume();
                          },
                          child: Text(
                            'Choose File',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'RobotoMono',
                                color: HexColor('#0A4E51')),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: HexColor('#0A4E51'),
                            side: BorderSide(
                                width: 1, color: HexColor('#0A4E51')),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: width * 0.5,
                  height: height * 0.2,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                          width: width * 0.5,
                          height: height * 0.1,
                          child: file),
                      InkWell(
                          onTap: () {
                            setState(() {
                              files = null;
                            });
                          },
                          child: files != null ? Icon(Icons.cancel) : null)
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 90,
            ),
            Column(
              children: [
                Container(
                  width: width,
                  height: height * 0.07,
                  color: HexColor('#0A4E51'),
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('Submit',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    color: HexColor('#0A4E51'),
                    textColor: Colors.white,
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
