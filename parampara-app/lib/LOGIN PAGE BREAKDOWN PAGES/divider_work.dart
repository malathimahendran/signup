import 'package:flutter/material.dart';

Widget customDivider() {
  return Row(
    children: [
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          child: Divider(
            color: Colors.white,
          ),
        ),
      ),
      Text(
        "OR",
        style: TextStyle(color: Colors.white),
      ),
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          child: Divider(
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
