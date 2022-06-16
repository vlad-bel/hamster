import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/presentation/add_payment/form_validation/add_payment_form_validation.dart';
import 'package:business_terminal/presentation/add_payment/view/add_payment_page.dart';
import 'package:business_terminal/presentation/app/view/app.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo/add_logo_widget.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/country_selector.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/other/iban_input_formatter.dart';
import 'package:business_terminal/presentation/common/widgets/logo_viewer/logo_viewer.dart';
import 'package:business_terminal/presentation/common/widgets/payment_info.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_add_logo/view/profile_add_logo.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_edit/cubit/profile_edit_cubit.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_edit/form_validation/profile_edit_form_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ProfileEditContent extends StatefulWidget {
  const ProfileEditContent({
    Key? key,
    required this.formSettings,
    required this.company,
    required this.countrySelectorCubit,
  }) : super(key: key);

  final Company company;
  final CountrySelectorCubit countrySelectorCubit;
  final ProfileEditFormSettings formSettings;

  @override
  State<ProfileEditContent> createState() => ProfileEditContentState();
}

class ProfileEditContentState extends State<ProfileEditContent> {
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
                          buildWhen: (prev, current) {
                            return current.maybeWhen(
                              imagesAdded: (
                                company,
                                profileEditFormSettings,
                                images,
                              ) =>
                                  true,
                              initial: (company, settings) => true,
                              orElse: () => false,
                            );
                          },
                          builder: (context, state) {
                            return state.maybeWhen(
                              imagesAdded: (
                                company,
                                profileEditFormSettings,
                                images,
                              ) {
                                return AppLogoViewer(
                                  images: images,
                                  onPressed: () async {
                                    final result = await authNavigatorKey
                                        .currentState
                                        ?.pushNamed<List<AppColoredFile>>(
                                      ProfileAddLogoPage.path,
                                      arguments: ProfileAddLogoArguments(
                                        files: images,
                                      ),
                                    );
                                    if (result != null) {
                                      await profileEditCubit.addImages(
                                        result,
                                        withUpload: true,
                                      );
                                    }
                                  },
                                );
                              },
                              orElse: () {
                                return AppAddLogoWidget(
                                  onPressed: () async {
                                    final result = await authNavigatorKey
                                        .currentState
                                        ?.pushNamed<List<AppColoredFile>>(
                                      ProfileAddLogoPage.path,
                                      arguments: ProfileAddLogoArguments(
                                        files: [],
                                      ),
                                    );
                                    if (result != null) {
                                      await profileEditCubit.addImages(
                                        result,
                                        withUpload: true,
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
                            Column(
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
                                        name: ProfileEditFormSettings
                                            .kStreetField,
                                        hint: AppLocale.of(context).street_hint,
                                        label:
                                            AppLocale.of(context).street_hint,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
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
                                        name: ProfileEditFormSettings
                                            .kPostcodeField,
                                        hint: AppLocale.of(context).post_hint,
                                        label: AppLocale.of(context).post_hint,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Flexible(
                                      flex: 3,
                                      child: FormTextField(
                                        name:
                                            ProfileEditFormSettings.kCityField,
                                        hint:
                                            AppLocale.of(context).location_hint,
                                        label:
                                            AppLocale.of(context).location_hint,
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
                      child: BlocBuilder<ProfileEditCubit, ProfileEditState>(
                          buildWhen: (prev, current) {
                        return current.maybeWhen(
                          initial: (company, profileEditFormSettings) => true,
                          paymentInfoAdded: (company, settings) => true,
                          orElse: () => false,
                        );
                      }, builder: (context, state) {
                        return state.maybeWhen(
                          imagesAdded: (
                            company,
                            profileEditFormSettings,
                            images,
                          ) =>
                              company.accountOwner?.isNotEmpty == true &&
                                      company.iban?.isNotEmpty == true
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocale.of(context)
                                              .payment_information,
                                          style: inter16SemiBold,
                                        ),
                                        const SizedBox(height: 24),
                                        FormTextField(
                                          name: ProfileEditFormSettings
                                              .kAccountOwner,
                                          hint: AppLocale.of(context)
                                              .account_owner,
                                          label: AppLocale.of(context)
                                              .account_owner,
                                          validationMessages: (control) =>
                                              AddPaymentFormSettings
                                                  .validationMessageAccountOwner,
                                        ),
                                        const SizedBox(height: 16),
                                        FormTextField(
                                          name: ProfileEditFormSettings.kIban,
                                          hint: AppLocale.of(context).iban,
                                          inputFormatters: [
                                            IbanInputFormatter(),
                                          ],
                                          label: AppLocale.of(context).iban,
                                          validationMessages: (control) =>
                                              AddPaymentFormSettings
                                                  .validationMessageIban,
                                        ),
                                      ],
                                    )
                                  : PaymentInfo(
                                      accountOwner: company.accountOwner == null
                                          ? ''
                                          : company.accountOwner.toString(),
                                      iban: company.iban ?? '',
                                      addPaymentFormSettings:
                                          AddPaymentFormSettings(),
                                      onTap: () async {
                                        final result =
                                            await Navigator.pushNamed(
                                          context,
                                          AddPaymentPage.path,
                                          arguments: AddPaymentArguments(
                                            addPaymentArguments:
                                                profileEditCubit
                                                    .addPaymentFormSettings,
                                          ),
                                        ) as Map<String, String>?;

                                        if (result == null) return;
                                        await profileEditCubit
                                            .updatePaymentData(result);
                                      },
                                    ),
                          paymentInfoAdded: (accountOwner, iban) => accountOwner
                                          .isNotEmpty ==
                                      true &&
                                  iban.isNotEmpty == true
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocale.of(context).payment_information,
                                      style: inter16SemiBold,
                                    ),
                                    const SizedBox(height: 24),
                                    FormTextField(
                                      name:
                                          ProfileEditFormSettings.kAccountOwner,
                                      hint: AppLocale.of(context).account_owner,
                                      label:
                                          AppLocale.of(context).account_owner,
                                      validationMessages: (control) =>
                                          AddPaymentFormSettings
                                              .validationMessageAccountOwner,
                                    ),
                                    const SizedBox(height: 16),
                                    FormTextField(
                                      name: ProfileEditFormSettings.kIban,
                                      hint: AppLocale.of(context).iban,
                                      label: AppLocale.of(context).iban,
                                      inputFormatters: const [],
                                      validationMessages: (control) =>
                                          AddPaymentFormSettings
                                              .validationMessageIban,
                                    ),
                                  ],
                                )
                              : PaymentInfo(
                                  accountOwner: accountOwner,
                                  iban: iban,
                                  addPaymentFormSettings:
                                      AddPaymentFormSettings(),
                                  onTap: () async {
                                    final result = await Navigator.pushNamed(
                                      context,
                                      AddPaymentPage.path,
                                      arguments: AddPaymentArguments(
                                        addPaymentArguments: profileEditCubit
                                            .addPaymentFormSettings,
                                      ),
                                    ) as Map<String, String>?;

                                    if (result == null) return;
                                    await profileEditCubit
                                        .updatePaymentData(result);
                                  },
                                ),
                          initial: (company, settings) => company
                                          .accountOwner?.isNotEmpty ==
                                      true &&
                                  company.iban?.isNotEmpty == true
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocale.of(context).payment_information,
                                      style: inter16SemiBold,
                                    ),
                                    const SizedBox(height: 24),
                                    FormTextField(
                                      name:
                                          ProfileEditFormSettings.kAccountOwner,
                                      hint: AppLocale.of(context).account_owner,
                                      label:
                                          AppLocale.of(context).account_owner,
                                      validationMessages: (control) =>
                                          AddPaymentFormSettings
                                              .validationMessageAccountOwner,
                                    ),
                                    const SizedBox(height: 16),
                                    FormTextField(
                                      name: ProfileEditFormSettings.kIban,
                                      hint: AppLocale.of(context).iban,
                                      label: AppLocale.of(context).iban,
                                      inputFormatters: const [],
                                      validationMessages: (control) =>
                                          AddPaymentFormSettings
                                              .validationMessageIban,
                                    ),
                                  ],
                                )
                              : PaymentInfo(
                                  accountOwner: company.accountOwner == null
                                      ? ''
                                      : company.accountOwner.toString(),
                                  iban: company.iban ?? '',
                                  addPaymentFormSettings:
                                      AddPaymentFormSettings(),
                                  onTap: () async {
                                    final result = await Navigator.pushNamed(
                                      context,
                                      AddPaymentPage.path,
                                      arguments: AddPaymentArguments(
                                        addPaymentArguments: profileEditCubit
                                            .addPaymentFormSettings,
                                      ),
                                    ) as Map<String, String>?;

                                    if (result == null) return;
                                    await profileEditCubit
                                        .updatePaymentData(result);
                                  },
                                ),
                          orElse: () {
                            return Text('orElse');
                            return PaymentInfo(
                              addPaymentFormSettings: AddPaymentFormSettings(),
                              onTap: () async {
                                final result = await Navigator.pushNamed(
                                  context,
                                  AddPaymentPage.path,
                                  arguments: AddPaymentArguments(
                                    addPaymentArguments:
                                        profileEditCubit.addPaymentFormSettings,
                                  ),
                                ) as Map<String, String>?;

                                if (result == null) return;
                                await profileEditCubit
                                    .updatePaymentData(result);
                              },
                            );
                          },
                        );
                      }),
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
