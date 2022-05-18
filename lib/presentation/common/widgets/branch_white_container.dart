import 'package:business_terminal/config/colors.dart';
import 'package:flutter/material.dart';

class BranchProfileContainerWhite extends StatelessWidget {
  const BranchProfileContainerWhite({
    Key? key,
    required this.body,
    this.headerLeft,
    this.headerRight,
    this.width = 850,
  }) : super(key: key);

  final Widget? headerLeft;
  final Widget? headerRight;
  final Widget body;
  final double width;

  @override
  Widget build(BuildContext context) {
    const boxDecoration = BoxDecoration(
      color: white,
    );
    const padding = EdgeInsets.only(
      top: 45,
      left: 50,
      right: 50,
      bottom: 50,
    );

    return Center(
      child: Container(
        width: width,
        padding: padding,
        decoration: boxDecoration,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  headerLeft ?? const SizedBox(),
                  headerRight ?? const SizedBox(),
                ],
              ),
            ),
            SizedBox(height: 20),
            body,
          ],
        ),
      ),
    );
  }
}
