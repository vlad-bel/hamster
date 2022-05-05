import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_state.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/side_menu/side_menu.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/widget/top_menu/top_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    Key? key,
    required this.initialTabPage,
  }) : super(key: key);

  final int initialTabPage;

  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);
    return BlocProvider<DashboardCubit>(
      create: (_) => getIt.get<DashboardCubit>(),
      child: Scaffold(
        body: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            return Row(
              children: [
                SideMenu(controller: tabPage.controller),
                Expanded(
                  child: Column(
                    children: [
                      const TopMenu(),
                      Expanded(
                        child: IndexedStack(
                          index: tabPage.index,
                          children: tabPage.stacks
                              .map(
                                (stack) => PageStackNavigator(
                                  stack: stack,
                                ),
                              )
                              .toList(),
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
