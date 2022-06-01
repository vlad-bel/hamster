import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class RectDashedButton extends StatelessWidget {
  const RectDashedButton({
    Key? key,
    required this.onTap,
    this.child,
  }) : super(key: key);

  final VoidCallback onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: DottedBorder(
            radius: const Radius.circular(6),
            dashPattern: const [7, 7],
            color: lynch.withOpacity(0.3),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Ink(
                decoration: BoxDecoration(
                  color: denim.withOpacity(0.1),
                ),
                child: child ??
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: denim,
                            ),
                            padding: const EdgeInsets.all(2),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: white,
                                size: 22,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            AppLocale.current.add_branch_picture,
                            style: inter14.copyWith(
                              color: denim,
                            ),
                          ),
                        ],
                      ),
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
