import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/presentation/add_pos/cubit/add_pos_cubit.dart';
import 'package:business_terminal/presentation/add_pos/form_validation/add_pos_form_validation.dart';
import 'package:business_terminal/presentation/branch_profile/widget/drop_down_select_entrances_count.dart';
import 'package:business_terminal/presentation/common/widgets/form_consumer.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddPosPage extends StatelessWidget {
  const AddPosPage({super.key});

  static const path = '/add_pos';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AddPosCubit>(),
      child: AddPosForm(),
    );
  }
}

class AddPosForm extends StatelessWidget {
  AddPosForm({super.key});

  final formSettings = AddPosFormSettings();

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: AppLocale.of(context).cash_register_system_used,
          subHeader: Text(AppLocale.of(context).help_us_connect_branch),
        ),
        body: ReactiveFormBuilder(
          form: formSettings.buildForm,
          builder: (
            BuildContext context,
            FormGroup formGroup,
            Widget? child,
          ) {
            return Column(
              children: [
                const SizedBox(height: 32),
                FormTextField(
                  name: AddPosFormSettings.cashRegisterField,
                  hint: AppLocale.of(context).cash_register_manufacturer,
                  label: AppLocale.of(context).cash_register_manufacturer,
                  validationMessages: (control) =>
                      formSettings.validationMessageCashRegister,
                ),
                const SizedBox(height: 16),
                FormTextField(
                  name: AddPosFormSettings.modelField,
                  hint: AppLocale.of(context).model_if_known,
                  label: AppLocale.of(context).model_if_known,
                  validationMessages: (control) =>
                      formSettings.validationMessageModel,
                ),
                const SizedBox(height: 16),
                DropDown(
                  formControlName: AddPosFormSettings.posNumberField,
                  itemsList: EntrancesCountGenerator.getEntrancesCountList(
                    entrancesMaxCount: AddPosFormSettings.kMaxPosCount,
                  ),
                ),
                const SizedBox(height: 32),
                FormConsumer(
                  onTap: (form) {
                    // TODO(dvakhnin): Form behaviour
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
