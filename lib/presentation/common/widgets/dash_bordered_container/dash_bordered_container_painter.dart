// ignore_for_file: unused_element

part of dash_bordered_container;

/// Border types to draw Circle or Rect forms
enum BorderType { circle, rRect, rect, oval }

/// Painter of dash border
class _DashPainter extends CustomPainter {
  _DashPainter({
    this.strokeWidth = 1,
    this.dashPattern = const <double>[
      7,
      7,
    ],
    this.color = lynch,
    this.borderType = BorderType.rect,
    this.radius = Radius.zero,
    this.strokeCap = StrokeCap.butt,
    this.customPath,
    this.opacity = 0.3,
  }) : assert(
          dashPattern.isNotEmpty,
          'Dash Pattern cannot be empty',
        );

  final Path Function(Size)? customPath;

  /// Border types to draw Circle or Rect forms
  final BorderType borderType;

  /// Color of dash border
  final Color color;

  /// Pattern of dashes [border, gap]
  final List<double> dashPattern;

  /// Opacity of dash border
  final double opacity;

  /// A radius for either circular or elliptical shapes of dashed border.
  final Radius radius;

  /// Styles to use for line endings.
  final StrokeCap strokeCap;

  /// Width of dash border stroke
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = strokeWidth
      ..color = color.withOpacity(opacity)
      ..strokeCap = strokeCap
      ..style = PaintingStyle.stroke;

    Path _path;
    if (customPath != null) {
      _path = dashPath(
        customPath!(size),
        dashArray: CircularIntervalList(dashPattern),
      );
    } else {
      _path = _getPath(size);
    }

    canvas.drawPath(_path, paint);
  }

  @override
  bool shouldRepaint(_DashPainter oldDelegate) {
    return oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.color != color ||
        oldDelegate.dashPattern != dashPattern ||
        oldDelegate.borderType != borderType;
  }

  /// Returns a [Path] based on the the [borderType] parameter
  Path _getPath(Size size) {
    Path path;
    switch (borderType) {
      case BorderType.circle:
        path = _getCirclePath(size);
        break;
      case BorderType.rRect:
        path = _getRRectPath(size, radius);
        break;
      case BorderType.rect:
        path = _getRectPath(size);
        break;
      case BorderType.oval:
        path = _getOvalPath(size);
        break;
    }

    return dashPath(path, dashArray: CircularIntervalList(dashPattern));
  }

  /// Returns a circular path of [size]
  Path _getCirclePath(Size size) {
    final w = size.width;
    final h = size.height;
    final s = size.shortestSide;

    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            w > s ? (w - s) / 2 : 0,
            h > s ? (h - s) / 2 : 0,
            s,
            s,
          ),
          Radius.circular(s / 2),
        ),
      );
  }

  /// Returns a Rounded Rectangular Path with [radius] of [size]
  Path _getRRectPath(Size size, Radius radius) {
    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            0,
            0,
            size.width,
            size.height,
          ),
          radius,
        ),
      );
  }

  /// Returns a path of [size]
  Path _getRectPath(Size size) {
    return Path()
      ..addRect(
        Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ),
      );
  }

  /// Return an oval path of [size]
  Path _getOvalPath(Size size) {
    return Path()
      ..addOval(
        Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ),
      );
  }
}
