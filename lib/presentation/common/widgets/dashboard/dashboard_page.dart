import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_state.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/side_menu/side_menu.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/top_menu/top_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

final navigatorKeys = <int, GlobalKey<NavigatorState>>{
  0: GlobalKey<NavigatorState>(),
  1: GlobalKey<NavigatorState>(),
};

class _DashboardPageState extends State<DashboardPage> {
  ///TODO replace to cubit
  int _pageIndex = 0;
  String selectedPage = '/finance/finance1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return !await Navigator.maybePop(
            navigatorKeys[_pageIndex]!.currentState!.context,
          );
        },
        child: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            return Row(
              children: [
                SideMenu(
                  navigateTo: (index, routeName) {
                    setState(() {
                      _pageIndex = index;
                      selectedPage = routeName;
                    });
                  },
                  selectedIndex: _pageIndex,
                  selectedPage: selectedPage,
                ),
                Expanded(
                  child: Column(
                    children: [
                      TopMenu(
                        selectedPage: selectedPage,
                      ),
                      Expanded(
                        child: IndexedStack(
                          index: _pageIndex,
                          children: [
                            NavigatorPage(
                              navigatorKey: navigatorKeys[0]!,
                              initialRoute: '/finance/finance1',
                              onGenerateRoute: (RouteSettings settings) {
                                Widget? page;
                                switch (settings.name) {
                                  case '/finance/finance1':
                                    page = Container(
                                      color: solitude1,
                                      child: Center(
                                        child: Text(settings.name!),
                                      ),
                                    );
                                    break;
                                  case '/finance/finance2':
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
                                    return page!;
                                  },
                                  settings: settings,
                                );
                              },
                            ),
                            NavigatorPage(
                              navigatorKey: navigatorKeys[1]!,
                              initialRoute:
                                  '/administration/account-verification',
                              onGenerateRoute: (RouteSettings settings) {
                                Widget? page;
                                switch (settings.name) {
                                  case '/administration/account-verification':
                                    page = Container(
                                      color: solitude1,
                                      child: Center(
                                        child: Text(settings.name!),
                                      ),
                                    );
                                    break;
                                  case '/administration/my-company':
                                    page = Container(
                                      color: solitude1,
                                      child: Center(
                                        child: Text(settings.name!),
                                      ),
                                    );
                                    break;
                                  case '/administration/user-management':
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
                                    return page!;
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
