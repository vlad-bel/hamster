import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardTestPage extends StatelessWidget {
  const DashboardTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: solitude1,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                final dashboardCubit = context.read<DashboardCubit>();
                dashboardCubit.increaseCount();
              },
              child: const Icon(
                Icons.add,
                color: white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'increase count',
              style: inter14,
            ),
          ],
        ),
      ),
    );
  }
}