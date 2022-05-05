import 'package:business_terminal/config/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class BreadCrumbs extends StatelessWidget {
  const BreadCrumbs({
    Key? key,
    required this.basePathName,
  }) : super(key: key);
  final String basePathName;

  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);
    final currentPath = tabPage.page.paths[tabPage.index].split('/');
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
          tr(currentPath[i]),
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
          tr(currentLastPath),
          style: inter24SemiBold,
        ),
        SizedBox(height: 8),
        Row(
          children: crumbs,
        ),
      ],
    );
  }
}