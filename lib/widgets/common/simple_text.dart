import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {
  final String title;
  final double size;
  final FontWeight weight;
  final Color color;
  final TextAlign align;
  const SimpleText(
      {Key? key,
      required this.title,
      this.size = 14,
      this.weight = FontWeight.normal,
      this.color = Colors.black,
      this.align = TextAlign.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Text(
      title,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    ));
  }
}
