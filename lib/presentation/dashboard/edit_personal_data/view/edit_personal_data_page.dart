import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/country_code_selector.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/dashboard/edit_personal_data/cubit/edit_personal_data_cubit.dart';
import 'package:business_terminal/presentation/dashboard/edit_personal_data/cubit/edit_personal_data_state.dart';
import 'package:business_terminal/presentation/dashboard/edit_personal_data/form_validation_rules/edit_personal_data_form_group.dart';
import 'package:business_terminal/presentation/dashboard/edit_personal_data/view/personal_avatar_page.dart';
import 'package:business_terminal/presentation/dashboard/edit_personal_data/view/personal_data_avatar_container.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// Page of user personal data editing
/// Layout mockup - [https://xd.adobe.com/view/37f6c84a-adf8-42b8-4a26-d95fc5f52f2a-41c7/screen/e1a77de1-24a8-48ff-b983-48876e10554b/]
class EditPersonalDataPage extends StatefulWidget {
  static const path = 'edit_personal_data';

  const EditPersonalDataPage({Key? key}) : super(key: key);

  @override
  State<EditPersonalDataPage> createState() => _EditPersonalDataPageState();
}

class _EditPersonalDataPageState extends State<EditPersonalDataPage> {
  /// Logic of country code picking is encapsulated in this cubit
  /// Other logic is inside [EditPersonalDataCubit]
  final countryCodeCubit = getIt.get<CountryCodeSelectorCubit>()
    ..getCountryList();

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      showLanguageDropdown: false,
      children: BlocBuilder<EditPersonalDataCubit, EditPersonalDataState>(
          builder: (context, state) {
        return PersonalDataAvatarContainer(
          image: state.avatar,
          onAvatarClicked: () {
            Navigator.of(context).pushNamed(PersonalAvatarPage.path);
          },
          child: ReactiveFormBuilder(
            form: () => context.read<EditPersonalDataCubit>().form,
            builder: (context, formGroup, child) {
              return Column(
                children: [
                  const SizedBox(height: 16),
                  FormTextField(
                    name: EditPersonalDataFormGroup.kFieldName,
                    label: AppLocale.of(context).firstName,
                    validationMessages: (_) =>
                        EditPersonalDataFormGroup.validationMessageNameSurname(
                            AppLocale.of(context)),
                  ),
                  const SizedBox(height: 16),
                  FormTextField(
                    name: EditPersonalDataFormGroup.kFieldSurname,
                    label: AppLocale.of(context).lastName,
                    validationMessages: (_) =>
                        EditPersonalDataFormGroup.validationMessageNameSurname(
                      AppLocale.of(context),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormTextField(
                    name: EditPersonalDataFormGroup.kFieldEmail,
                    label: AppLocale.of(context).email,
                    readOnly: true,
                  ),
                  const SizedBox(height: 16),
                  ReactiveForm(
                    formGroup: context
                        .read<EditPersonalDataCubit>()
                        .countryCodeSelectorCubit
                        .numberForm,
                    child: CountryCodeSelector(
                      cubit: context
                          .read<EditPersonalDataCubit>()
                          .countryCodeSelectorCubit,
                      loading: false,
                      readOnly: true,
                      label: AppLocale.of(context).phoneNumber,
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormTextField(
                    label: AppLocale.of(context).language,
                    initialText: AppLocale.of(context).de_language,
                    readOnly: true,
                    reactive: false,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: WhiteButton(
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ActionButtonBlue(
                          isEnabled: formGroup.valid,
                          child: Text(AppLocale.of(context).save),
                          onPressed: () {
                            context.read<EditPersonalDataCubit>().saveData(() {
                              Navigator.of(context).pop();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              );
            },
          ),
        );
      }),
    );
  }
}
