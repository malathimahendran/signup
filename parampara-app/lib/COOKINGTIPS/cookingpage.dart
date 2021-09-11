// import 'package:googleandfacebook/BLOODPAGE/bloodrequest.dart';
import 'package:googleandfacebook/COOKINGTIPS/cooking_post.dart';
import 'package:googleandfacebook/COOKINGTIPS/cooklist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CookingTips extends StatefulWidget with ChangeNotifier {
  @override
  _CookingTipsState createState() => _CookingTipsState();
}

class _CookingTipsState extends State<CookingTips> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            Container(
              height: height * 0.67,
              width: width,
              child: Image.asset(
                "assets/Cooking Tips/cooking_tips_main_screen_image.png",
                fit: BoxFit.cover,
              ),
            ),
            // SafeArea(
            //   child: Container(
            //     child: IconButton(
            //       onPressed: () {
            //         Navigator.push(context,
            //             MaterialPageRoute(builder: (context) => Cooklist()));
            //       },
            //       // icon: Icon(Icons.menu),
            //       color: Color(0xffFFFFFF),
            //     ),
            //   ),
            // ),
            Positioned(
              bottom: 0,
              child: Container(
                height: height * 0.35,
                width: width,
                decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24),
                        topLeft: Radius.circular(24))),
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        height: 71,
                        width: 280,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                            color: Color(0xff1D0303)),
                        child: Center(
                            child: Text(
                          "Post Cooking Tips ",
                          style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        )),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CookingPost()));
                      },
                    ),
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        height: 71,
                        width: 280,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                            color: Color(0xff1D0303)),
                        child: Center(
                            child: Text(
                          "Cooking Tips ",
                          style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        )),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Cooklist()));
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
