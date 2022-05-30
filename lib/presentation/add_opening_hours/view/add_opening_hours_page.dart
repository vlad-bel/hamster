import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/presentation/add_opening_hours/cubit/add_opening_hours_cubit.dart';
import 'package:business_terminal/presentation/add_opening_hours/form_validation/add_opening_hours_form_validation.dart';
import 'package:business_terminal/presentation/add_opening_hours/other/time_text_formatter.dart';
import 'package:business_terminal/presentation/common/widgets/dashed_button/dashed_button.dart';
import 'package:business_terminal/presentation/common/widgets/form_consumer.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddOpeningHoursPage extends StatelessWidget {
  static const path = '/add_opening';

  const AddOpeningHoursPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AddOpeningHoursCubit>(),
      child: _AddOpeningHoursForm(),
    );
  }
}

class _AddOpeningHoursForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: AppLocale.current.add_branch_hours,
          subHeader: Text(AppLocale.current.if_branch_closed_on_selected),
        ),
        body: ReactiveFormBuilder(
          form: context.read<AddOpeningHoursCubit>().formSettings.buildForm,
          builder: (
            BuildContext context,
            FormGroup formGroup,
            Widget? child,
          ) {
            return Column(
              children: [
                const SizedBox(height: 24),
                ListView.builder(
                  itemCount: context.read<AddOpeningHoursCubit>().counter,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return _OpeningHoursRange(
                      formSettings:
                          context.read<AddOpeningHoursCubit>().formSettings,
                    );
                  },
                ),
                const SizedBox(height: 16),
                DashedButton(
                  onTap: () {},
                  label: AppLocale.current.add_opening_time,
                ),
                const SizedBox(height: 16),
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

class _OpeningHoursRange extends StatelessWidget {
  const _OpeningHoursRange({Key? key, required this.formSettings})
      : super(key: key);

  final AddOpeningHoursFormSettings formSettings;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        children: [
          Expanded(
            child: FormTextField(
              name: AddOpeningHoursFormSettings.opensField,
              hint: AppLocale.current.opens,
              label: AppLocale.current.opens,
              inputFormatters: [
                DateTextFormatter(),
              ],
              validationMessages: (control) => formSettings.validationMessage,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            '-',
            style: inter16Medium,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: FormTextField(
              name: AddOpeningHoursFormSettings.closedField,
              hint: AppLocale.current.closes,
              label: AppLocale.current.closes,
              inputFormatters: [
                DateTextFormatter(),
              ],
              validationMessages: (control) => formSettings.validationMessage,
            ),
          ),
        ],
      ),
    );
  }
}
