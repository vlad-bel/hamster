import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/side_menu/side_menu_header.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/top_menu/menu_dropdown/cubit/menu_dropdown_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/top_menu/menu_dropdown/menu_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuUserData extends StatefulWidget {
  const MenuUserData({
    Key? key,
    this.imageString,
    required this.userName,
  }) : super(key: key);

  final String? imageString;
  final String userName;

  @override
  State<MenuUserData> createState() => _MenuUserDataState();
}

class _MenuUserDataState extends State<MenuUserData> {
  OverlayEntry? overlayEntry;

  final layerLink = LayerLink();

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          width: 148,
          child: CompositedTransformFollower(
            offset: const Offset(-60, 48),
            showWhenUnlinked: false,
            link: layerLink,
            child: MenuDropDown(
              overlayEntry: overlayEntry!,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: BlocBuilder<MenuDropdownCubit, MenuDropdownState>(
        bloc: getIt.get<MenuDropdownCubit>(),
        builder: (context, state) {
          final cubit = getIt.get<MenuDropdownCubit>();
          return CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              overlayEntry ??= _createOverlayEntry();

              state.when(
                close: () {
                  cubit.openMenu();
                  Overlay.of(context)!.insert(overlayEntry!);
                },
                open: () {
                  cubit.closeMenu();
                  overlayEntry!.remove();
                },
              );
            },
            child: Row(
              children: [
                const Avatar(
                  placeholderImage: Assets.imagesProfileIconGrey,
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.userName,
                  style: inter14,
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: lynch,
                  size: 16,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
