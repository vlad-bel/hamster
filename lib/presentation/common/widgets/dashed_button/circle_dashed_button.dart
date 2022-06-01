import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CircleDashedButton extends StatelessWidget {
  const CircleDashedButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: DottedBorder(
            radius: const Radius.circular(4),
            dashPattern: const [7, 7],
            color: lynch.withOpacity(0.3),
            borderType: BorderType.Circle,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Ink(
                decoration: BoxDecoration(
                  color: denim.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
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
                        label,
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
