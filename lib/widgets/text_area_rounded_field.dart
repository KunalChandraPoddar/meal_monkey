import 'package:flutter/material.dart';

class TextAreaRoundedField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscure;

  const TextAreaRoundedField({
    super.key,
    required this.controller,
    required this.hint,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return roundedField(controller, hint, obscure);
  }
  Widget roundedField(
    TextEditingController controller,
    String hint,
    bool obscure,
  ) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFEDEDED),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
