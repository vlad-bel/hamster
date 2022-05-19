import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/presentation/app/view/app.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/top_menu/menu_dropdown/cubit/menu_dropdown_cubit.dart';
import 'package:business_terminal/presentation/login/view/login_page.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/app_state_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuDropDown extends StatelessWidget {
  MenuDropDown({
    Key? key,
    required this.overlayEntry,
  }) : super(key: key);
  final OverlayEntry overlayEntry;

  final cubit = getIt.get<MenuDropdownCubit>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 6,
            color: Colors.black.withOpacity(0.2),
          ),
        ],
      ),
      child: CustomPaint(
        painter: DropdownCustomPainter(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Text(
                  tr('user_account'),
                  style: inter14Medium,
                ),
                onPressed: () {
                  close();
                },
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Text(
                  tr('change_password'),
                  style: inter14Medium,
                ),
                onPressed: () {
                  close();
                },
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Text(
                  tr('settings'),
                  style: inter14Medium,
                ),
                onPressed: () {
                  close();
                },
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Text(
                  tr('help_center'),
                  style: inter14Medium,
                ),
                onPressed: () {
                  close();
                },
              ),
              const SizedBox(height: 4),
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Text(
                  tr('cancel_register'),
                  style: inter14Medium.copyWith(color: razzmatazz),
                ),
                onPressed: () {
                  close();
                  logout(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void logout(BuildContext context) {
    context.read<DashboardCubit>().logout();
    context.read<AppStateCubit>().goToUnauthZone(LoginPage.path);

    unauthNavigatorKey.currentState!.pushNamedAndRemoveUntil(
      LoginPage.path,
      (predicate) => predicate.isFirst,
    );
  }

  void close() {
    overlayEntry.remove();
    cubit.closeMenu();
  }
}

class DropdownCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final strokePaint = Paint()
      ..color = lynch
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final fillPaint = Paint()
      ..color = white
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    final rectPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 7.5, size.width, size.height),
          const Radius.circular(3),
        ),
      );

    final trianglePath = Path()
      ..addPath(
        getTrianglePath(15, 7),
        Offset(size.width / 2 - 7, 0),
      );

    final smallRectPath = Path()
      ..addRect(
        Rect.fromLTWH(size.width / 2 - 7, 7, 15.3, 5),
      );

    canvas
      ..drawPath(
        rectPath,
        strokePaint,
      )
      ..drawPath(
        rectPath,
        fillPaint,
      )
      ..drawPath(
        trianglePath,
        strokePaint,
      )
      ..drawPath(
        trianglePath,
        fillPaint,
      )
      ..drawPath(
        smallRectPath,
        fillPaint,
      );
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
