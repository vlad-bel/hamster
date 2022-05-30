import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/common/widgets/dash_bordered_container/dash_bordered_container_widget.dart';
import 'package:flutter/material.dart';

class AppAddLogoWidget extends StatelessWidget {
  const AppAddLogoWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppDashBorderedContainer(
      boxShape: BoxShape.circle,
      child: Container(
        height: 200,
        width: 200,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(
            100,
          ),
          onTap: onPressed,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add_circle,
                  color: denim1,
                ),
                const SizedBox(width: 4),
                Text(
                  AppLocale.of(context).add_logo,
                  style: inter14.copyWith(
                    color: denim1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
