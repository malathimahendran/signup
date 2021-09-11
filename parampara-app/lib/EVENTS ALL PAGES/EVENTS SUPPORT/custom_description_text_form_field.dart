import 'package:flutter/material.dart';

class CustomDescriptionTextFormField extends StatelessWidget {
  const CustomDescriptionTextFormField({
    Key key,
    @required this.height,
    @required this.appBar,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double appBar;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (((height - appBar) * 0.80) - 15) * 0.20,
      width: width,
      child: TextFormField(
        expands: true,
        maxLines: null,
        minLines: null,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            borderSide: BorderSide(
              color: Colors.teal.shade800,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            borderSide: BorderSide(
              color: Colors.teal.shade800,
            ),
          ),
        ),
      ),
    );
  }
}
