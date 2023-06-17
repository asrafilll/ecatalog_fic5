import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.suffixIcon,
    this.obscureText = false,
    required this.controller,
  });

  final String label;
  final String hintText;
  final IconData suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: Text(label),
        suffixIcon: Icon(suffixIcon),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }
}
