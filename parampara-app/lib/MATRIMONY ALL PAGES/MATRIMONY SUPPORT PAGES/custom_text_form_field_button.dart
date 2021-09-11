import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:select_form_field/select_form_field.dart';

List<Map<String, dynamic>> items = [
  {
    'value': "123",
    'label': '454',
  },
  {
    'value': "127",
    'label': '658',
  },
  {
    'value': "124",
    'label': '89',
  },
];
Widget customTextFormFieldPlusButton(double height, double appBar, double width,
    controller, onTapStart, onTapEnd) {
  return Container(
    height: (height - appBar) * 0.05,
    width: (width - 40) * 0.47,
    child: TextFormField(
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
        fontSize: 18,
      ),
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: InkWell(
          onTap: onTapStart,
          child: Container(
            height: (height - appBar) * 0.05,
            width: (width - 40) * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              border: Border.all(
                style: BorderStyle.solid,
                color: HexColor('#0A4E51'),
              ),
              shape: BoxShape.rectangle,
              // color: Colors.green,
            ),
            child: Icon(Icons.remove),
          ),
        ),
        suffixIcon: InkWell(
          onTap: onTapEnd,
          child: Container(
            height: (height - appBar) * 0.06,
            width: (width - 40) * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              border: Border.all(
                style: BorderStyle.solid,
                color: HexColor('#0A4E51'),
              ),
              shape: BoxShape.rectangle,
              // color: Colors.green,
            ),
            child: Icon(Icons.add),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: HexColor('#0A4E51'),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: HexColor('#0A4E51'),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
    ),
  );
}

Container customSelectFormField(
    double height, double appBar, double width, hintText, controller) {
  return Container(
    height: (height - appBar) * 0.05,
    width: (width),
    child: SelectFormField(
      controller: controller,
      // icon: Icon(Icons.people, color: Colors.black),
      // labelText: 'Gender',
      // changeIcon: true,
      // dialogTitle: 'Pick a item',
      // dialogCancelBtn: 'CANCEL',
      // enableSearch: true,
      // dialogSearchHint: 'Search item',
      items: items,
      decoration: InputDecoration(
        hintText: hintText,
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
          borderSide: BorderSide(color: Colors.teal, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: Colors.teal, width: 1),
        ),
        // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: Colors.teal, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: Colors.teal),
        ),
      ),
    ),
  );
}
