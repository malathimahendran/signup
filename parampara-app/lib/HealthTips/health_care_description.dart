import 'package:flutter/material.dart';

class Contentscreen extends StatefulWidget {
  @override
  _ContentscreenState createState() => _ContentscreenState();
}

class _ContentscreenState extends State<Contentscreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    print(height);
    var width = MediaQuery.of(context).size.width;

    var bottom = kBottomNavigationBarHeight;
    print(bottom);
    return Scaffold(
      body: Container(
          width: width,
          height: height,
          margin: EdgeInsets.only(top: 90, left: 40, right: 40),
          child: Column(
            children: [
              Text(
                'To Stop hairFall',
                style: TextStyle(
                    fontSize: width * 0.05, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: width * 0.78,
                height: height * 0.25,
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage('assets/HealthTips/Image 30.png'),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Hair is a protein filament that grows from follicles found in the dermis.The human body, apart from areas of glabrous skin, is covered in follicles which produce thick terminal and fine vellus hair. Most common interest in hair is focused on hair growth, hair types, and hair care, but hair is also an important biomaterial primarily composed of protein, notably alpha-keratin. ',
                style: TextStyle(fontSize: 16),
              )
            ],
          )),
    );
  }
}
