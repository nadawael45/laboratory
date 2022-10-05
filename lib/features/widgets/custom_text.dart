import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String? text;
  double? txtSize;
  FontWeight? fontWeight;
  Color? color;
  TextAlign textAlign;
  TextDecoration? textDecoration;

  CustomText(
      {this.text,
      this.txtSize,
      this.fontWeight,
      this.color,
      this.textDecoration,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text((text!),
        textAlign: textAlign,
        maxLines: 2,
        softWrap: true,
        overflow: TextOverflow.visible,
        style: TextStyle(
          decoration: textDecoration ?? TextDecoration.none,
          color: color,
          fontSize: txtSize,
          fontWeight: fontWeight,
        ));
  }
}
