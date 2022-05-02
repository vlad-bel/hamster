import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/l10n/l10n.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/country_selector.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/common/widgets/search_place/search_place.dart';
import 'package:business_terminal/presentation/company_creation/cubit/company_creation_cubit.dart';
import 'package:business_terminal/presentation/company_creation/cubit/company_creation_state.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/form_text_field.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:routemaster/routemaster.dart';

class CompanyCreationForm extends StatelessWidget {
  const CompanyCreationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: Padding(
        padding: const EdgeInsets.only(bottom: 120),
        child: OnboardingWhiteContainer(
          header: OnboardingWhiteContainerHeader(
            header: context.l10n.create_company_profile,
            subHeader: Text(
              context.l10n.create_company_profile_descr,
              style: inter14,
            ),
          ),
          body: BlocBuilder<CompanyCreationCubit, CompanyCreationState>(
            builder: (context, state) {
              final companyCreationCubit =
                  BlocProvider.of<CompanyCreationCubit>(context);
              final countrySelectorCubit =
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
                      const SizedBox(height: 26),
                      const FormTextField(
                        name: CompanyCreationCubit.companyField,
                        hint: 'company',
                        label: 'company',
                      ),
                      const SizedBox(height: 16),
                      SearchPlace(
                        group: formGroup,
                        name: CompanyCreationCubit.addressField,
                        label: 'address',
                        hint: 'address',
                        onPredictionSelect: (prediction) {
                          countrySelectorCubit.selectCountryFromPrediction(
                            prediction,
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      const FormTextField(
                        name: CompanyCreationCubit.postcodeField,
                        hint: 'postcode',
                        label: 'postcode',
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
                              Routemaster.of(context).pop();
                            },
                          ),
                          const Spacer(),
                          ReactiveFormConsumer(
                            builder: (context, group, child) {
                              final selectedCountry =
                                  countrySelectorCubit.state.whenOrNull(
                                success: (country, _) => country,
                              );
                              return ActionButtonBlue(
                                width: 160,
                                isEnabled:
                                    // countrySelectorCubit.countryForm.valid &&
                                    selectedCountry != null && group.valid,
                                onPressed: () {
                                  ///go next
                                  // companyCreationCubit.createCompany(
                                  //   selectedAddress: countrySelectorCubit.state.whenOrNull(success: (country, _) => country),
                                  // );
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
}
