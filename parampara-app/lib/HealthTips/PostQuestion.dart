import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PostQuestion extends StatefulWidget {
  PostQuestion({Key key}) : super(key: key);

  @override
  _PostQuestionState createState() => _PostQuestionState();
}

class _PostQuestionState extends State<PostQuestion> {
  var icon, labelText;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
          backgroundColor: Colors.teal,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Ask Questions',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          height: height,
          width: width,
          padding: EdgeInsets.only(
            top: (height) * 0.04,
            bottom: (height) * 0.01,
            left: (height) * 0.02,
            right: (height) * 0.02,
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      customTextFormField(
                        height,
                        width,
                        labelText = "Add Receipient",
                        icon = Icon(Icons.add),
                      ),
                      SizedBox(
                        height: (height) * 0.03,
                      ),
                      customTextFormField(
                        height,
                        width,
                        labelText = "Type question here",
                      ),
                      SizedBox(
                        height: (height) * 0.03,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: (height) * 0.1,
                          width: width,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.teal.shade700),
                          ),
                          child: Center(
                            child: Text(
                              'Upload picture',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: (height) * 0.07,
                  width: width * 0.8,
                  color: HexColor('#0A4E51'),
                  child: Center(
                    child: Text(
                      'Post',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Container customTextFormField(double height, double width, labelText,
      [icon]) {
    return Container(
      height: height * 0.06,
      width: width,
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: icon,
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 15,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(color: HexColor("#0A4E51"), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(color: HexColor("#0A4E51"), width: 1),
          ),
        ),
      ),
    );
  }
}
