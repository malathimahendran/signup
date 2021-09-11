import 'dart:convert';
import 'dart:io';
import 'package:hexcolor/hexcolor.dart';
import 'package:mime/mime.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'cookingpage.dart';

class CookingPost extends StatefulWidget {
  @override
  _CookingPostState createState() => _CookingPostState();
}

class _CookingPostState extends State<CookingPost> {
  var image;
  var postedImage;
  String img = "";
  var postTitle = TextEditingController();
  var postDesription = TextEditingController();
  File imageFile;
  var familyId;
  String imageName = "";

  //final picker = ImagePicker();

  Future chooseImage(source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      imageFile = File(pickedFile.path);
      print(imageFile.path.split("/").last);
      print(pickedFile.path);
      imageName = imageFile.path.split("/").last.toString();
    });
  }

  postImage() async {
    final String url = "http://www.cviacserver.tk/parampara/v1/images";
    // Map<String, String> headers = {"Content-": "image"};

    var request = http.MultipartRequest('POST', Uri.parse(url));
    // String? mimeType = mime(imageFile!.path);
    // print(mimeType);
    // request.headers.addAll(headers);
    // if (mimeType == null) mimeType = 'image/jpeg';

    request.files.add(
      await http.MultipartFile.fromPath('myFile', imageFile.path),
    );
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    var response1 = http.BaseResponse;

    print(response1);
    postedImage = json.decode(response.body);
    // image = response.then((value) {
    //   setState(() {
    //     postedImage = value.body;
    //   });
    // });
    setState(() {
      image = postedImage['image']['filename'];
      print(image);
    });

    print('${postedImage},here it is');

    print(response);
    print(res.contentLength);
    print(res.headers);
    print(res.persistentConnection);
    print(res.reasonPhrase);
    // print(response.asStream());
    print(res.statusCode);
    print(res.stream);
    print(res);
    print(request);
    print("45");
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double barApp = AppBar().preferredSize.height;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
            "CookingTips",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          height: height,
          width: width,
          child: Column(
            children: [
              Container(
                height: height * 0.8,
                width: width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        //color: Colors.red,
                        height: height * 0.05,
                        width: width * 0.90,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Add Cooking Tips",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: height * 0.03,
                        width: width * 0.90,
                        child: Text(
                          "Title",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child: Container(
                          height: height * 0.06,
                          width: width * 0.90,
                          child: TextFormField(
                            controller: postTitle,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: height * 0.05,
                        width: width * 0.90,
                        alignment: Alignment.centerLeft,
                        child: Text("Description",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Card(
                        elevation: 5,
                        child: Container(
                          height: 200,
                          width: width * 0.90,
                          child: TextFormField(
                            controller: postDesription,
                            // expands: true,
                            maxLines: 10,
                            minLines: null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Card(
                        elevation: 3,
                        child: Container(
                          width: width * 0.90,
                          height: height * 0.07,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff054043)),
                              borderRadius: BorderRadius.circular(5)),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Options"),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: [
                                            GestureDetector(
                                              child: Text(
                                                  "Capture Image From Camera"),
                                              onTap: () {
                                                chooseImage(ImageSource.camera);
                                                Navigator.pop(context,
                                                    ImageSource.camera);
                                              },
                                            ),
                                            Padding(
                                                padding: EdgeInsets.all(10)),
                                            GestureDetector(
                                              child: Text(
                                                  "Take Image From Gallery"),
                                              onTap: () {
                                                chooseImage(
                                                    ImageSource.gallery);
                                                Navigator.pop(context,
                                                    ImageSource.gallery);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Upload picture",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: 350,
                          width: 350,
                          color: Colors.white,
                          child: imageFile == null
                              ? Text("")
                              : Image.file(imageFile)),
                    ],
                  ),
                ),
              ),
              Container(
                height: height * 0.1,
                width: width,
                child: Column(
                  children: [
                    InkWell(
                      onTap: apiPost,
                      child: Container(
                        width: width * 0.75,
                        height: height * 0.07,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff054043)),
                            borderRadius: BorderRadius.circular(5)),
                        child: Container(
                          color: Color(0xff0A5356),
                          alignment: Alignment.center,
                          child: Text(
                            "Post",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xffFFFFFF)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )

              // Container(
              //   alignment: Alignment.center,
              //   height: 700,
              //   width: 260,
              //   child: imageFile == null ? Text("") : Text(imageName),
              // ),
              // IconButton(onPressed: chooseImage, icon: Icon(Icons.image))
            ],
          ),
        ));
  }

  apiPost() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    familyId = prefer.getStringList('idS');
    print(familyId[1]);
    var url =
        Uri.parse('https://www.cviacserver.tk/parampara/v1/newCookingTips');
    var response = await http.post(url, body: <String, dynamic>{
      "id": familyId[1].toString(),
      "description": postDesription.text.toString(),
      "title": postTitle.text.toString(),
      "uploadpicture": image.toString(),
    });
    print(json.decode(response.body));
    print(response.statusCode);
    var decodeDetails = json.decode(response.body);
    var extractedDetail = decodeDetails['status'];
    print(extractedDetail);
    if (extractedDetail == true) {
      final snackBar = SnackBar(
        backgroundColor: Colors.teal,
        content: Text('Tips added successfully'),
        duration: Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => new CookingTips()));
    }
  }
}
