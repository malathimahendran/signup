import 'package:flutter/material.dart';

class CustomTextAndTextFormField extends StatelessWidget {
  const CustomTextAndTextFormField({
    Key key,
    @required this.height,
    @required this.appBar,
    @required this.width,
    @required this.text,
  }) : super(key: key);

  final double height;
  final double appBar;
  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (((height - appBar) * 0.6) - 15) * 0.1,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: (((height - appBar) * 0.6) - 15) * 0.1,
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
            height: (((height - appBar) * 0.6) - 15) * 0.1,
            width: (width - 20) * 0.70,
            decoration: BoxDecoration(
              boxShadow: [],
            ),
            child: Center(
              child: TextFormField(
                decoration: InputDecoration(
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
