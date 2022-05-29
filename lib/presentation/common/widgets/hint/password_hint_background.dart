import 'package:flutter/material.dart';

class PasswordHintBackground extends StatelessWidget {
  const PasswordHintBackground({
    Key? key,
    required this.child,
    required this.width,
    required this.height,
  }) : super(key: key);

  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: width,
      // height: height,
      child: Row(
        children: [
          ClipPath(
            clipper: _TriangleClipper(),
            child: Container(
              height: 25,
              width: 15,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              height: height,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: child,
            ),
          )
        ],
      ),
    );
  }
}

class _TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(_TriangleClipper oldClipper) => false;
}
