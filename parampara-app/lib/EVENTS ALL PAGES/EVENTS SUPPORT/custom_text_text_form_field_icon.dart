import 'package:flutter/material.dart';

class CustomTextTextFormFieldIcon extends StatelessWidget {
  const CustomTextTextFormFieldIcon(
      {Key key,
      @required this.height,
      @required this.appBar,
      @required this.width,
      @required this.icon,
      @required this.text,
      @required this.onPressed,
      @required this.controller})
      : super(key: key);
  final controller;
  final double height;
  final double appBar;
  final double width;
  final icon;
  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (((height - appBar) * 0.60) - 15) * 0.1,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: (((height - appBar) * 0.60) - 15) * 0.1,
            width: (width - 20) * 0.3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Container(
            height: (((height - appBar) * 0.60) - 15) * 0.1,
            width: (width - 20) * 0.70,
            child: Center(
              child: TextFormField(
                controller: controller,
                style: TextStyle(
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(icon),
                    onPressed: onPressed,
                    color: Colors.teal.shade800,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal.shade700,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal.shade700,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
