import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/add_payment/view/add_payment_page.dart';
import 'package:business_terminal/presentation/app/view/app.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/widget/avatar_selected_picture.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo/add_logo_widget.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/country_selector.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_state.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/dashboard_page.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:business_terminal/presentation/common/widgets/header_app_bar/header_app_bar_widget.dart';
import 'package:business_terminal/presentation/common/widgets/payment_info.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_add_logo/view/profile_add_logo.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_edit/cubit/profile_edit_cubit.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_edit/form_validation/profile_edit_form_validation.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/cubit/profile_viewing_cubit.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({
    super.key,
  });

  static const String path = myCompanyEditPath;

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
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) =>
                    getIt.get<CountrySelectorCubit>()..getCountryList(),
              ),
              BlocProvider(
                create: (_) => getIt.get<ProfileEditCubit>()..getInitialData(),
              ),
            ],
            child: BlocBuilder<CountrySelectorCubit, CountrySelectorState>(
              builder: (context, state) {
                final countrySelectorCubit =
                    BlocProvider.of<CountrySelectorCubit>(
                  context,
                );
                final profileEditCubit = context.read<ProfileEditCubit>();

                return ReactiveFormBuilder(
                  form: profileEditCubit.profileEditFormSettings.buildForm,
                  builder: (context, form, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HeaderAppBarWidget(
                          trailing: ReactiveFormConsumer(
                            builder: (context, formGroup, child) {
                              return ActionButtonBlue(
                                onPressed: () async {
                                  final company = (await profileEditCubit
                                          .companyUsecase
                                          .getRepCompany())
                                      .company;

                                  final selectedCountry =
                                      countrySelectorCubit.state.whenOrNull(
                                    close: (country, _) => country,
                                  );

                                  await profileEditCubit.editProfile(
                                    '${company?.id}',
                                    country: selectedCountry?.name ??
                                        '${company?.country}',
                                    countryCode: '${selectedCountry?.code}',
                                  );
                                },
                                isEnabled: form.valid,
                                child: Text(
                                  AppLocale.of(context).save.toUpperCase(),
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: BlocConsumer<ProfileEditCubit,
                                ProfileEditState>(
                              listener: (context, state) {
                                state.whenOrNull(
                                  initial: (company, profileEditFormSettings) {
                                    countrySelectorCubit.selectInitialCountry(
                                      countryName: '${company.country}',
                                    );
                                  },
                                  error: (ApiFailure error) {
                                    SnackBarManager.showError(
                                      AppLocale.of(context).error,
                                    );
                                  },
                                  success: () async {
                                    final fetchRepCompany =
                                        await profileEditCubit.companyUsecase
                                            .fetchRepCompany();
                                    if (fetchRepCompany.company?.id != null) {
                                      await profileEditCubit.companyUsecase
                                          .fetchCompany(
                                        companyId: fetchRepCompany.company!.id!,
                                      );
                                    }

                                    await getIt
                                        .get<ProfileViewingCubit>()
                                        .getInitialData();
                                    if (!mounted) return;
                                    context
                                        .read<DashboardCubit>()
                                        .updateRepCompany(
                                          repCompany: fetchRepCompany,
                                        );

                                    SnackBarManager.showSuccess(
                                      AppLocale.of(context).success,
                                    );
                                    Navigator.pop(context);
                                  },
                                );
                              },
                              buildWhen: (previous, current) =>
                                  current is InitialProfileEditState,
                              builder: (context, state) {
                                return state.whenOrNull(
                                      initial:
                                          (company, profileEditFormSettings) =>
                                              _ProfileEditContent(
                                        formSettings: profileEditFormSettings,
                                        company: company,
                                        countrySelectorCubit:
                                            countrySelectorCubit,
                                      ),
                                      loading: () {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                    ) ??
                                    const SizedBox.shrink();
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
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
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final profileEditCubit = context.read<ProfileEditCubit>();

    return SingleChildScrollView(
      child: Column(
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
                        child: BlocBuilder<ProfileEditCubit, ProfileEditState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              imagesAdded: (
                                company,
                                profileEditFormSettings,
                                images,
                              ) {
                                return Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (images.length > 1)
                                          InkWell(
                                            onTap: () async {
                                              await controller.previousPage(
                                                duration:
                                                    Duration(milliseconds: 1),
                                                curve: Curves.easeIn,
                                              );
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.arrow_back_ios,
                                              color: lynch,
                                              size: 32,
                                            ),
                                          ),
                                        SizedBox(
                                          width: 200,
                                          height: 200,
                                          child: PageView.builder(
                                            itemCount: images.length,
                                            controller: controller,
                                            itemBuilder: (
                                              BuildContext context,
                                              int index,
                                            ) {
                                              return AvatarSelectedPicture(
                                                path: images[index].imageBytes,
                                                showEditButton: true,
                                              );
                                            },
                                          ),
                                        ),
                                        if (images.length > 1)
                                          InkWell(
                                            onTap: () async {
                                              await controller.nextPage(
                                                duration:
                                                    Duration(milliseconds: 1),
                                                curve: Curves.easeIn,
                                              );
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: lynch,
                                              size: 32,
                                            ),
                                          ),
                                      ],
                                    ),
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          color: white,
                                          child: FutureBuilder(
                                            future: Future.value(true),
                                            builder: (
                                              BuildContext context,
                                              AsyncSnapshot<void> snap,
                                            ) {
                                              return Text(
                                                '${(controller.page?.round() ?? 0) + 1} / ${images.length}',
                                                style: inter14,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                              orElse: () {
                                return AppAddLogoWidget(
                                  onPressed: () async {
                                    final result = await authNavigatorKey
                                        .currentState
                                        ?.pushNamed<
                                            List<AddedProfileLogoModel>>(
                                      ProfileAddLogoPage.path,
                                    );
                                    if (result != null) {
                                      await profileEditCubit.addImages(
                                        result,
                                      );
                                    }
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
                        ),
                        child: Column(
                          children: [
                            FormTextField(
                              validationMessages: (control) =>
                                  widget.formSettings.validationMessages,
                              name: ProfileEditFormSettings.kCompanyName,
                              label: Intl.message(
                                ProfileEditFormSettings.kCompanyName,
                                name: ProfileEditFormSettings.kCompanyName,
                              ),
                              hint: Intl.message(
                                ProfileEditFormSettings.kCompanyName,
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
                                    name: ProfileEditFormSettings.kStreetField,
                                    hint: AppLocale.of(context).street_hint,
                                    label: AppLocale.of(context).street_hint,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Flexible(
                                  child: FormTextField(
                                    name: ProfileEditFormSettings
                                        .kStreetNumberField,
                                    hint: AppLocale.of(context).num_hint,
                                    label: AppLocale.of(context).num_hint,
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
                                    name:
                                        ProfileEditFormSettings.kPostcodeField,
                                    hint: AppLocale.of(context).post_hint,
                                    label: AppLocale.of(context).post_hint,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Flexible(
                                  flex: 3,
                                  child: FormTextField(
                                    name: ProfileEditFormSettings.kCityField,
                                    hint: AppLocale.of(context).location_hint,
                                    label: AppLocale.of(context).location_hint,
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
                                ProfileEditFormSettings
                                    .kCommercialRegisterNumber,
                                name: ProfileEditFormSettings
                                    .kCommercialRegisterNumber,
                              ),
                              hint: Intl.message(
                                ProfileEditFormSettings
                                    .kCommercialRegisterNumber,
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
                                ProfileEditFormSettings.kVatId,
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
                      child: PaymentInfo(
                        accountOwner: profileEditCubit.getControlValue(
                              ProfileEditFormSettings.kAccountOwner,
                            ) ??
                            '',
                        iban: profileEditCubit.getControlValue(
                              ProfileEditFormSettings.kIban,
                            ) ??
                            '',
                        onTap: () async {
                          final result = await Navigator.pushNamed(
                            context,
                            AddPaymentPage.path,
                          ) as Map<String, String>?;

                          if (result == null) return;
                          await profileEditCubit.updatePaymentData(result);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
