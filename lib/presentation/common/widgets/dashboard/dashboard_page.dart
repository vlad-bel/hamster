import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_state.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/side_menu/side_menu.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/top_menu/top_menu.dart';
import 'package:business_terminal/presentation/dashboard/account_verification/view/dashboard_account_verification.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/view/profile_viewing.dart';
import 'package:business_terminal/presentation/navigation/unknown_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const finance1Path = '/finance/finance';
const finance2Path = '/finance/finance1';
const accountVerificationPath = '/administration/account-verification';
const myCompanyPath = '/administration/my-company';
const myCompanyEditPath = '/administration/my-company/edit';
const myCompanyEditAddLogoPath = '/administration/my-company/edit/add-logo';

const userManagementPath = '/administration/user-management';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    Key? key,
    required this.initialPagePath,
    required this.initialPageIndex,
    this.isBlockFinance,
  }) : super(key: key);

  static const String path = '/dashboard';

  final String initialPagePath;
  final int initialPageIndex;

  ///need to bloc finance menu
  final bool? isBlockFinance;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

final navigatorKeys = <int, GlobalKey<NavigatorState>>{
  0: GlobalKey<NavigatorState>(),
  1: GlobalKey<NavigatorState>(),
};

class _DashboardPageState extends State<DashboardPage> {
  ///TODO replace to cubit
  late int pageIndex;
  late String selectedPage;

  @override
  void initState() {
    super.initState();
    selectedPage = widget.initialPagePath;
    pageIndex = widget.initialPageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return state.whenOrNull(
                init: (stateObject) {
                  return Row(
                    children: [
                      SideMenu(
                        repCompany: stateObject.repCompany,
                        navigateTo: (index, routeName) {
                          setState(() {
                            pageIndex = index;
                            selectedPage = routeName;
                          });
                        },
                        selectedIndex: pageIndex,
                        selectedPage: selectedPage,
                        isBlockFinance: widget.isBlockFinance,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            TopMenu(
                              selectedPage: selectedPage,
                            ),
                            Expanded(
                              child: IndexedStack(
                                index: pageIndex,
                                children: [
                                  NavigatorPage(
                                    navigatorKey: navigatorKeys[0]!,
                                    initialRoute: finance1Path,
                                    onGenerateRoute: (RouteSettings settings) {
                                      Widget? page;
                                      switch (settings.name) {
                                        case finance1Path:
                                          page = Container(
                                            color: solitude1,
                                            child: Center(
                                              child: Text(settings.name!),
                                            ),
                                          );
                                          break;
                                        case finance2Path:
                                          page = Container(
                                            color: solitude1,
                                            child: Center(
                                              child: Text(settings.name!),
                                            ),
                                          );
                                          break;
                                        default:
                                          page = Container(
                                            color: solitude1,
                                            child: Center(
                                              child: Text(settings.name!),
                                            ),
                                          );
                                          break;
                                      }
                                      return PageRouteBuilder<void>(
                                        transitionDuration: Duration.zero,
                                        reverseTransitionDuration:
                                            Duration.zero,
                                        pageBuilder: (context, anim1, anim2) {
                                          return UnknownPage(
                                    path: settings.name ?? 'unknown path',
                                  );
                                        },
                                        settings: settings,
                                      );
                                    },
                                  ),
                                  NavigatorPage(
                                    navigatorKey: navigatorKeys[1]!,
                                    initialRoute: accountVerificationPath,
                                    onGenerateRoute: (RouteSettings settings) {
                                      Widget? page;
                                      switch (settings.name) {
                                        case accountVerificationPath:
                                          page =
                                              const DashboardAccountVerificationPage();
                                          break;
                                        case myCompanyPath:
                                          page = const ProfileViewing();
                                          break;
                                        case userManagementPath:
                                          page = Container(
                                            color: solitude1,
                                            child: Center(
                                              child: Text(settings.name!),
                                            ),
                                          );
                                          break;
                                      }

                              return PageRouteBuilder<void>(
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                                pageBuilder: (context, anim1, anim2) {
                                  return page ??
                                      UnknownPage(
                                        path: settings.name ?? 'unknown path',
                                      );
                                },
                                settings: settings,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class NavigatorPage extends StatelessWidget {
  const NavigatorPage({
    Key? key,
    required this.navigatorKey,
    required this.onGenerateRoute,
    required this.initialRoute,
  }) : super(key: key);

  final GlobalKey navigatorKey;
  final RouteFactory? onGenerateRoute;
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
