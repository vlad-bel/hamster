import 'package:business_terminal/config/styles.dart';
import 'package:flutter/material.dart';

class BreadCrumbs extends StatelessWidget {
  const BreadCrumbs({
    Key? key,
    required this.basePathName,
    required this.selectedPage,
  }) : super(key: key);
  final String basePathName;
  final String selectedPage;

  @override
  Widget build(BuildContext context) {
    final currentPath = selectedPage.split('/');
    final currentLastPath = currentPath.last;

    final crumbs = <Widget>[
      Text(
        basePathName,
        style: inter10,
      ),
    ];

    for (var i = 0; i < currentPath.length; i++) {
      crumbs.add(
        Text(
          currentPath[i],
          style: inter10,
        ),
      );
      if (i < currentPath.length - 1) {
        crumbs.add(
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 8,
            ),
          ),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          currentLastPath,
          style: inter24SemiBold,
        ),
        const SizedBox(height: 8),
        Row(
          children: crumbs,
        ),
      ],
    );
  }
}
