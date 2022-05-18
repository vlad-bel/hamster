// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/gateway/rest_client.dart' as _i6;
import '../domain/repository/token/default_token_repository.dart' as _i14;
import '../domain/repository/token/token_repository.dart' as _i13;
import '../presentation/common/snackbar_manager.dart' as _i12;
import '../presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart'
    as _i20;
import '../presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart'
    as _i21;
import '../presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart'
    as _i3;
import '../presentation/common/widgets/dashboard/widget/top_menu/menu_dropdown/cubit/menu_dropdown_cubit.dart'
    as _i9;
import '../presentation/company_creation/cubit/company_creation_cubit.dart'
    as _i27;
import '../presentation/dashboard/account_verification/cubit/account_verification_cubit.dart'
    as _i26;
import '../presentation/email_verification/cubit/email_verification_cubit.dart'
    as _i22;
import '../presentation/login/cubit/login_cubit.dart' as _i23;
import '../presentation/number_verification/call_method_selector_page/bloc/call_method_selector_page_cubit.dart'
    as _i17;
import '../presentation/number_verification/country_code/cubit/country_code_cubit.dart'
    as _i28;
import '../presentation/number_verification/number_code_confirmation/cubit/number_code_confirmation_cubit.dart'
    as _i24;
import '../presentation/registration/cubit/user_info_init_cubit.dart' as _i25;
import '../use_cases/company/company_use_case.dart' as _i18;
import '../use_cases/company/company_use_case_impl.dart' as _i19;
import '../use_cases/login/login_use_case.dart' as _i7;
import '../use_cases/login/login_use_case_impl.dart' as _i8;
import '../use_cases/number_verification/number_verification_use_case.dart'
    as _i10;
import '../use_cases/number_verification/number_verification_use_case_impl.dart'
    as _i11;
import '../use_cases/registration/email_verification/default_email_verification.dart'
    as _i5;
import '../use_cases/registration/email_verification/email_verification.dart'
    as _i4;
import '../use_cases/registration/user_info_init/default_user_info_init.dart'
    as _i16;
import '../use_cases/registration/user_info_init/user_info_init.dart'
    as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.DashboardCubit>(_i3.DashboardCubit());
  gh.singleton<_i4.EmailVerificationUseCase>(
      _i5.DefaultEmailVerificationUseCase(get<_i6.RestClient>()));
  gh.singleton<_i7.LoginUseCase>(_i8.LoginUseCaseImpl(get<_i6.RestClient>()));
  gh.singleton<_i9.MenuDropdownCubit>(_i9.MenuDropdownCubit());
  gh.singleton<_i10.NumberVerificationUseCase>(
      _i11.NumberVerificationUseCaseImpl(repository: get<_i6.RestClient>()));
  gh.singleton<_i12.SnackBarManager>(_i12.SnackBarManager());
  gh.singleton<_i13.TokenRepository>(_i14.DefaultTokenRepository());
  gh.singleton<_i15.UserInfoInitUseCase>(
      _i16.DefaultUserInfoInitUseCase(get<_i6.RestClient>()));
  gh.singleton<_i17.CallMethodSelectorPageCubit>(
      _i17.CallMethodSelectorPageCubit(
          useCase: get<_i10.NumberVerificationUseCase>()));
  gh.singleton<_i18.CompanyUsecase>(_i19.CompanyUseCaseImpl(
      get<_i6.RestClient>(), get<_i13.TokenRepository>()));
  gh.singleton<_i20.CountryCodeSelectorCubit>(_i20.CountryCodeSelectorCubit(
      useCase: get<_i10.NumberVerificationUseCase>()));
  gh.singleton<_i21.CountrySelectorCubit>(_i21.CountrySelectorCubit(
      useCase: get<_i10.NumberVerificationUseCase>()));
  gh.factory<_i22.EmailVerificationCubit>(
      () => _i22.EmailVerificationCubit(get<_i4.EmailVerificationUseCase>()));
  gh.factory<_i23.LoginCubit>(() =>
      _i23.LoginCubit(get<_i7.LoginUseCase>(), get<_i13.TokenRepository>()));
  gh.factory<_i24.NumberCodeConfirmationCubit>(() =>
      _i24.NumberCodeConfirmationCubit(
          useCase: get<_i10.NumberVerificationUseCase>()));
  gh.factory<_i25.UserInfoInitCubit>(
      () => _i25.UserInfoInitCubit(get<_i15.UserInfoInitUseCase>()));
  gh.singleton<_i26.AccountVerificationCubit>(_i26.AccountVerificationCubit(
      companyUsecase: get<_i18.CompanyUsecase>(),
      dashboardCubit: get<_i3.DashboardCubit>()));
  gh.factory<_i27.CompanyCreationCubit>(() => _i27.CompanyCreationCubit(
      usecase: get<_i18.CompanyUsecase>(),
      accountVerificationCubit: get<_i26.AccountVerificationCubit>()));
  gh.factory<_i28.CountryCodeCubit>(() => _i28.CountryCodeCubit(
      useCase: get<_i10.NumberVerificationUseCase>(),
      codeSelectorCubit: get<_i20.CountryCodeSelectorCubit>()));
  return get;
}
