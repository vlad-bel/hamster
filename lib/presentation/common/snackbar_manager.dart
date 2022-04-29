import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

@singleton
class SnackBarManager {
  static void showError(String message) {
    final backgroundColor = Colors.red[300]!;
    const icon = Icons.error;
    const iconColor = Colors.white;
    final errorMessage = 'An error has occurred: $message';

    _showSnackBar(errorMessage, backgroundColor, iconColor, icon);
  }

  static void showSuccess(String message) {
    final backgroundColor = Colors.green[700]!;
    const icon = Icons.info;
    const iconColor = Colors.white;

    _showSnackBar(message, backgroundColor, iconColor, icon);
  }

  static void _showSnackBar(
    String message,
    Color backgroundColor,
    Color iconColor,
    IconData icon,
  ) {
    snackbarKey.currentState?.hideCurrentSnackBar();

    snackbarKey.currentState?.showSnackBar(
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
