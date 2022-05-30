import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/presentation/common/widgets/bordered_container/bordered_container.dart';
import 'package:flutter/material.dart';

class BorderedEditContainer extends StatelessWidget {
  const BorderedEditContainer({
    Key? key,
    required this.onEditTap,
    required this.title,
    required this.child,
  }) : super(key: key);

  final VoidCallback onEditTap;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final editButton = Transform.translate(
      offset: Offset(5, -10),
      child: Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          width: 25,
          height: 25,
          child: RawMaterialButton(
            onPressed: onEditTap,
            fillColor: razzmatazz,
            shape: CircleBorder(),
            child: Icon(Icons.edit_outlined, color: white, size: 15),
          ),
        ),
        // Icon(Icons.edit),
      ),
    );

    return Stack(
      children: [
        BorderedContainer(
          title: title,
          child: child,
        ),
        editButton,
      ],
    );
  }
}
