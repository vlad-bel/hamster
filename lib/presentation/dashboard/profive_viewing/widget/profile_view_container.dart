import 'package:business_terminal/config/colors.dart';
import 'package:flutter/material.dart';

class ProfileViewContainer extends StatelessWidget {
  const ProfileViewContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      padding: const EdgeInsets.symmetric(
        vertical: 46,
        horizontal: 50,
      ),
      child: child,
    );
  }
}
