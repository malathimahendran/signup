import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:select_form_field/select_form_field.dart';

Widget customsearchform(double height, double width) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: (height - 20) * 0.05,
        width: (width - 30) * 0.45,
        child: TextFormField(
          decoration: InputDecoration(
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
      ),
      Container(
        height: (height - 20) * 0.05,
        width: (width - 30) * 0.45,
        child: TextFormField(
          decoration: InputDecoration(
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
      ),
    ],
  );
}

final List<Map<String, dynamic>> _items = [
  {
    'value': '',
    'label': '',
  },
  {
    'value': '',
    'label': '',
  },
  {
    'value': '',
    'label': '',
  },
];
Container customselectformfield(double height, double width, text) {
  return Container(
    height: (height - 20) * 0.05,
    width: (width - 30) * 1,
    child: SelectFormField(
      items: _items,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
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
