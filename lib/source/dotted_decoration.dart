import 'dart:ui';
import 'package:dotted_separator/dotted_separator.dart';

/// An enumeration that defines the position of the dotted line.
///
/// Use [LinePosition] to specify where the dotted line should be positioned when creating a [DottedDecoration].
/// The [linePosition] values can be [left, top, right, bottom].
enum LinePosition { left, top, right, bottom }

/// An enumeration that defines the shape of the dotted decoration.

/// Use [Shape] to specify the shape of the decoration when creating a [DottedDecoration].

enum Shape { line, box, circle }

/// A decoration class for creating dotted separators and decorations.
///
/// Use [DottedDecoration] to specify the appearance of a dotted separator or decoration

/// Dotted Decoration properties.
/// * [linePosition]
/// * [shape]
/// * [color]
/// * [borderRadius]
/// * [dash]
/// * [padding]
/// * [strokeWidth]

class DottedDecoration extends Decoration {
  /// The [linePosition] values can be [LinePosition.left], [LinePosition.right], [LinePosition.top] or [LinePosition.bottom],
  final LinePosition linePosition;

  /// The [Shape] values can be [Shape.line], [Shape.box], [Shape.circle].
  final Shape shape;

  /// The [color] defines the dashed line color.
  final Color color;

  /// The [borderRadius] defines the radius of the cotainer.
  /// [borderRadius] is igonered when the [shape] is [Shape.circle].
  final BorderRadius borderRadius;

  /// [dash] defines the dash pattern for the container.
  final List<int> dash;

  /// [strokeWidth] defines the stroke width for the container.
  final double strokeWidth;

  /// Creates a [DottedDecoration] with the specified properties.
  const DottedDecoration(
      {required this.shape,
      required this.linePosition,
      required this.color,
      required this.borderRadius,
      required this.dash,
      required this.strokeWidth});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _DottedDecotatorPainter(
        shape, linePosition, color, borderRadius, dash, strokeWidth);
  }
}

/// A custom box painter for drawing dotted separators and decorations.
///
/// Use [_DottedDecoratorPainter] to paint a dotted separator or decoration
/// based on the specified properties.

/// Basic Decoration settings
/// * [linePosition]
/// * [shape]
/// * [color]
/// * [borderRadius]
/// * [strokeWidth]
/// * [dash]
/// * [strokeWidth]

class _DottedDecotatorPainter extends BoxPainter {
  LinePosition linePosition;
  Shape shape;
  Color color;
  BorderRadius borderRadius;
  List<int> dash;
  double strokeWidth;

  /// Creates a [_DottedDecoratorPainter] with the specified properties.
  _DottedDecotatorPainter(this.shape, this.linePosition, this.color,
      this.borderRadius, this.dash, this.strokeWidth);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // Implementation details for drawing the dotted separator or decoration.
    Path outPath = Path();
    if (shape == Shape.line) {
      if (linePosition == LinePosition.left) {
        outPath.moveTo(offset.dx, offset.dy);
        outPath.lineTo(offset.dx, offset.dy + configuration.size!.height);
      } else if (linePosition == LinePosition.top) {
        outPath.moveTo(offset.dx, offset.dy);
        outPath.lineTo(offset.dx + configuration.size!.width, offset.dy);
      } else if (linePosition == LinePosition.right) {
        outPath.moveTo(offset.dx + configuration.size!.width, offset.dy);
        outPath.lineTo(offset.dx + configuration.size!.width,
            offset.dy + configuration.size!.height);
      } else {
        outPath.moveTo(offset.dx, offset.dy + configuration.size!.height);
        outPath.lineTo(offset.dx + configuration.size!.width,
            offset.dy + configuration.size!.height);
      }
    } else if (shape == Shape.box) {
      RRect rect = RRect.fromLTRBAndCorners(
        offset.dx,
        offset.dy,
        offset.dx + configuration.size!.width,
        offset.dy + configuration.size!.height,
        bottomLeft: borderRadius.bottomLeft,
        bottomRight: borderRadius.bottomRight,
        topLeft: borderRadius.topLeft,
        topRight: borderRadius.topRight,
      );
      outPath.addRRect(rect);
    } else if (shape == Shape.circle) {
      outPath.addOval(Rect.fromLTWH(offset.dx, offset.dy,
          configuration.size!.width, configuration.size!.height));
    }

    PathMetrics metrics = outPath.computeMetrics(forceClosed: false);

    Path drawPath = Path();

    for (PathMetric me in metrics) {
      double totalLength = me.length;
      int index = -1;

      for (double start = 0; start < totalLength;) {
        double to = start + dash[(++index) % dash.length];
        to = to > totalLength ? totalLength : to;
        bool isEven = index % 2 == 0;
        if (isEven) {
          drawPath.addPath(
              me.extractPath(start, to, startWithMoveTo: true), Offset.zero);
        }
        start = to;
      }
    }

    canvas.drawPath(
        drawPath,
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.fill);
  }
}
