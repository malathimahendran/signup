import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
Widget customRowTextfieldJobRecruit(double height, double width,text) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(4.0)),
                          borderSide: BorderSide(
                              color: HexColor("#0A4E51"), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(4.0)),
                          borderSide: BorderSide(
                              color: HexColor("#0A4E51"), width: 1),
                        ),
                      ),
                    ),
                  ),
                ],
              );
  }