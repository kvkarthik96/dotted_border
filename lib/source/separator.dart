library dotted_separator;

import 'package:dotted_separator/dotted_separator.dart';

/// A widget that creates a custom-drawn dashed line.
///
/// Use the [DashedLine] widget to create a horizontal or vertical dashed line.

/// DashedLine properties.
/// * [axis]
/// * [color]
/// * [dashSpace]
/// * [dashWidth]
/// * [strokeWidth]
/// * [padding]
/// * [width]
/// * [height]
class DashedLine extends StatelessWidget {
  /// The axis along which the dashed line should be drawn.
  /// [axis] values can be [Axis.horizontal] or [Axis.vertical]
  /// Use [Axis.horizontal] to draw a horizontal dashed line 
  /// Use [Axis.vertical] to draw a vertical dashed line.
  final Axis axis;

  /// The color of the dashed line.
  /// [color] value should be given 
  final Color color;

  /// The space between dashes in the line.
  final double dashSpace;

  /// The width of each dash in the line.
  final double dashWidth;

  /// The thickness of the dashed line.
  final double strokeWidth;

  /// The padding around the dashed line. 
  final EdgeInsetsGeometry padding;

  /// The width of the dashed line widget.
  final double width;

  /// The height of the dashed line widget.
  final double height;

  // Constructor for DashedLine.
  const DashedLine({
    Key? key,
    required this.axis,
    required this.color,
    required this.dashSpace,
    required this.dashWidth,
    required this.strokeWidth,
    required this.padding,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: CustomPaint(
        size: Size(width, height),
        painter: CustomLinePainter(
          axis: axis,
          color: color,
          dashSpace: dashSpace,
          dashWidth: dashWidth,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
