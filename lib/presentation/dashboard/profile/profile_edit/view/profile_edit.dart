import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/route_names.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/add_payment/view/add_payment_page.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/country_selector.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/dash_bordered_container/dash_bordered_container_widget.dart';
import 'package:business_terminal/presentation/common/widgets/header_app_bar/header_app_bar_widget.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_edit/cubit/profile_edit_cubit.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_edit/form_validation/profile_edit_form_validation.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/form_text_field.dart';
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
      create: (_) => getIt.get<ProfileEditCubit>(),
      child: const _ProfileEditView(),
    );
  }
}

class _ProfileEditView extends StatefulWidget {
  const _ProfileEditView({Key? key}) : super(key: key);

  @override
  State<_ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<_ProfileEditView> {
  final formSettings = ProfileEditFormSettings();

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
            form: formSettings.buildForm,
            builder: (context, form, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeaderAppBarWidget(
                    trailing: ReactiveFormConsumer(
                        builder: (context, formGroup, child) {
                      return ActionButtonBlue(
                        onPressed: () {},
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
                        builder: (context, state) {
                          return state.when(
                            initial: () => _ProfileEditContent(
                              formSettings: formSettings,
                            ),
                            error: (ApiFailure error) {
                              return _ProfileEditContent(
                                formSettings: formSettings,
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
  }) : super(key: key);

  final ProfileEditFormSettings formSettings;

  @override
  State<_ProfileEditContent> createState() => _ProfileEditContentState();
}

class _ProfileEditContentState extends State<_ProfileEditContent> {
  bool needToShowPaymentInfo = false;
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
                    const SizedBox(
                      height: 30,
                    ),
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
                                const SizedBox(
                                  width: 4,
                                ),
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
                                name: widget.formSettings.kCompanyName,
                                label: tr(widget.formSettings.kCompanyName),
                                hint: tr(widget.formSettings.kCompanyName),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              // TODO add l18n key
                              FormTextField(
                                validationMessages: (control) =>
                                    widget.formSettings.validationMessages,
                                onTap: () {},
                                name: widget.formSettings.kStreetHouseNumber,
                                label: tr(
                                  widget.formSettings.kStreetHouseNumber,
                                ),
                                hint: tr(
                                  widget.formSettings.kStreetHouseNumber,
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              // TODO add l18n key
                              FormTextField(
                                validationMessages: (control) =>
                                    widget.formSettings.validationMessages,
                                name: widget.formSettings.kZipCodeAndLocation,
                                label: tr(
                                  widget.formSettings.kZipCodeAndLocation,
                                ),
                                hint: tr(
                                  widget.formSettings.kZipCodeAndLocation,
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
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
            const SizedBox(
              width: 32,
            ),
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
                            name: widget.formSettings.kCommercialRegisterNumber,
                            label: tr(
                              widget.formSettings.kCommercialRegisterNumber,
                            ),
                            hint: tr(
                              widget.formSettings.kCommercialRegisterNumber,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          // TODO add l18n key
                          FormTextField(
                            validationMessages: (control) =>
                                widget.formSettings.validationMessages,
                            name: widget.formSettings.kTaxNumber,
                            label: tr(
                              widget.formSettings.kTaxNumber,
                            ),
                            hint: tr(
                              widget.formSettings.kTaxNumber,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          // TODO add l18n key
                          FormTextField(
                            validationMessages: (control) =>
                                widget.formSettings.validationMessages,
                            name: widget.formSettings.kVatId,
                            label: tr(
                              widget.formSettings.kVatId,
                            ),
                            hint: tr(
                              widget.formSettings.kVatId,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // TODO add l18n key
                          tr('payment_information'),
                          style: inter16SemiBold.copyWith(
                            color: lynch,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        GestureDetector(
                          // TODO!
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AddPaymentPage.path,
                            );
                            setState(() {
                              needToShowPaymentInfo = !needToShowPaymentInfo;
                            });
                          },
                          child: needToShowPaymentInfo
                              ? Column(
                                  children: [
                                    // TODO add l18n key
                                    FormTextField(
                                      validationMessages: (control) => widget
                                          .formSettings.validationMessages,
                                      name: widget.formSettings.kAccountOwner,
                                      label: tr(
                                        widget.formSettings.kAccountOwner,
                                      ),
                                      hint: tr(
                                        widget.formSettings.kAccountOwner,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    // TODO add l18n key
                                    FormTextField(
                                      validationMessages: (control) => widget
                                          .formSettings.validationMessages,
                                      name: widget.formSettings.kIban,
                                      label: tr(
                                        widget.formSettings.kIban,
                                      ),
                                      hint: tr(
                                        widget.formSettings.kIban,
                                      ),
                                    ),
                                  ],
                                )
                              : Center(
                                  child: AppDashBorderedContainer(
                                    borderType: BorderType.rect,
                                    child: Container(
                                      height: 125,
                                      decoration:
                                          const BoxDecoration(color: white),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.add_circle,
                                              color: denim1,
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              // TODO add l18n key
                                              tr('add_bank_details'),
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
                        ),
                      ],
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
