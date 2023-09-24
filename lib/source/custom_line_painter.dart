import 'package:dotted_separator/dotted_separator.dart';

/// A custom painter for drawing dashed lines.
///
/// The [CustomLinePainter] class allows you to create a custom painter for drawing dashed lines.

/// CustomLine Painter properties.
/// * [axis]
/// * [color]
/// * [dashSpace]
/// * [dashWidth]

class CustomLinePainter extends CustomPainter {
  /// The axis along which the dashed line should be drawn.
  /// [axis] values can be [Axis.horizontal] or [Axis.vertical]
  final Axis axis;

  /// [color] defines the color of the dashed line.
  final Color color;

  /// The space between dashes in the line.
  /// [dashSpace] value is used calculate [startX] value if the [axis] is [Axis.horizontal].
  /// [dashSpace] value is used calculate [startY] value if the [axis] is [Axis.vertical].
  final double dashSpace;

  /// The width of each dash in the line.
  /// [dashWidth] value is used calculate [startX] value if the [axis] is [Axis.horizontal].
  /// [dashWidth] value is used calculate [startY] value if the [axis] is [Axis.vertical].
  final double dashWidth;

  /// [strokeWidth] defines the thinkness of the dashed line.
  final double strokeWidth;

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
