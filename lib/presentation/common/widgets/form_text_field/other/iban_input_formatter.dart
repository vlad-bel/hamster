import 'package:flutter/services.dart';

/// Formats the text adding space between every 4 symbols
class IbanInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Find the position in the string with spaces removed
    final oldOffset = newValue.selection.baseOffset -
        RegExp(' ')
            .allMatches(newValue.text)
            .map((e) => e.start < newValue.selection.baseOffset)
            .fold(0, (x, y) => x + (y ? 1 : 0));
    final splitText = _splitInGroupsOfFour(newValue.text);
    // Find the new position by considering spaces inserted on the left
    var newOffset = oldOffset;
    for (var i = 0; i < newOffset; i += 1) {
      if (splitText[i] == ' ') {
        newOffset += 1;
      }
    }

    return TextEditingValue(
      text: splitText,
      selection: TextSelection.collapsed(
        offset: newOffset.toInt(),
      ),
    );
  }

  String _splitInGroupsOfFour(String input) {
    final segments = input.replaceAll(RegExp(' '), '').split('');
    const groupSize = 4;
    var added = 0;
    final it = segments.iterator;
    final buffer = StringBuffer();
    while (it.moveNext()) {
      if (added != 0 && added % groupSize == 0) {
        buffer.write(' ');
      }
      added++;
      buffer.write(it.current);
    }
    return buffer.toString();
  }
}
