import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DashedButton extends StatelessWidget {
  const DashedButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: DottedBorder(
          radius: const Radius.circular(4),
          dashPattern: const [7, 7],
          color: lynch.withOpacity(0.3),
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Ink(
            child: Expanded(
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
