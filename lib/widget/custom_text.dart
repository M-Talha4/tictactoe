import 'package:flutter/material.dart';

// ignore: camel_case_types
class cText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;

  const cText(
      {super.key, required this.text, this.size, this.color, this.weight});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size ?? width * 0.04,
        fontWeight: weight,
      ),
    );
  }
}
