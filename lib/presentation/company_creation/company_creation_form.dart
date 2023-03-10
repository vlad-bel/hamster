import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/app/view/app.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/country_selector.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_state.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/company_creation/cubit/company_creation_cubit.dart';
import 'package:business_terminal/presentation/company_creation/cubit/company_creation_state.dart';
import 'package:business_terminal/presentation/login/view/login_page.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/app_state_cubit.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CompanyCreationForm extends StatelessWidget {
  const CompanyCreationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: Padding(
        padding: const EdgeInsets.only(bottom: 120),
        child: OnboardingWhiteContainer(
          header: OnboardingWhiteContainerHeader(
            header: AppLocale.of(context).create_company_profile,
            subHeader: Text(
              AppLocale.of(context).create_company_profile_descr,
              style: inter14,
            ),
          ),
          body: BlocConsumer<CompanyCreationCubit, CompanyCreationState>(
            listener: (context, state) {
              state.whenOrNull(
                success: () {
                  Navigator.of(context).pushNamed('/dashboard');
                },
                error: (e) {
                  SnackBarManager.showError(
                    e.response.error ?? e.response.message as String,
                  );
                },
              );
            },
            builder: (context, companyCreationState) {
              final companyCreationCubit =
                  BlocProvider.of<CompanyCreationCubit>(context);
              var countrySelectorCubit =
                  BlocProvider.of<CountrySelectorCubit>(context);

              return ReactiveFormBuilder(
                form: () => companyCreationCubit.formGroup,
                builder: (
                  BuildContext context,
                  FormGroup formGroup,
                  Widget? child,
                ) {
                  return Column(
                    children: [
                      SizedBox(height: 26),
                      FormTextField(
                        name: CompanyCreationCubit.companyField,
                        hint: AppLocale.of(context).company_hint,
                        label: AppLocale.of(context).company_hint,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 3,
                            child: FormTextField(
                              name: CompanyCreationCubit.streetField,
                              hint: AppLocale.of(context).street_hint,
                              label: AppLocale.of(context).street_hint,
                            ),
                          ),
                          SizedBox(width: 16),
                          Flexible(
                            child: FormTextField(
                              name: CompanyCreationCubit.streetNumberField,
                              hint: AppLocale.of(context).num_hint,
                              label: AppLocale.of(context).num_hint,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: FormTextField(
                              name: CompanyCreationCubit.postcodeField,
                              hint: AppLocale.of(context).post_hint,
                              label: AppLocale.of(context).post_hint,
                            ),
                          ),
                          SizedBox(width: 16),
                          Flexible(
                            flex: 3,
                            child: FormTextField(
                              name: CompanyCreationCubit.cityField,
                              hint: AppLocale.of(context).location_hint,
                              label: AppLocale.of(context).location_hint,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      CountrySelector(
                        cubit: countrySelectorCubit,
                      ),
                      const SizedBox(height: 36),
                      Row(
                        children: [
                          WhiteButton(
                            width: 160,
                            onPressed: () {
                              goBack(context);
                            },
                          ),
                          const Spacer(),
                          BlocBuilder<CountrySelectorCubit,
                              CountrySelectorState>(
                            builder: (context, state) {
                              countrySelectorCubit =
                                  BlocProvider.of<CountrySelectorCubit>(
                                context,
                              );
                              return ReactiveFormConsumer(
                                builder: (context, group, child) {
                                  final selectedCountry =
                                      countrySelectorCubit.state.whenOrNull(
                                    close: (country, _) => country,
                                  );

                                  return ActionButtonBlue(
                                    width: 160,
                                    isEnabled: companyCreationState.when(
                                      init: () {
                                        return selectedCountry != null &&
                                            group.valid;
                                      },
                                      loading: () {
                                        return false;
                                      },
                                      success: () {
                                        return selectedCountry != null &&
                                            group.valid;
                                      },
                                      error: (e) {
                                        return selectedCountry != null &&
                                            group.valid;
                                      },
                                    ),
                                    onPressed: () async {
                                      await companyCreationCubit.createCompany(
                                        selectedCountry!,
                                      );
                                    },
                                    child: companyCreationState.whenOrNull(
                                      loading: () => const SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> goBack(BuildContext context) async {
    final cubit = context.read<CompanyCreationCubit>();
    cubit.logout();
    context.read<AppStateCubit>().goToUnauthZone(LoginPage.path);
    unauthNavigatorKey.currentState!.pushNamedAndRemoveUntil(
      LoginPage.path,
      (predicate) => predicate.isFirst,
    );
  }
}
