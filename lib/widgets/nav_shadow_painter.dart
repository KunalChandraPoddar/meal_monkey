import 'package:flutter/material.dart';

class NavShadowPainter extends CustomPainter {
  final CustomClipper<Path> clipper;
  NavShadowPainter({required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    final path = clipper.getClip(size);
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.13)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    canvas.drawPath(path.shift(const Offset(0, -2)), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}