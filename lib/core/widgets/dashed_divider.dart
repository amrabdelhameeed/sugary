import 'package:flutter/material.dart';

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white // Set the color of the dashed line
      ..strokeWidth = 1 // Set the width of the dashed line
      ..strokeCap = StrokeCap.round;

    double dashWidth = 5.0; // Set the width of each dash
    double dashSpace = 5.0; // Set the space between dashes

    double startX = 0.0;
    double endX = size.width;

    double currentX = startX;

    while (currentX < endX) {
      canvas.drawLine(Offset(currentX, 0), Offset(currentX + dashWidth, 0), paint);
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
