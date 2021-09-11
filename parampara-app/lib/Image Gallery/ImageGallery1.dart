import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:googleandfacebook/Image%20Gallery/ImageShow.dart';
import 'package:googleandfacebook/Image%20Gallery/posts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CamGallery1 extends StatefulWidget {
  CamGallery1({Key key}) : super(key: key);

  @override
  _CamGallery1State createState() => _CamGallery1State();
}

class _CamGallery1State extends State<CamGallery1> {
  File _image, _image1;
  var imagesplit;
  var familyId;
  final picker = ImagePicker();
  imgget() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    familyId = prefer.getStringList('idS');
    print(familyId[0]);
    print(familyId[1]);
    final String url =
        "https://www.cviacserver.tk/parampara/v1/get_image_gallery/${familyId[0]}";
    var response = await http.get(Uri.parse(url));
    print(response);
    var decodeDetails = json.decode(response.body);
    print(decodeDetails);
    var extractedDetails = decodeDetails['status'];
    if (extractedDetails == true) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Posts(imageget: imagesplit, getbodydata: decodeDetails)));
    }
  }

  Future getgalleryImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        imagesplit = _image.path.split("/").last;
      } else {
        print('No image selected.');
      }
    });
    if (_image != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ImageShow(image: _image)));
    }
  }

  Future getcamImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image1 = File(pickedFile.path);
        // imagesplit = _image.path.split("/").last;
      } else {
        print('No image selected.');
      }
    });
    if (_image1 != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ImageShow(image: _image1)));
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        // color: Colors.black,
        child: Column(
          children: [
            Container(
              height: height,
              width: width,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/FamilyTourPlan/TourFirstTop.jpg"),
                          fit: BoxFit.cover),
                    ),
                    height: height * 0.90,
                    width: width,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        height: height * 0.30,
                        width: width,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                "James Rahul",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    getgalleryImage();
                                  },
                                  child: Container(
                                    child: Icon(
                                      Icons.image,
                                      color: Colors.teal[800],
                                      size: 50,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    getcamImage();
                                  },
                                  child: Container(
                                    child: Icon(
                                      Icons.camera_enhance,
                                      color: Colors.teal[800],
                                      size: 50,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  imgget();
                                },
                                child: Text("Show Posts"))
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
