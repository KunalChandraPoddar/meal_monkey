import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  final bool isOutlined;

  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double height;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.backgroundColor = const Color(0xFFFF6C00),
    this.textColor = Colors.white,
    this.borderRadius = 30,
    this.height = 55,
  });

  @override
  Widget build(BuildContext context) {
    if (isOutlined) {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: Size(double.infinity, height),
          side: BorderSide(color: backgroundColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(double.infinity, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 16),
      ),
    );
  }
}