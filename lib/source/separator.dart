library dotted_separator;

import 'package:dotted_separator/dotted_separator.dart';

class DottedSeparator extends StatelessWidget {
  //The height of the widget.
  final double height;

  //The width of the widget.
  final double width;

  //Axis direction of the widget.
  final Axis axis;

  // Width of the dash
  final double dashWidth;

  // The space between two dash.
  final double dashSpace;

  // The thickness of a single dash.
  final double strokeWidth;

  // The color of a dash.
  final Color dashColor;

  // Widget padding
  final EdgeInsetsGeometry padding;

  //

  const DottedSeparator({
    Key? key,
    required this.height,
    required this.width,
    required this.axis,
    this.dashWidth = 5,
    this.dashSpace = 3,
    this.strokeWidth = 1.5,
    this.dashColor = Colors.black,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: CustomPaint(
        size: Size(width, height),
        painter: CustomLinePainter(
          axis: axis,
          color: dashColor,
          dashSpace: dashSpace,
          dashWidth: dashWidth,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
