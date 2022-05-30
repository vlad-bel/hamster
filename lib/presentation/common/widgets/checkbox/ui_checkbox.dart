import 'package:business_terminal/presentation/common/widgets/checkbox/other/position.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class UiCheckbox extends StatelessWidget {
  const UiCheckbox({
    Key? key,
    required this.name,
    this.title,
    this.position,
  }) : super(key: key);

  /// Position for aligning checkbox widget
  final Position? position;
  final Widget? title;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: position?.toOffset() ?? Offset.zero,
      child: ReactiveCheckboxListTile(
        formControlName: name,
        title: title,
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
