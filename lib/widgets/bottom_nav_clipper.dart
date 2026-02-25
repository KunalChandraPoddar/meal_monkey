import 'package:flutter/material.dart';

class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    
    double holeWidth = 100;
    double holeHeight = 38;
    double leftX = (size.width - holeWidth) / 2;
    double smoothness = 40;

    path.moveTo(0, 0);
    path.lineTo(leftX - smoothness, 0); 

    path.cubicTo(
      leftX - 15, 0,                
      leftX - 5, 0,                      
      leftX + 5, holeHeight * 0.5,       
    );

    path.arcToPoint(
      Offset(leftX + holeWidth - 5, holeHeight * 0.7),
      radius: const Radius.circular(48),
      clockwise: false,
    );

    path.cubicTo(
      leftX + holeWidth + 5, 0,                      
      leftX + holeWidth + 15, 0,     
      leftX + holeWidth + smoothness, 0,             
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
