import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  const CustomTextWidget(
      {super.key,
      required this.text,
      this.size,
      this.color,
      this.fontWeight,
      this.fontStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle),
    );
  }
}
