import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_state.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/dashboard_page.dart';
import 'package:business_terminal/presentation/common/widgets/header_app_bar/header_app_bar_widget.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_edit/cubit/profile_edit_cubit.dart';
import 'package:business_terminal/presentation/dashboard/profile/widget/profile_edit_content.dart';
import 'package:business_terminal/presentation/dashboard/profive_viewing/cubit/profile_viewing_cubit.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    BlocProvider.of<CountrySelectorCubit>(context);
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
                                  final repCompany = await profileEditCubit
                                      .companyUsecase
                                      .getRepCompany();
                                  final company = repCompany.company;

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
                                  current.maybeWhen(
                                initial: (_, __) => true,
                                orElse: () => false,
                              ),
                              builder: (context, state) {
                                return state.whenOrNull(
                                      initial:
                                          (company, profileEditFormSettings) =>
                                              ProfileEditContent(
                                        formSettings: profileEditFormSettings,
                                        company: company,
                                        countrySelectorCubit:
                                            countrySelectorCubit,
                                      ),
                                      loading: () {
                                        return const Center(
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
