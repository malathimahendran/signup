import 'package:googleandfacebook/COOKINGTIPS/cooking_api.dart';
import 'package:googleandfacebook/COOKINGTIPS/cookingpage.dart';
import 'package:googleandfacebook/COOKINGTIPS/fooddetailpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'cooking_api.dart';

class Cooklist extends StatefulWidget {
  @override
  _CooklistState createState() => _CooklistState();
}

class _CooklistState extends State<Cooklist> {
  var data;

  listFood(context, index) {
    return InkWell(
      onTap: () {
        print(data);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FoodDetail(foodRecipe: data[index])));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 1),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle, color: Color(0xffC5D9D9)),
              child: Row(
                children: [
                  Container(
                      height: 80,
                      child: Image.asset("assets/Cooking Tips/idli_image.png")),
                  Container(
                      margin: EdgeInsets.only(left: 50),
                      child: Text(data[index]['title'])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    CookingApi().apiData().then((value) {
      setState(() {
        data = value;
        print(data);
        print("56");
      });
    });
    super.initState();
  }

  var food;
  listFoodHere(context, index) {
    food = data[index];
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FoodDetail()));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
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
      body: data == null
          ? Text("")
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return listFood(context, index);
              }),
    );
  }
}
