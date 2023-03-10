import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BranchTableControlPanel extends StatelessWidget {
  const BranchTableControlPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppLocale.of(context).branch_profile,
          style: inter16SemiBold,
        ),
        const Spacer(),
        ControlPanelButton(
          image: Assets.imagesSearch,
          onPress: () {},
        ),
        ControlPanelButton(
          image: Assets.imagesFilter,
          onPress: () {},
        ),
        ControlPanelButton(
          image: Assets.imagesMenu,
          onPress: () {},
        ),
        // Expanded(child: child)
      ],
    );
  }
}

class ControlPanelButton extends StatelessWidget {
  const ControlPanelButton({
    Key? key,
    required this.image,
    required this.onPress,
  }) : super(key: key);
  final String image;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: MaterialButton(
        onPressed: onPress,
        child: SvgPicture.asset(image),
      ),
    );
  }
}
