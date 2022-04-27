import 'package:black_hole_flutter/black_hole_flutter.dart';
import 'package:flutter/material.dart';

class SnackBarManager {
  void showError(BuildContext context, String message) {
    final backgroundColor = Colors.red[300]!;
    const icon = Icons.error;
    const iconColor = Colors.white;
    final errorMessage = 'An error has occurred: $message';

    _showSnackBar(context, errorMessage, backgroundColor, iconColor, icon);
  }

  void showSuccess(BuildContext context, String message) {
    final backgroundColor = Colors.green[700]!;
    const icon = Icons.info;
    const iconColor = Colors.white;

    _showSnackBar(context, message, backgroundColor, iconColor, icon);
  }

  void _showSnackBar(
    BuildContext context,
    String message,
    Color backgroundColor,
    Color iconColor,
    IconData icon,
  ) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    context.showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Row(
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: 6),
            Text(message),
          ],
        ),
      ),
    );
  }
}
