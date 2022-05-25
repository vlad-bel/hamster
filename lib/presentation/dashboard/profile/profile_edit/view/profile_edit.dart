import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/route_names.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/request_model/profile/profile_edit/profile_edit_request.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/add_payment/view/add_payment_page.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/country_selector.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_state.dart';
import 'package:business_terminal/presentation/common/widgets/dash_bordered_container/dash_bordered_container_widget.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:business_terminal/presentation/common/widgets/header_app_bar/header_app_bar_widget.dart';
import 'package:business_terminal/presentation/common/widgets/payment_info.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_edit/cubit/profile_edit_cubit.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_edit/form_validation/profile_edit_form_validation.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/use_cases/company/company_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({
    super.key,
  });

  static const String path = RouteNames.profileEdit;

  @override
  Widget build(BuildContext context) {
    return const _ProfileEditView();
  }
}

class _ProfileEditView extends StatefulWidget {
  const _ProfileEditView();

  @override
  State<_ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<_ProfileEditView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.imagesBackgroundImageSignUp,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          BlocProvider(
            create: (BuildContext context) {
              return GetIt.instance.get<CountrySelectorCubit>();
            },
            child: BlocBuilder<CountrySelectorCubit, CountrySelectorState>(
                builder: (context, state) {
              final countrySelectorCubit =
                  BlocProvider.of<CountrySelectorCubit>(
                context,
              );

              return ReactiveFormBuilder(
                form: context
                    .read<ProfileEditCubit>()
                    .profileEditFormSettings
                    .buildForm,
                builder: (context, form, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeaderAppBarWidget(
                        trailing: ReactiveFormConsumer(
                          builder: (context, formGroup, child) {
                            return ActionButtonBlue(
                              onPressed: () async {
                                final result =
                                    getIt.get<CompanyUsecase>().repCompany;
                                final company = result!.company;

                                final selectedCountry =
                                    countrySelectorCubit.state.whenOrNull(
                                  close: (country, _) => country,
                                );

                                await context
                                    .read<ProfileEditCubit>()
                                    .editProfile(
                                      '${company?.id}',
                                      ProfileEditRequest(
                                          city:
                                              '${formGroup.controls[ProfileEditFormSettings.kCityField]?.value}',
                                          commercialRegisterNumber:
                                              '${formGroup.controls[ProfileEditFormSettings.kCommercialRegisterNumber]?.value}',
                                          companyName:
                                              '${formGroup.controls[ProfileEditFormSettings.kCompanyName]?.value}',
                                          country: selectedCountry?.name ??
                                              '${company?.country}',
                                          streetName:
                                              '${formGroup.controls[ProfileEditFormSettings.kStreetField]?.value.toString()}',
                                          countryCode:
                                              '${selectedCountry?.code}',
                                          postalCode:
                                              '${formGroup.controls[ProfileEditFormSettings.kPostcodeField]?.value.toString()}',
                                          streetNumber:
                                              '${formGroup.controls[ProfileEditFormSettings.kStreetNumberField]?.value.toString()}',
                                          taxNumber:
                                              '${formGroup.controls[ProfileEditFormSettings.kTaxNumber]?.value}',
                                          vatId:
                                              '${formGroup.controls[ProfileEditFormSettings.kVatId]?.value}',
                                          accountOwner:
                                              '${context.read<ProfileEditCubit>().profileEditFormSettings.controls[ProfileEditFormSettings.kAccountOwner]?.value}',
                                          iban:
                                              '${context.read<ProfileEditCubit>().profileEditFormSettings.controls[ProfileEditFormSettings.kIban]?.value}'),
                                    );
                              },
                              isEnabled: form.valid,
                              child: Text(
                                AppLocale.of(context).save,
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child:
                              BlocConsumer<ProfileEditCubit, ProfileEditState>(
                            listener: (context, state) {
                              if (state is SuccessProfileEditState) {
                                SnackBarManager.showSuccess(
                                  AppLocale.of(context).success,
                                );
                                Navigator.pop(context);
                              } else if (state is ErrorProfileEditState) {
                                SnackBarManager.showError(
                                  AppLocale.of(context).error,
                                );
                              } else if (state is InitialProfileEditState) {
                                countrySelectorCubit.selectInitialCountry(
                                  countryName: '${state.company.country}',
                                );
                              }
                            },
                            buildWhen: (previous, current) =>
                                current is InitialProfileEditState,
                            builder: (context, state) {
                              return state.when(
                                initial: (company, profileEditFormSettings) =>
                                    _ProfileEditContent(
                                  formSettings: profileEditFormSettings,
                                  company: company,
                                  countrySelectorCubit: countrySelectorCubit,
                                ),
                                error: (ApiFailure error) {
                                  return Text('Error');
                                },
                                success: () {
                                  return Text('success');
                                },
                                loading: () {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _ProfileEditContent extends StatefulWidget {
  const _ProfileEditContent({
    required this.formSettings,
    required this.company,
    required this.countrySelectorCubit,
  });

  final Company company;
  final CountrySelectorCubit countrySelectorCubit;
  final ProfileEditFormSettings formSettings;

  @override
  State<_ProfileEditContent> createState() => _ProfileEditContentState();
}

class _ProfileEditContentState extends State<_ProfileEditContent> {
  @override
  void initState() {
    super.initState();
    // final json = {
    // 'name': '${widget.company.country}',
    // };
    // widget.countrySelectorCubit.selectCountry(
    //   Country.fromJson(
    //     json,
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 450,
              height: 750,
              decoration: const BoxDecoration(
                color: white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 46,
                  horizontal: 50,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocale.of(context).company_profile,
                      style: inter16SemiBold.copyWith(
                        color: lynch,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: AppDashBorderedContainer(
                        boxShape: BoxShape.circle,
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add_circle,
                                  color: denim1,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  AppLocale.of(context).add_logo,
                                  style: inter14.copyWith(
                                    color: denim1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                      ),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              FormTextField(
                                validationMessages: (control) =>
                                    widget.formSettings.validationMessages,
                                name: ProfileEditFormSettings.kCompanyName,
                                label: Intl.message(
                                  'label',
                                  name: ProfileEditFormSettings.kCompanyName,
                                ),
                                hint: Intl.message(
                                  'hint',
                                  name: ProfileEditFormSettings.kCompanyName,
                                ),
                              ),
                              const SizedBox(height: 25),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: FormTextField(
                                      name:
                                          ProfileEditFormSettings.kStreetField,
                                      hint: AppLocale.current.street_hint,
                                      label: AppLocale.current.street_hint,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Flexible(
                                    child: FormTextField(
                                      name: ProfileEditFormSettings
                                          .kStreetNumberField,
                                      hint: AppLocale.current.num_hint,
                                      label: AppLocale.current.num_hint,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: FormTextField(
                                      name: ProfileEditFormSettings
                                          .kPostcodeField,
                                      hint: AppLocale.current.post_hint,
                                      label: AppLocale.current.post_hint,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Flexible(
                                    flex: 3,
                                    child: FormTextField(
                                      name: ProfileEditFormSettings.kCityField,
                                      hint: AppLocale.current.location_hint,
                                      label: AppLocale.current.location_hint,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                              CountrySelector(
                                cubit: widget.countrySelectorCubit,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 32),
            SizedBox(
              height: 750,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      width: 450,
                      padding: const EdgeInsets.symmetric(
                        vertical: 46,
                        horizontal: 50,
                      ),
                      decoration: const BoxDecoration(
                        color: white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocale.of(context).base_data,
                            style: inter16SemiBold.copyWith(
                              color: lynch,
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          FormTextField(
                            validationMessages: (control) =>
                                widget.formSettings.validationMessages,
                            name: ProfileEditFormSettings
                                .kCommercialRegisterNumber,
                            label: Intl.message(
                              ProfileEditFormSettings.kCommercialRegisterNumber,
                              name: ProfileEditFormSettings
                                  .kCommercialRegisterNumber,
                            ),
                            hint: Intl.message(
                              ProfileEditFormSettings.kCommercialRegisterNumber,
                              name: ProfileEditFormSettings
                                  .kCommercialRegisterNumber,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          FormTextField(
                            validationMessages: (control) =>
                                widget.formSettings.validationMessages,
                            name: ProfileEditFormSettings.kTaxNumber,
                            label: Intl.message(
                              ProfileEditFormSettings.kTaxNumber,
                              name: ProfileEditFormSettings.kTaxNumber,
                            ),
                            hint: Intl.message(
                              ProfileEditFormSettings.kTaxNumber,
                              name: ProfileEditFormSettings.kTaxNumber,
                            ),
                          ),
                          const SizedBox(height: 25),
                          FormTextField(
                            validationMessages: (control) =>
                                widget.formSettings.validationMessages,
                            name: ProfileEditFormSettings.kVatId,
                            label: Intl.message(
                              ProfileEditFormSettings.kVatId,
                              name: ProfileEditFormSettings.kVatId,
                            ),
                            hint: Intl.message(
                              'hint',
                              name: ProfileEditFormSettings.kVatId,
                            ),
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: 450,
                    height: 280,
                    padding: const EdgeInsets.symmetric(
                      vertical: 46,
                      horizontal: 50,
                    ),
                    decoration: const BoxDecoration(
                      color: white,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        final result = await Navigator.pushNamed(
                          context,
                          AddPaymentPage.path,
                        ) as Map<String, String>?;

                        if (result == null) return;
                        context
                            .read<ProfileEditCubit>()
                            .updatePaymentData(result);
                        setState(() {});
                      },
                      child: PaymentInfo(
                        accountOwner: context
                                .read<ProfileEditCubit>()
                                .profileEditFormSettings
                                .controls[ProfileEditFormSettings.kAccountOwner]
                                ?.value ??
                            '',
                        iban: context
                                .read<ProfileEditCubit>()
                                .profileEditFormSettings
                                .controls[ProfileEditFormSettings.kIban]
                                ?.value ??
                            '',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
