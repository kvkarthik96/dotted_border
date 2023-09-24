import 'package:dotted_separator/dotted_separator.dart';

class DottedContainer extends StatelessWidget {
  final double height;
  final double width;
  final LinePosition linePosition;
  final Shape shape;
  final Color color;
  final BorderRadius borderRadius;
  final List<int> dash;
  final double strokeWidth;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? fillColor;
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
