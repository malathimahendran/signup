import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mime_type/mime_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageShow extends StatefulWidget {
  ImageShow({this.image, image1});
  final image;

  @override
  _ImageShowState createState() => _ImageShowState();
}

class _ImageShowState extends State<ImageShow> {
  var image1, result, filename;
  var userId, responseImage;
  String imagesplit;
  @override
  void initState() {
    super.initState();
    imagePost(widget.image.path);
  }

  imagePost(String img) async {
    final String url = "http://www.cviacserver.tk/parampara/v1/images";
    // Map<String, String> headers = {"Content-Type": "image/png"};

    var request = http.MultipartRequest('POST', Uri.parse(url));
    // String mimeType = mime(imagesplit);
    // print(mimeType);
    // request.headers.addAll(headers);
    // if (mimeType == null) mimeType = 'image/jpeg';

    request.files.add(
      await http.MultipartFile.fromPath('myFile', img),
    );
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    var response1 = http.BaseResponse;

    print(response1);
    // image1 = response.then((value) => print('${value.body}'));
    result = json.decode(response.body);
    print(result);
    responseImage = result['image'].toString();
    filename = result['image']['filename'];
    // filename = result['image'];
    print(filename);
    print(responseImage);
  }

  imgGallery() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    userId = prefer.getStringList('idS');
    var url =
        Uri.parse("https://www.cviacserver.tk/parampara/v1/image_gallery");
    var response = await http.post(url,
        body: {'id': userId[1].toString(), 'image_name': filename.toString()});
    print(response.body);
    var decodeDetails = json.decode(response.body);
    print(decodeDetails);
  }

  @override
  Widget build(BuildContext context) {
    imagesplit = widget.image.path.split("/").last;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(height: height * 0.5, child: Image.file(widget.image)),
            ElevatedButton(
                onPressed: () {
                  imgGallery();
                },
                child: Text("Post"))
          ],
        ),
      ),
    );
  }
}
 // GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //             crossAxisCount: 2,
            //             crossAxisSpacing: 11,
            //             mainAxisSpacing: 6,
            //             childAspectRatio: 1.0), itemBuilder: (context,index){
            //               return Container(
            //                 height: height*0.2,
            //                 width: width*0.4,
            //                 child: Card(child: Image.file(widget.image),),
            //               );
            //             })