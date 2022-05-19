import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///cells for showing status of the concrete company or branch
class BaseStatusCell extends StatelessWidget {
  const BaseStatusCell({
    Key? key,
    required this.icon,
    required this.name,
    required this.padding,
  }) : super(key: key);
  final Widget icon;
  final double padding;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(width: padding),
        Text(
          name,
          style: inter14,
        ),
      ],
    );
  }
}

///show verifiend status
class VerifiedStatusCell extends StatelessWidget {
  const VerifiedStatusCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseStatusCell(
      icon: SvgPicture.asset(
        'images/verified.svg',
        width: 22,
        height: 22,
      ),
      name: tr('verified'),
      padding: 8,
    );
  }
}

///shows visible/invisible status
class VisibleStatusCell extends StatelessWidget {
  const VisibleStatusCell({
    Key? key,
    required this.visible,
  }) : super(key: key);

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return BaseStatusCell(
      icon: SvgPicture.asset(
        visible ? 'images/visible.svg' : 'images/invisible.svg',
        width: 22,
        height: 22,
      ),
      name: visible ? tr('visible') : tr('not_visible'),
      padding: 8,
    );
  }
}

///shows company fill completion status
class DataCompleteStatusCell extends StatelessWidget {
  const DataCompleteStatusCell({
    Key? key,
    required this.value,
  }) : super(key: key);
  final int value;

  @override
  Widget build(BuildContext context) {
    return BaseStatusCell(
      icon: Container(
        decoration: BoxDecoration(
          color: denim.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        padding: const EdgeInsets.only(
          left: 7,
          right: 7,
          top: 3,
          bottom: 5,
        ),
        child: Text(
          '$value%',
          style: inter14.copyWith(
            color: denim,
          ),
        ),
      ),
      name: tr('data_incomplete'),
      padding: 12,
    );
  }
}
