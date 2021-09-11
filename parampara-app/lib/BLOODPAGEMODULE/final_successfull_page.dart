import 'package:flutter/material.dart';


class FinalSuccessfullPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Card(elevation: 20,
        child: Container(
          height: height,
          width: width,
          child: Column(children: [
            Container(
              height:height*0.22,
            ),
            Container(width: width*0.95,
              child: Image(image: AssetImage('assets/Bloodmoduleimages/successfullpage.png'),),
            ),
            SizedBox(height: 12,),
            Container(alignment: Alignment.center,
              width: width*0.95,
              child: Text('Blood is Successfully Requested',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Color(0xff000000)),),)
          ],),
        ),
      ),
    );
  }
}