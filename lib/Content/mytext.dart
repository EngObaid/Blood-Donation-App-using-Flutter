import 'package:flutter/material.dart';


class MyText extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String MylableText;
  // ignore: non_constant_identifier_names
  final double FontSize;
  const MyText({
    super.key,
    // ignore: non_constant_identifier_names
    required this.MylableText,
    // ignore: non_constant_identifier_names
    required this.FontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      MylableText,
      textAlign: TextAlign.center,
      
      style: TextStyle(fontSize: FontSize, fontWeight: FontWeight.bold,color: Colors.red),
    );
  }
}
