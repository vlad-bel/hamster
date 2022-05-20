import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/route_names.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/company.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/add_payment/view/add_payment_page.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/country_selector.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/dash_bordered_container/dash_bordered_container_widget.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:business_terminal/presentation/common/widgets/header_app_bar/header_app_bar_widget.dart';
import 'package:business_terminal/presentation/common/widgets/payment_info.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_edit/cubit/profile_edit_cubit.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_edit/form_validation/profile_edit_form_validation.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({
    Key? key,
  }) : super(key: key);

  static const String path = RouteNames.profileEdit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<ProfileEditCubit>()..getInitialData(),
      child: _ProfileEditView(),
    );
  }
}

class _ProfileEditView extends StatefulWidget {
  const _ProfileEditView({Key? key}) : super(key: key);

  @override
  State<_ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<_ProfileEditView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Image.asset(
            Assets.imagesBackgroundImageSignUp,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          ReactiveFormBuilder(
            form:
                getIt.get<ProfileEditCubit>().profileEditFormSettings.buildForm,
            builder: (context, form, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeaderAppBarWidget(
                    trailing: ReactiveFormConsumer(
                        builder: (context, formGroup, child) {
                      return ActionButtonBlue(
                        onPressed: () async {
                          // getIt.get<ProfileEditCubit>().editProfile(
                          //       '1',
                          //       ProfileEditRequest(
                          //         city: '',
                          //         commercialRegisterNumber: '',
                          //         companyName: '',
                          //         country: '',
                          //         streetName: '',
                          //         countryCode: '',
                          //         postalCode: '',
                          //         streetNumber: '',
                          //         taxNumber: '',
                          //         vatId: '',
                          //       ),
                          //     );
                        },
                        isEnabled: form.valid,
                        child: Text(
                          tr('save'),
                        ),
                      );
                    }),
                  ),
                  Expanded(
                    child: Center(
                      child: BlocBuilder<ProfileEditCubit, ProfileEditState>(
                        buildWhen: (previous, current) =>
                            current is InitialProfileEditState,
                        builder: (context, state) {
                          return state.when(
                            initial: (company, profileEditFormSettings) =>
                                _ProfileEditContent(
                              formSettings: profileEditFormSettings,
                              company: company,
                            ),
                            error: (ApiFailure error) {
                              return Text('Error');
                            },
                            success: (company) {
                              return Text('success ${company.toJson()}');
                            },
                            loading: () {
                              return SizedBox();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProfileEditContent extends StatefulWidget {
  const _ProfileEditContent({
    Key? key,
    required this.formSettings,
    required this.company,
  }) : super(key: key);
  final Company company;
  final ProfileEditFormSettings formSettings;

  @override
  State<_ProfileEditContent> createState() => _ProfileEditContentState();
}

class _ProfileEditContentState extends State<_ProfileEditContent> {
  // TODO: Temporary - remove
  var _accountOwner = '';
  var _iban = '';

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
                      // TODO add l18n key
                      tr('company_profile'),
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
                                  // TODO add l18n key
                                  tr('add_logo'),
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
                              // TODO add l18n key
                              FormTextField(
                                validationMessages: (control) =>
                                    widget.formSettings.validationMessages,
                                name: ProfileEditFormSettings.kCompanyName,
                                label: tr(ProfileEditFormSettings.kCompanyName),
                                hint: tr(ProfileEditFormSettings.kCompanyName),
                              ),
                              const SizedBox(height: 25),
                              // TODO add l18n key
                              FormTextField(
                                validationMessages: (control) =>
                                    widget.formSettings.validationMessages,
                                onTap: () {},
                                name:
                                    ProfileEditFormSettings.kStreetHouseNumber,
                                label: tr(
                                  ProfileEditFormSettings.kStreetHouseNumber,
                                ),
                                hint: tr(
                                  ProfileEditFormSettings.kStreetHouseNumber,
                                ),
                              ),
                              const SizedBox(height: 25),
                              // TODO add l18n key
                              FormTextField(
                                validationMessages: (control) =>
                                    widget.formSettings.validationMessages,
                                name:
                                    ProfileEditFormSettings.kZipCodeAndLocation,
                                label: tr(
                                  ProfileEditFormSettings.kZipCodeAndLocation,
                                ),
                                hint: tr(
                                  ProfileEditFormSettings.kZipCodeAndLocation,
                                ),
                              ),
                              const SizedBox(height: 25),
                              BlocProvider(
                                create: (_) =>
                                    GetIt.instance.get<CountrySelectorCubit>(),
                                child: CountrySelector(
                                  cubit: GetIt.instance
                                      .get<CountrySelectorCubit>(),
                                ),
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
                            // TODO add l18n key
                            tr('base_data'),
                            style: inter16SemiBold.copyWith(
                              color: lynch,
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          // TODO add l18n key
                          FormTextField(
                            validationMessages: (control) =>
                                widget.formSettings.validationMessages,
                            name: ProfileEditFormSettings
                                .kCommercialRegisterNumber,
                            label: tr(
                              ProfileEditFormSettings.kCommercialRegisterNumber,
                            ),
                            hint: tr(
                              ProfileEditFormSettings.kCommercialRegisterNumber,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          // TODO add l18n key
                          FormTextField(
                            validationMessages: (control) =>
                                widget.formSettings.validationMessages,
                            name: ProfileEditFormSettings.kTaxNumber,
                            label: tr(
                              ProfileEditFormSettings.kTaxNumber,
                            ),
                            hint: tr(
                              ProfileEditFormSettings.kTaxNumber,
                            ),
                          ),
                          const SizedBox(height: 25),
                          // TODO add l18n key
                          FormTextField(
                            validationMessages: (control) =>
                                widget.formSettings.validationMessages,
                            name: ProfileEditFormSettings.kVatId,
                            label: tr(
                              ProfileEditFormSettings.kVatId,
                            ),
                            hint: tr(
                              ProfileEditFormSettings.kVatId,
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
                      // TODO!
                      onTap: () async {
                        final result = await Navigator.pushNamed(
                          context,
                          AddPaymentPage.path,
                        ) as List<String>?;
                        if (result == null) return;

                        setState(() {
                          _accountOwner = result[0];
                          _iban = result[1];
                        });
                      },
                      child: PaymentInfo(
                        accountOwner: _accountOwner,
                        iban: _iban,
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
