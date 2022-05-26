import 'dart:math';

import 'package:flutter/services.dart';

class DateTextFormatter extends TextInputFormatter {
  static const _maxChars = 4;
  static const _separator = ':';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = _format(newValue.text);
    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  String _format(String value) {
    final cleanedValue = value.replaceAll(_separator, '');
    final buffer = StringBuffer();

    for (var i = 0; i < min(cleanedValue.length, _maxChars); i++) {
      buffer.write(cleanedValue[i]);
      if ((i == 1) && i != cleanedValue.length - 1) {
        buffer.write(_separator);
      }
    }

    return buffer.toString();
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
