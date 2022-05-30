import 'dart:math' as math;

import 'package:flutter/material.dart';

class Triangle extends StatelessWidget {
  const Triangle({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ShapesPainter(color),
      child: SizedBox(
        height: 50,
        width: 50,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 16),
            child: Transform.rotate(
              angle: math.pi / 4,
              child: const Text(
                'TriangleShape',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ShapesPainter extends CustomPainter {
  _ShapesPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.height, size.width)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
