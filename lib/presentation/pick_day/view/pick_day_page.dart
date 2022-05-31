import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/temp/days_hours.dart';
import 'package:business_terminal/presentation/add_opening_hours/view/add_opening_hours_page.dart';
import 'package:business_terminal/presentation/common/widgets/checkbox/ui_checkbox.dart';
import 'package:business_terminal/presentation/common/widgets/form_consumer.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/pick_day/cubit/pick_day_cubit.dart';
import 'package:business_terminal/presentation/pick_day/form_validation/pick_day_form_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PickDayPage extends StatelessWidget {
  const PickDayPage({super.key, this.hours});

  static const path = '/pick_day';
  static const String paramDays = 'days_hours';
  final DaysHours? hours;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<PickDayCubit>()..setInitialHours(hours),
      child: PickDayForm(),
    );
  }
}

class PickDayForm extends StatelessWidget {
  PickDayForm({super.key});

  final weekDays = [
    PickDayFormSettings.mondayField,
    PickDayFormSettings.tuesdayField,
    PickDayFormSettings.wednesdayField,
    PickDayFormSettings.thursdayField,
    PickDayFormSettings.fridayField,
    PickDayFormSettings.saturdayField,
    PickDayFormSettings.sundayField,
  ];

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: AppLocale.current.cash_register_system_used,
          subHeader: Text(AppLocale.current.help_us_connect_branch),
        ),
        body: BlocBuilder<PickDayCubit, PickDayState>(
          builder: (BuildContext context, state) {
            return ReactiveFormBuilder(
              form: () => context.read<PickDayCubit>().formSettings.formGroup,
              builder: (
                BuildContext context,
                FormGroup formGroup,
                Widget? child,
              ) {
                final cubit = context.read<PickDayCubit>();

                final weekDayKeys =
                    cubit.formSettings.weekControls.keys.toList();

                if (cubit.needSetupSubs) {
                  cubit.setupSubs(formGroup);
                }

                return Column(
                  children: [
                    const SizedBox(height: 32),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                          color: lynch.withOpacity(0.3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: lynch.withOpacity(0.2),
                            ),
                            child: UiCheckbox(
                              name: PickDayFormSettings.selectAllField,
                              title: Text(AppLocale.current.select_all),
                            ),
                          ),
                          ListView.builder(
                            itemCount: 7,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 48,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: solitude1,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: UiCheckbox(
                                        name: weekDayKeys[index],
                                        title: Text(
                                          AppLocale.byKey(weekDays[index]),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        state.hours.hours[index],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    FormConsumer(
                      onBack: () => Navigator.of(context).pop(state.hours),
                      onTap: (form) async {
                        final result = await Navigator.pushNamed(
                          context,
                          AddOpeningHoursPage.path,
                        ) as List<Map<String, String>>?;

                        if (result == null) return;

                        context
                            .read<PickDayCubit>()
                            .setOpeningHours(hours: result);
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
