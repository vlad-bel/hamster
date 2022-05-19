library dash_bordered_container;

import 'package:business_terminal/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

part 'dash_bordered_container_painter.dart';

/// Widget that draws dashed border to his [child]
class AppDashBorderedContainer extends StatelessWidget {
  const AppDashBorderedContainer({
    Key? key,
    required this.child,
    this.dashColor = solitude1,
    this.borderColor = white,
    this.borderRadius = 16.0,
    this.borderType = BorderType.circle,
    this.boxShape = BoxShape.rectangle,
  }) : super(key: key);

  /// Color of spacing between [child] and dash
  final Color borderColor;

  /// Border radius of dash border
  final double borderRadius;

  /// Shape of container above [child]
  final BoxShape boxShape;

  /// Child widget
  final Widget child;

  /// Color of dash borders
  final Color dashColor;

  /// Type of dash borders
  final BorderType borderType;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashPainter(
        borderType: borderType,
        radius: Radius.circular(
          borderRadius,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          shape: boxShape,
          border: Border.all(
            width: 5,
            color: borderColor,
          ),
          color: dashColor,
        ),
        child: child,
      ),
    );
  }
}
