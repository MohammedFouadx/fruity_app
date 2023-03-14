import 'package:flutter/material.dart';


class BigText extends StatelessWidget {
  String? text;
  TextOverflow? textOverflow;
  Color? color;
  double? fontSize;
  FontWeight? fontWeight;
  TextAlign? textAlign;

   BigText({
    Key? key ,
    this.text,
    this.textOverflow,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text!,
        overflow: textOverflow,
        textAlign: textAlign,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color
        ),
      ),
    );
  }
}
