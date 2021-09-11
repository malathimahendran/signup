import 'package:flutter/material.dart';

Widget customTextFormFieldRegisterWithVisibility(
    keyboardType, controller, returnText, labelText, obscureText, onPressed) {
  return TextFormField(
    textCapitalization: TextCapitalization.none,
    keyboardType: keyboardType,
    controller: controller,
    obscureText: obscureText,
    validator: (value) {
      if (value.isEmpty) {
        return returnText;
      } else {
        return null;
      }
    },
    style: TextStyle(
      color: Colors.white,
    ),
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            16.0,
          ),
        ),
        borderSide: BorderSide(
          color: Colors.cyan,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            16.0,
          ),
        ),
        borderSide: BorderSide(
          color: Colors.cyan,
          width: 1,
        ),
      ),
      prefixIcon: Icon(
        Icons.account_circle,
        color: Colors.white,
      ),
      labelText: labelText,
      labelStyle: TextStyle(
        color: Colors.white,
      ),
      suffixIcon: IconButton(
          icon: obscureText
              ? Icon(
                  Icons.visibility_off,
                  size: 30,
                )
              : Icon(
                  Icons.visibility,
                  size: 35,
                ),
          onPressed: onPressed),
    ),
  );
}

Widget customTextFormFieldRegister(
    keyboardType, controller, returnText, labelText, icon) {
  return TextFormField(
    textCapitalization: TextCapitalization.none,
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
