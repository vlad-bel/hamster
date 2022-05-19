import 'package:business_terminal/presentation/common/widgets/checkbox/other/position.dart';
import 'package:flutter/material.dart';

class UiCheckbox extends StatelessWidget {
  const UiCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.active = true,
    this.title,
    this.position,
  }) : super(key: key);

  final bool value;
  final bool active;

  /// Position for aligning checkbox widget
  final Position? position;
  final Widget? title;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: position?.toOffset() ?? Offset.zero,
      child: CheckboxListTile(
        value: value,
        title: title,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: active ? onChanged : null,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
