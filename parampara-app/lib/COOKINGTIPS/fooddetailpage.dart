import 'package:flutter/material.dart';

class FoodDetail extends StatefulWidget {
  FoodDetail({this.foodRecipe});
  final foodRecipe;
  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  // var deatiltitle = widget.foodRecipe['title'];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                widget.foodRecipe['title'],
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(height: 20),
              Image.asset(
                "assets/Cooking Tips/idli_image.png",
                width: width * 0.3,
                height: height * 0.25,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                widget.foodRecipe["description"] ?? "",
                style: TextStyle(color: Color(0xff707070)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
