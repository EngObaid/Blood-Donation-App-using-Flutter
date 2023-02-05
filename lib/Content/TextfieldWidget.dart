import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String HintText;
  final Icon PrefixIcon;
  final bool obscureText;
  final TextEditingController Control;
  const MyTextField({
    super.key,
    required this.HintText,
    required this.PrefixIcon,
    required this.Control, required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return TextField(
      controller: Control,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: HintText,
        prefixIcon: PrefixIcon,
      ),
    );
  }
}
