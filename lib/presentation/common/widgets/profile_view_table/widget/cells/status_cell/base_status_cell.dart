import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/image/image_paths.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/generated/assets.dart';
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
        Assets.imagesVerified,
        width: 22,
        height: 22,
      ),
      name: AppLocale.of(context).verified,
      padding: 8,
    );
  }
}

///show verifiend status
class AwaitingVerificationCell extends StatelessWidget {
  const AwaitingVerificationCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseStatusCell(
      icon: SvgPicture.asset(
        ImagePaths.svg(SvgPaths.testAlert),
        width: 22,
        height: 22,
      ),
      name: AppLocale.of(context).waiting_for_verification,
      padding: 8,
    );
  }
}

///show verifiend status
class DeclinedCell extends StatelessWidget {
  const DeclinedCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseStatusCell(
      icon: SvgPicture.asset(
        ImagePaths.svg(SvgPaths.testAlert),
        width: 22,
        height: 22,
      ),
      name: AppLocale.of(context).declined,
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
        visible ? Assets.imagesVisible : Assets.imagesInvisible,
        width: 22,
        height: 22,
      ),
      name: visible
          ? AppLocale.of(context).visible
          : AppLocale.of(context).not_visible,
      padding: 8,
    );
  }
}

class UnknownStatusCell extends StatelessWidget {
  const UnknownStatusCell({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseStatusCell(
      icon: SvgPicture.asset(
        Assets.imagesInvisible,
        width: 22,
        height: 22,
      ),
      name: 'Unknown status',
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
      name: AppLocale.of(context).data_incomplete,
      padding: 12,
    );
  }
}
