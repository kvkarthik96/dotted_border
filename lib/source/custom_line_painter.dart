import 'package:flutter/material.dart';

class CustomLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final double strokeWidth;
  final Axis axis;
  final Color color;

  CustomLinePainter(
      {required this.axis,
      required this.color,
      required this.dashSpace,
      required this.dashWidth,
      required this.strokeWidth});
  @override
  void paint(Canvas canvas, Size size) {
    if (axis == Axis.vertical) {
      double startY = 0;
      while (startY < size.height) {
        final paint = Paint()
          ..color = color
          ..strokeWidth = strokeWidth;
        canvas.drawLine(
          Offset(size.width / 2, startY),
          Offset(size.width / 2, startY + dashWidth),
          paint,
        );
        startY += dashWidth + dashSpace;
      }
    } else {
      double startX = 0;
      while (startX < size.width) {
        final paint = Paint()
          ..color = color
          ..strokeWidth = strokeWidth;
        canvas.drawLine(
          Offset(startX, size.height / 2),
          Offset(startX + dashWidth, size.height / 2),
          paint,
        );
        startX += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomLinePainter oldDelegate) {
    return false;
  }
}
