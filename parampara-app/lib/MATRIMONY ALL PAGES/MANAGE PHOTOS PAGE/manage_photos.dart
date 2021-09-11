import 'dart:io';
import 'package:googleandfacebook/MATRIMONY%20ALL%20PAGES/BEST%20MATCHES%20PAGE/constants.dart';
import 'package:googleandfacebook/MATRIMONY%20ALL%20PAGES/Matrimony/Matrimonyfirstpage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'package:googleandfacebook/MATRIMONY%20ALL%20PAGES/matrimony_search_your_partner.dart';
import 'package:googleandfacebook/models/matrimonyusermodel.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ManagePhotos extends StatefulWidget {
  ManagePhotos({this.passdata, this.passdata1});
  MatrimonyUserData passdata;
  MatrimonyUserData passdata1;
  // final passdata1;
  @override
  _ManagePhotosState createState() => _ManagePhotosState();
}

class _ManagePhotosState extends State<ManagePhotos> {
  @override
  void initState() {
    super.initState();
    // fun();
  }

  File _image;
  File _image1;
  String imagepost;
  bool imageName = false;
  var image;
  var ione;
  var imagefilenameimage;
  var imagefilenamephoto2;
  var splitoriginalnameforphoto2, splitoriginalnameforimage;
  var familyId;
  final picker = ImagePicker();
  var result;
  Future getgallaryImage(int number) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null && number == 0) {
        _image = File(pickedFile.path);

        splitoriginalnameforphoto2 = _image.path.split("/").last;
        print(splitoriginalnameforphoto2);
        imageName = true;
      } else if (pickedFile != null && number == 1) {
        _image1 = File(pickedFile.path);
        splitoriginalnameforimage = _image1.path.split("/").last;
        print(splitoriginalnameforimage);
        imageName = false;
      } else {
        print('No image selected.');
      }
    });

    print(_image);
    print(_image1);
    print(48);
    if (_image != null && imageName == true) {
      print("inside if");
      uploadImage(
          img: _image.path,
          originalnamepath: splitoriginalnameforphoto2,
          number: 0);
    } else {
      print("inside else");
      uploadImage(
          img: _image1.path,
          originalnamepath: splitoriginalnameforimage,
          number: 1);
    }

    print(59);
    // Navigator.of(context).pop();
  }

  Future uploadImage({img, originalnamepath, int number}) async {
    final String url = "https://www.cviacserver.tk/parampara/v1/images";
    Map<String, String> headers = {"Content-Type": "image/png"};

    var request = http.MultipartRequest('POST', Uri.parse(url));
    // String mimeType = mime(img);
    // print(mimeType);
    print(62);
    request.headers.addAll(headers);
    // if (mimeType == null) mimeType = 'image/jpeg';

    request.files.add(await http.MultipartFile.fromPath("myFile", img));
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    var response1 = http.BaseResponse;

    print(response1);
    print(75);
    image = json.decode(response.body);
    result = response.body;
    setState(() {
      if (originalnamepath == image['image']['originalname'] && number == 0) {
        imagefilenamephoto2 = image['image']['filename'];
        print('$imagefilenamephoto2,line80');
      } else {
        imagefilenameimage = image['image']['filename'];
        print('$imagefilenameimage,line80');
      }
    });

    print(78);
    print(res);
    print(87);
    print(request);
    print(89);
    print("imagesapi");
  }

  matrimonypost() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    familyId = prefer.getStringList('idS');
    var url =
        Uri.parse('https://www.cviacserver.tk/parampara/v1/registerMatrimony');
    var response = await http.post(url, body: {
      'id': familyId[1].toString(),
      'name': widget.passdata.name.toString(),
      'physical_status': widget.passdata.physicalstatus.toString(),
      'date_of_birth': widget.passdata.dob.toString(),
      'mobile_number': widget.passdata.mobilenumber.toString(),
      'marital_status': widget.passdata.maritalstatus.toString(),
      'complexion': widget.passdata.complexion.toString(),
      'height': widget.passdata.height1.toString(),
      'body_type': widget.passdata.bodytype.toString(),
      'gender': widget.passdata.gender.toString(),
      'no_of_children': widget.passdata.numofchildren.toString(),
      'w_number': widget.passdata.whatsappnumber.toString(),
      'email': widget.passdata.email.toString(),
      'job_location': widget.passdata1.joblocation.toString(),
      'job_category': widget.passdata1.jobcategory.toString(),
      'annual_income': widget.passdata1.annualIncome.toString(),
      'f_name': widget.passdata1.fathersname.toString(),
      'f_job': widget.passdata1.fathersjob.toString(),
      'education': widget.passdata1.education.toString(),
      'm_name': widget.passdata1.mothersname.toString(),
      'm_job': widget.passdata1.mothersjob.toString(),
      'address': widget.passdata1.currentaddress.toString(),
      'notes': widget.passdata1.notes.toString(),
      'photo2': imagefilenamephoto2,
      'image': imagefilenameimage,
    });
    print(response.body);

    var decodeDetails = json.decode(response.body);
    print(decodeDetails);
    var extractedDetail = decodeDetails['status'];
    print(extractedDetail);
    if (extractedDetail == true) {
      final snackBar = SnackBar(
        backgroundColor: Colors.teal,
        content: Text('Submitted Successfully'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => MatrimonyFirstPage()));
    } else {
      final snackBar = SnackBar(
        backgroundColor: Colors.teal,
        content: Text('Invalid'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    print(widget.passdata.jobcategory);
    print("jobcat 146line");
    print(widget.passdata.joblocation);
    print("jobloc 148line");
    print(widget.passdata.education);
    print("edu 150line");
    // printfunc();
  }

 

  // _ManagePhotosState({this.example1});
  // final List<dynamic> example1;
  // final List<dynamic> example2;
  bool isClicked = false, isClickedSecond = false;
  var top = 30.0;
  // fun() {
  //   print(widget.passdata.education);
  //   print(widget.passdata.jobcategory);
  //   print(widget.passdata.joblocation);
  // }

  @override
  Widget build(BuildContext context) {
    print('${widget.passdata.name},167');
    print('${widget.passdata1.notes},168');
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var status = MediaQuery.of(context).padding.top;
    var appBar = AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[HexColor('#0A4E51'), HexColor('#149BA1')])),
        ),
        backgroundColor: Colors.teal,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Search your Partner',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: (height - appBar) - top,
        width: width,
        padding: EdgeInsets.only(
          top: top,
          left: 30.0,
          right: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My Photos(0)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ((height - appBar) - top) * 0.05,
            ),
            Container(
              height: ((height - appBar) - top) * 0.2,
              width: width * 0.45,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2.0),
              ),
              child: InkWell(
                onTap: () {
                  getgallaryImage(0);
                },
                child: Card(
                  child: _image == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Icon(
                                Icons.add,
                                color: Colors.teal.shade900,
                                size: 90,
                              ),
                            ),
                            Text(
                              'Upload Photos',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      : Image.file(_image),
                ),
              ),
            ),
            SizedBox(
              height: ((height - appBar) - top) * 0.05,
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My Horoscope Photos',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ((height - appBar) - top) * 0.05,
            ),
            InkWell(
              onTap: () {
                getgallaryImage(1);
              },
              child: Container(
                height: ((height - appBar) - top) * 0.2,
                width: width * 0.45,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2.0),
                ),
                child: Card(
                  child: _image1 == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.teal.shade900,
                              size: 90,
                            ),
                            Text(
                              'Upload Photos',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      : Image.file(_image1),
                ),
              ),
            ),
            // Image.network(
            //     'http://cviacserver.tk/parampara/v1/myImages/$imagefilenamephoto2'),
            SizedBox(
              height: ((height - appBar) - top) * 0.20,
            ),
            Expanded(
              child: Container(
                height: (height - appBar) * 0.05,
                width: width,
                child: doubleRowButton(height, appBar, width),
              ),
            ),
            // SizedBox(
            //   height: ((height - appBar) - top) * 0.20,
            // ),
            // Image.network(
            //     'http://cviacserver.tk/parampara/v1/myImages/$imagefilenamephoto2'),
            // SizedBox(
            //   height: ((height - appBar) - top) * 0.20,
            // )
          ],
        ),
      ),
    );
  }

  Widget doubleRowButton(height, appBar, width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isClicked = !isClicked;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isClicked == false ? Colors.white : Colors.teal,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.teal.shade700,
                width: 2,
              ),
            ),
            height: (height - appBar) * 0.05,
            width: (width - 40) * 0.45,
            child: Center(
                child: Text(
              'Save',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isClicked == false ? Colors.black : Colors.white,
              ),
            )),
          ),
        ),
        InkWell(
          onTap: () {
            // uploadImage(_image.path);
            matrimonypost();
            // Navigator.pop(context);
            // setState(() {
            //   isClickedSecond = !isClickedSecond;
            // });
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => MatrimonySearchYourPartner()));
          },
          child: Container(
            decoration: BoxDecoration(
                color: isClickedSecond == false ? Colors.white : Colors.teal,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.teal.shade700,
                  width: 2,
                )),
            height: (height - appBar) * 0.05,
            width: (width - 40) * 0.45,
            child: Center(
                child: Text(
              'Submit',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isClickedSecond == false ? Colors.black : Colors.white,
              ),
            )),
          ),
        ),
      ],
    );
  }
}
