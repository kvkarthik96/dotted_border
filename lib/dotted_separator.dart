library dotted_separator;

import 'package:flutter/material.dart';

class DottedSeparator extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double dashWidth;

  const DottedSeparator(
      {super.key, this.padding, this.color, this.dashWidth = 3.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          final dashCount = (boxWidth / (2 * dashWidth)).floor();
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: 2.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color ?? Colors.black),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
