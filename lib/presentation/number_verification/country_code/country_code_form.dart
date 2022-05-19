import 'package:business_terminal/generated/locale_keys.g.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/country_code_selector.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/unauthorize_state.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/call_method_selector_page.dart';
import 'package:business_terminal/presentation/number_verification/country_code/cubit/country_code_cubit.dart';
import 'package:business_terminal/presentation/number_verification/country_code/cubit/widget/country_code_active_button.dart';
import 'package:business_terminal/presentation/number_verification/country_code/cubit/widget/country_code_loading_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

///form for [CountriesListPage]
class ContryCodeForm extends StatelessWidget {
  const ContryCodeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countrySelectorCubit =
        BlocProvider.of<CountryCodeSelectorCubit>(context);
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: tr(LocaleKeys.confirm_number_title),
          subHeader: Text(
            tr(LocaleKeys.select_number_title),
          ),
        ),
        body: ReactiveFormBuilder(
          form: () => countrySelectorCubit.numberForm,
          builder: (
            BuildContext context,
            FormGroup formGroup,
            Widget? child,
          ) {
            return ReactiveFormConsumer(
              builder: (
                BuildContext context,
                FormGroup formGroup,
                Widget? child,
              ) {
                return BlocConsumer<CountryCodeCubit, CountryCodeState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      error: (e) {
                        SnackBarManager.showError(
                          e.response.message.toString(),
                        );
                      },
                      next: (email, phone) {
                        Navigator.of(context).pushNamed(
                          CallMethodSelectorPage.path,
                          arguments: {
                            phoneNumberParam: phone,
                            emailParam: email,
                          },
                        );
                      },
                    );
                  },
                  builder: (context, state) {
                    final contryCodeCubit =
                        BlocProvider.of<CountryCodeCubit>(context);
                    return Column(
                      children: [
                        const SizedBox(height: 28),
                        CountryCodeSelector(
                          cubit: countrySelectorCubit,
                          loading: state is LoadingCountryCodeState,
                        ),
                        const SizedBox(height: 150),
                        state.when(
                          loading: () => const CountryCodeLoadingButton(),
                          init: () => CountryCodeActiveButton(
                            cubit: contryCodeCubit,
                            formGroup: formGroup,
                          ),
                          error: (e) => CountryCodeActiveButton(
                            cubit: contryCodeCubit,
                            formGroup: formGroup,
                          ),
                          next: (email, phone) => CountryCodeActiveButton(
                            cubit: contryCodeCubit,
                            formGroup: formGroup,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
