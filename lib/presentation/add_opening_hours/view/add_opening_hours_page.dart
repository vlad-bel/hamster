import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/image/image_paths.dart';
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
import 'package:flutter_svg/flutter_svg.dart';
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
          form: () =>
              context.read<AddOpeningHoursCubit>().formSettings.formGroup,
          builder: (
            BuildContext context,
            FormGroup formGroup,
            Widget? child,
          ) {
            return BlocBuilder<AddOpeningHoursCubit, AddOpeningHoursState>(
              buildWhen: (previous, current) =>
                  current is InitialAddOpeningHours,
              builder: (context, state) {
                final formSettings =
                    context.read<AddOpeningHoursCubit>().formSettings;

                return Column(
                  children: [
                    const SizedBox(height: 24),
                    for (var item
                        in (state as InitialAddOpeningHours).hourRanges)
                      _OpeningHoursRange(
                        key: ValueKey(item),
                        formSettings: formSettings,
                        openField: formSettings.openFields.firstWhere(
                          (element) =>
                              element ==
                              '${AddOpeningHoursFormSettings.opensField}$item',
                        ),
                        closeField: formSettings.closeFields.firstWhere(
                          (element) =>
                              element ==
                              '${AddOpeningHoursFormSettings.closesField}$item',
                        ),
                        onDelete: () => context
                            .read<AddOpeningHoursCubit>()
                            .deleteRange(item),
                        onChange:
                            context.read<AddOpeningHoursCubit>().validateForms,
                      ),
                    if (state.error.isNotEmpty)
                      Text(
                        state.error,
                        style: inter16Medium.copyWith(color: razzmatazz),
                      ),
                    if (context.read<AddOpeningHoursCubit>().showAddButton)
                      Column(
                        children: [
                          const SizedBox(height: 16),
                          DashedButton(
                            onTap:
                                context.read<AddOpeningHoursCubit>().addRange,
                            label: AppLocale.current.add_opening_time,
                          ),
                        ],
                      ),
                    const SizedBox(height: 24),
                    FormConsumer(
                      onTap: (form) {
                        // TODO(dvakhnin): Form behaviour
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _OpeningHoursRange extends StatefulWidget {
  const _OpeningHoursRange({
    Key? key,
    required this.formSettings,
    required this.openField,
    required this.closeField,
    required this.onDelete,
    required this.onChange,
  }) : super(key: key);

  final AddOpeningHoursFormSettings formSettings;
  final VoidCallback onDelete;
  final VoidCallback onChange;
  final String openField;
  final String closeField;

  @override
  State<_OpeningHoursRange> createState() => _OpeningHoursRangeState();
}

class _OpeningHoursRangeState extends State<_OpeningHoursRange> {
  final _openController = TextEditingController();
  final _closeController = TextEditingController();

  final _openFocus = FocusNode();
  final _closeFocus = FocusNode();

  @override
  void initState() {
    _openController.addListener(widget.onChange);
    _closeController.addListener(widget.onChange);
    _openFocus.addListener(widget.onChange);
    _closeFocus.addListener(widget.onChange);
    super.initState();
  }

  @override
  void dispose() {
    _openController.removeListener(widget.onChange);
    _closeController.removeListener(widget.onChange);
    _openFocus.removeListener(widget.onChange);
    _closeFocus.removeListener(widget.onChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: FormTextField(
              name: widget.openField,
              hint: AppLocale.current.opens,
              label: AppLocale.current.opens,
              inputFormatters: [
                DateTextFormatter(),
              ],
              showErrors: false,
              controller: _openController,
              onEditingComplete: widget.onChange,
              focusListener: _openFocus,
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
              name: widget.closeField,
              hint: AppLocale.current.closes,
              label: AppLocale.current.closes,
              inputFormatters: [
                DateTextFormatter(),
              ],
              showErrors: false,
              controller: _closeController,
              onEditingComplete: widget.onChange,
              focusListener: _closeFocus,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            height: 48,
            width: 48,
            child: MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              onPressed: widget.onDelete,
              child: SvgPicture.asset(ImagePaths.svg(SvgPaths.dismiss)),
            ),
          ),
        ],
      ),
    );
  }
}
