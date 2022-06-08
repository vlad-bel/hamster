import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/domain/model/file/app_image.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/side_menu/side_menu_header.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PersonalDataAvatarContainer extends StatelessWidget {
  static const _kAvatarRadius = 50.0;

  final Widget child;
  final AppImage? image;
  final VoidCallback onAvatarClicked;

  const PersonalDataAvatarContainer(
      {Key? key,
      required this.child,
      required this.image,
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
              image: image,
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
  final AppImage? image;
  final VoidCallback onClicked;

  const _AvatarView({
    Key? key,
    required this.radius,
    required this.image,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = radius * 2;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onClicked,
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          children: [
            CircleAvatar(
              radius: radius,
              foregroundImage: image?.when(
                    network: CachedNetworkImageProvider.new,
                    file: (appFile) => MemoryImage(appFile.bytes!),
                  ) ??
                  const AssetImage(Assets.imagesProfileIconGrey),
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
