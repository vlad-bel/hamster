import 'package:flutter/material.dart';

enum Position { left, right, top, bottom }

extension PositionEx on Position {
  /// Evaluate needed offset for translating object in range -6...6
  ///
  /// Currently only for checkbox
  Offset toOffset() {
    double x;
    double y;

    switch (this) {
      case Position.left:
        x = -6;
        y = 0;
        break;
      case Position.right:
        x = 6;
        y = 0;
        break;
      case Position.top:
        x = 0;
        y = -6;
        break;
      case Position.bottom:
        x = 0;
        y = 6;
        break;
    }

    return Offset(x, y);
  }
}
