import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:flutter/material.dart';

class CodeVerificationError extends StatelessWidget {
  const CodeVerificationError({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.error_outline_rounded,
          color: razzmatazz,
        ),
        const SizedBox(width: 10),

        Text(
          errorMessage,
          style: inter14.copyWith(
            color: razzmatazz,
          ),
        ),
        // if(!hasError)
      ],
    );
  }
}
