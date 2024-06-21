import 'package:flutter/cupertino.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path();
    // Start from bottom left
    path.moveTo(0, height * 0.4);

    // Left rounded corner
    path.quadraticBezierTo(
      width * 0.1, height * 0.1,
      width * 0.35, height * 0.05,
    );

    // Top bulge (use cubic Bézier curve for more control)
    path.cubicTo(
      width * 0.45, -height * 0.15, // First control point
      width * 0.55, -height * 0.15, // Second control point
      width * 0.65, height * 0.05,  // End point
    );

    // Right rounded corner
    path.quadraticBezierTo(
      width * 0.9, height * 0.1,
      width, height * 0.4,
    );

    // Right bottom rounded corner
    path.quadraticBezierTo(
      width, height,
      width * 0.9, height,
    );

    // Bottom edge
    path.lineTo(width * 0.1, height);

    // Left bottom rounded corner
    path.quadraticBezierTo(
      0, height,
      0, height * 0.4,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
