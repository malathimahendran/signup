import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:select_form_field/select_form_field.dart';

var date = TextEditingController();
Widget customTextFormField1(height, width, text, controllertext) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Container(
      height: (height - 20) * 0.05,
      width: (width - 30) * 0.4,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ),
    Container(
      height: (height - 20) * 0.05,
      width: (width - 30) * 0.6,
      child: TextFormField(
        controller: controllertext,
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
  ]);
}

Widget customSelectFormField1(height, width, text, items, controllerselect) {
  return Row(
    children: [
      Container(
        height: (height - 20) * 0.05,
        width: (width - 30) * 0.4,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Container(
        height: (height - 20) * 0.05,
        width: (width - 30) * 0.6,
        child: SelectFormField(
          controller: controllerselect,
          // icon: Icon(Icons.people, color: Colors.black),
          // labelText: 'Gender',
          // changeIcon: true,
          // dialogTitle: 'Pick a item',
          // dialogCancelBtn: 'CANCEL',
          // enableSearch: true,
          // dialogSearchHint: 'Search item',
          items: items,
          decoration: InputDecoration(
            // hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
            filled: true,
            suffixIcon: Icon(
              Icons.arrow_drop_down,
            ),
            fillColor: Colors.white,

            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: HexColor("#0A4E51"), width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: HexColor("#0A4E51"), width: 1),
            ),
            // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: HexColor("#0A4E51"), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: HexColor("#0A4E51")),
            ),
          ),
        ),
      ),
    ],
  );
}
