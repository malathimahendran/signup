import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:select_form_field/select_form_field.dart';

import 'PostQuestion.dart';

class PostForm extends StatefulWidget {
  PostForm({Key key}) : super(key: key);

  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  String text;
  final List<Map<String, dynamic>> _items = [
    {
      'value': '',
      'label': '',
    },
    {
      'value': '',
      'label': '',
    },
    {
      'value': '',
      'label': '',
    },
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
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
            'Health Tips',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          height: height,
          width: width,
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 5,
          ),
          child: Column(
            children: [
              SizedBox(height: height * 0.01),
              alignTextOnly(
                text = "Add Health Tips Details",
              ),
              SizedBox(height: 15),
              alignTextOnly(
                text = "Title",
              ),
              SizedBox(height: 15),
              Container(
                height: height * 0.06,
                width: width * 0.9,
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      borderSide:
                          BorderSide(color: HexColor("#0A4E51"), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      borderSide:
                          BorderSide(color: HexColor("#0A4E51"), width: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              alignTextOnly(
                text = "Category",
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: height * 0.06,
                  width: width * 0.9,
                  child: SelectFormField(
                    items: _items,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        borderSide:
                            BorderSide(color: HexColor("#0A4E51"), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        borderSide:
                            BorderSide(color: HexColor("#0A4E51"), width: 1),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              alignTextOnly(
                text = "Description",
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: height * 0.2,
                  width: width * 0.9,
                  child: TextFormField(
                    maxLines: 6,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        borderSide:
                            BorderSide(color: HexColor("#0A4E51"), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        borderSide:
                            BorderSide(color: HexColor("#0A4E51"), width: 1),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Container(
                    height: height * 0.06,
                    width: width * 0.9,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              side: BorderSide(color: HexColor("#0A4E51"))),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Upload Picture",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ))),
              ),
              SizedBox(
                height: height * 0.15,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    height: height * 0.06,
                    width: width * 0.8,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostQuestion()));
                        },
                        style: ElevatedButton.styleFrom(
                            primary: HexColor("#0A4E51")),
                        child: Text("Post"))),
              )
            ],
          ),
        ));
  }

  alignTextOnly(text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
    );
  }
}
