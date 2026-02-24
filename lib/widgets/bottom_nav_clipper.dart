import 'package:flutter/material.dart';

class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double holeWidth = 120;
    double leftX = (size.width - holeWidth) / 2;

    path.moveTo(0, 0);

    path.lineTo(leftX - 10, 0);

    path.quadraticBezierTo(leftX + 6, 0, leftX + 16, 10);

    path.arcToPoint(
      Offset(leftX + holeWidth - 15, 8),
      radius: const Radius.circular(45),
      clockwise: false,
    );

    path.quadraticBezierTo(leftX + holeWidth - 5, 0, leftX + holeWidth + 10, 0);

    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
