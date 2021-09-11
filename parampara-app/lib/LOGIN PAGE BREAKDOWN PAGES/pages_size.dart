import 'package:flutter/material.dart';

class AllSize {
  Widget customTextFormField(
      keyboardType, controller, returnText, labelText, icon, obscureText) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      validator: (value) {
        if (value.isEmpty) {
          return returnText;
        } else {
          return null;
        }
      },
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.teal[110],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          borderSide: BorderSide(color: Colors.teal.shade300, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          borderSide: BorderSide(color: Colors.teal.shade300, width: 1),
        ),
        prefixIcon: Icon(icon, color: Colors.white),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
