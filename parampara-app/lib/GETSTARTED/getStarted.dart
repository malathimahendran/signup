import 'package:flutter/material.dart';
import 'package:googleandfacebook/Login%20Page/login_page.dart';

class GetStarted extends StatefulWidget {
  @override
  GetStartedState createState() => GetStartedState();
}

class GetStartedState extends State<GetStarted> {
  hexColor(String color) {
    var colors = color.replaceFirst('#', '');
    var givenColor = int.parse('0xFF' + colors);
    return givenColor;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              height: height * 0.4,
              width: width,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: ExactAssetImage('assets/GetStarted/frontscreen.jpg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              height: height * 0.60,
              width: width,
              color: Color(0xFF1e8096),

              //for all kind of color see please line number 54 below.
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: (height * 0.6) * 0.179,
                  ),
                  Container(
                    height: (height * 0.6) * 0.10,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'CONNECT WITH PARAMPARA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    height: (height * 0.6) * 0.25,
                    width: width * 0.8,
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 10,
                      bottom: 15,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: Colors.cyan.shade700),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Let\'s Start Journey With Your',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'Parampara And Always Connect',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'With Your Family',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: (height * 0.6) * 0.08,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/loginPage');
                    },
                    child: ClipPath(
                      clipper: SemiCircleTry1(),
                      child: Container(
                        padding: EdgeInsets.zero,
                        height: height * 0.22,
                        width: width,
                        color: Color(
                          hexColor('#04777D'),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 18.0, right: 16),
                            child: InkWell(
                              onTap: () {
                                Navigator.popAndPushNamed(
                                    context, '/loginPage');
                              },
                              child: Text(
                                'Get Started',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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

class SemiCircleTry1 extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.moveTo((size.width) * 0.05, size.height);
    var firstControlPoint1 = Offset(size.width * 0.15, size.height * 0.43);
    var firstEndpoint1 = Offset(size.width * 0.5, size.height * 0.4);
    path.quadraticBezierTo(firstControlPoint1.dx, firstControlPoint1.dy,
        firstEndpoint1.dx, firstEndpoint1.dy);

    var secondControlPoint = Offset(size.width * 0.86, size.height * 0.41);
    var secondEndpoint = Offset(size.width * 0.95, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndpoint.dx, secondEndpoint.dy);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
