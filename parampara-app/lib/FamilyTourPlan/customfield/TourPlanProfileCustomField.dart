import 'package:flutter/material.dart';

Widget customTextProfile(text, text1, width) {
  return Container(
    // width: width * 0.8,
    padding: EdgeInsets.only(left: 50, right: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        Text(
          text1,
          style: TextStyle(fontSize: 15),
        )
      ],
    ),
  );
}
