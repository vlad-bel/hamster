import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/dashboard/change_password/cubit/change_password_cubit.dart';
import 'package:business_terminal/presentation/dashboard/change_password/cubit/change_password_state.dart';
import 'package:business_terminal/presentation/dashboard/change_password/view/change_password_view.dart';
import 'package:business_terminal/presentation/dashboard/change_password/view/password_changed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ChangePasswordPage extends StatelessWidget {
  static const path = '/change_password';

  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangePasswordCubit>(
      create: (context) => GetIt.instance.get(),
      child: OnboardingBackground(
        showLanguageDropdown: false,
        children: BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
          builder: (context, state) => state.maybeMap(
            success: (_) => const PasswordChangedWidget(),
            orElse: () => const ChangePasswordView(),
          ),
        ),
      ),
    );
  }
}
