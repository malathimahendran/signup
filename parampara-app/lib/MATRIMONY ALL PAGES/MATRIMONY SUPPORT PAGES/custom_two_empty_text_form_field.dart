import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:select_form_field/select_form_field.dart';

Widget customTwoEmptyTextFormField(double height, double appBar, double width,
    icon, icon1, hintText, hintText1, controller1, controller2, item1, item2) {
  return Container(
    height: (height - appBar) * 0.05,
    width: width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: (height - appBar) * 0.05,
          width: (width - 40) * 0.47,
          child: SelectFormField(
            items: item1,
            controller: controller1,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: Icon(
                Icons.arrow_drop_down,
              ),
              hintStyle: TextStyle(color: Colors.grey),
              // suffixIcon: Icon(icon),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: HexColor('#0A4E51'),
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: HexColor('#0A4E51'),
                  width: 1,
                ),
              ),
              // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: HexColor('#0A4E51'),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: HexColor('#0A4E51'),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: (height - appBar) * 0.05,
          width: (width - 40) * 0.47,
          child: SelectFormField(
            items: item2,
            controller: controller2,
            decoration: InputDecoration(
              hintText: hintText1,
              hintStyle: TextStyle(color: Colors.grey),
              suffixIcon: Icon(
                Icons.arrow_drop_down,
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: HexColor('#0A4E51'),
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: HexColor('#0A4E51'),
                  width: 1,
                ),
              ),
              // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: HexColor('#0A4E51'),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: HexColor('#0A4E51'),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
