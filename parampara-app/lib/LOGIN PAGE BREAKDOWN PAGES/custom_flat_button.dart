import 'package:flutter/material.dart';

Widget customFlatButtom(functionHere, widthGiven, textGiven, imageGiven) {
  return FlatButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    onPressed: functionHere,
    child: Container(
      width: widthGiven,
      child: Row(
        children: [
          Image.asset(
            imageGiven,
            height: 30,
            width: 30,
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            textGiven,
            style: TextStyle(
                color: Colors.lightBlue.shade900,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ],
      ),
    ),
    height: 50,
    color: Colors.white,
  );
}
