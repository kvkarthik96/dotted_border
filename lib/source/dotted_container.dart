import 'package:dotted_separator/dotted_separator.dart';

/// A widget that creates a container with a dotted decoration.
///
/// The [DottedContainer] widget allows you to create a container with a customizable dotted decoration.

/// Basic Dotted Container properties.
/// * [height]
/// * [width]
/// * [linePosition]
/// * [shape]
/// * [color]
/// * [borderRadius]
/// * [dash]
/// * [strokeWidth]
/// * [child]
/// * [padding]
/// * [margin]
/// * [fillColor]
/// * [decorationImage]
class DottedContainer extends StatelessWidget {
  /// [height] defines height of the container.
  final double height;

  /// [width] defines the width of the container.
  /// If [width] is [double.infinity], get the maximum value of the parent widget.
  final double width;

  /// An enumeration that defines the position of the dotted line.
  /// The [linePosition] values can be [LinePosition.left], [LinePosition.right], [LinePosition.top] or [LinePosition.bottom].
  /// Default [linePosition] value is [LinePosition.bottom].
  final LinePosition linePosition;

  /// An enumeration that defines the shape of the dotted decoration.
  /// The [shape] values can be [Shape.line], [Shape.box], [Shape.circle].
  /// Default [shape] value is [Shape.line].
  final Shape shape;

  /// [color] defines the color of the dotted decoration.
  /// Default [color] value is [Colors.black].
  final Color color;

  /// [borderRadius] defines the border radius of the container.
  /// [borderRadius] is ignored if [shape] is [Shape.circle].
  /// Default [borderRadius] value is [BorderRadius.zero].
  final BorderRadius borderRadius;

  /// [dash] defines the dash pattern for the dotted decoration.
  /// Default [dash] value is [4, 4].
  final List<int> dash;

  /// [strokeWidth] defines the stroke width of the dotted decoration.
  /// Default [strokeWidth] value is [1].
  final double strokeWidth;

  /// The [child] widget to be placed inside the container.
  final Widget? child;

  /// [padding] defines the padding of the dotted container.
  final EdgeInsetsGeometry? padding;

  /// [margin] defines the margin of the dotted container.
  final EdgeInsetsGeometry? margin;

  /// The fill color of the container.
  /// [fillColor] defines the color of the [child] widget.
  /// [fillColor] is ignored when the [decorationImage] is not null.
  /// Default [fillColor] value is [Colors.transparent].
  final Color? fillColor;

  /// The decoration image for the container.
  /// [decorationImage] defines the decoration widget of the [child] widget.
  /// [fillColor] is ignored when the [decorationImage] is not null.
  final DecorationImage? decorationImage;

  const DottedContainer(
      {super.key,
      required this.height,
      required this.width,
      this.linePosition = LinePosition.bottom,
      this.shape = Shape.line,
      this.color = Colors.black,
      this.borderRadius = BorderRadius.zero,
      this.dash = const [4, 4],
      this.strokeWidth = 1,
      this.child,
      this.padding,
      this.margin,
      this.fillColor = Colors.transparent,
      this.decorationImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: DottedDecoration(
        shape: shape,
        linePosition: LinePosition.bottom,
        color: color,
        dash: dash,
        borderRadius: borderRadius,
        strokeWidth: strokeWidth,
      ),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: shape == Shape.circle
                  ? BorderRadius.circular(height)
                  : borderRadius,
              color: fillColor,
              image: decorationImage),
          child: child),
    );
  }
}
