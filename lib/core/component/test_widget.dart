import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? color ;
  const TextWidget({
    super.key, required this.text, required this.fontSize, this.fontWeight, this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: fontSize,fontWeight: fontWeight,color: color),);
  }
}

