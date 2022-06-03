import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/side_menu/side_menu_header.dart';
import 'package:flutter/material.dart';

class PersonalDataAvatarContainer extends StatelessWidget {
  static const _kAvatarRadius = 50.0;

  final Widget child;
  final String imageUrl;
  final VoidCallback onAvatarClicked;

  const PersonalDataAvatarContainer(
      {Key? key,
      required this.child,
      required this.imageUrl,
      required this.onAvatarClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: _kAvatarRadius),
            child: Container(
              color: white,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: _kAvatarRadius, right: 24, left: 24),
                child: child,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: _AvatarView(
              radius: _kAvatarRadius,
              imageUrl: imageUrl,
              onClicked: onAvatarClicked,
            ),
          ),
        ],
      ),
    );
  }
}

class _AvatarView extends StatelessWidget {
  final double radius;
  final String imageUrl;
  final VoidCallback onClicked;

  const _AvatarView({
    Key? key,
    required this.radius,
    required this.imageUrl,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: SizedBox(
        width: radius * 2,
        height: radius * 2,
        child: Stack(
          children: [
            Avatar(
              width: radius * 2,
              height: radius * 2,
              image: imageUrl,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: razzmatazz,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.edit_outlined,
                    color: white,
                    size: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
