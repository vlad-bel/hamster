import 'package:business_terminal/presentation/common/widgets/horizontal_line_short_grey.dart';
import 'package:business_terminal/presentation/common/widgets/text_title.dart';
import 'package:flutter/material.dart';

class OnboardingContainerTitleSubtitle extends StatelessWidget {
  const OnboardingContainerTitleSubtitle({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.children,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextTitle(title: title),
              Container(height: 18),
              const HorizontalLineShortGrey(),
              Container(height: 18),
              Text(subtitle),
              Container(height: 25),
              ...children
            ],
          ),
        ),
      ),
    );
  }
}
