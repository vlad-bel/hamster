// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/gateway/rest_client.dart' as _i5;
import '../domain/repository/token/default_token_repository.dart' as _i18;
import '../domain/repository/token/token_repository.dart' as _i17;
import '../presentation/common/snackbar_manager.dart' as _i16;
import '../presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart'
    as _i24;
import '../presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart'
    as _i25;
import '../presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart'
    as _i6;
import '../presentation/common/widgets/dashboard/widget/top_menu/menu_dropdown/cubit/menu_dropdown_cubit.dart'
    as _i13;
import '../presentation/company_creation/cubit/company_creation_cubit.dart'
    as _i23;
import '../presentation/dashboard/account_verification/cubit/account_verification_cubit.dart'
    as _i21;
import '../presentation/email_verification/cubit/email_verification_cubit.dart'
    as _i26;
import '../presentation/forgetpassword.dart/cubit/forget_password_cubit.dart'
    as _i27;
import '../presentation/login/cubit/login_cubit.dart' as _i28;
import '../presentation/number_verification/call_method_selector_page/bloc/call_method_selector_page_cubit.dart'
    as _i22;
import '../presentation/number_verification/country_code/cubit/country_code_cubit.dart'
    as _i31;
import '../presentation/number_verification/number_code_confirmation/cubit/number_code_confirmation_cubit.dart'
    as _i29;
import '../presentation/registration/cubit/user_info_init_cubit.dart' as _i30;
import '../use_cases/company/company_use_case.dart' as _i3;
import '../use_cases/company/company_use_case_impl.dart' as _i4;
import '../use_cases/forget_password/forget_password_use_case.dart' as _i9;
import '../use_cases/forget_password/forget_password_use_case_impl.dart'
    as _i10;
import '../use_cases/login/login_use_case.dart' as _i11;
import '../use_cases/login/login_use_case_impl.dart' as _i12;
import '../use_cases/number_verification/number_verification_use_case.dart'
    as _i14;
import '../use_cases/number_verification/number_verification_use_case_impl.dart'
    as _i15;
import '../use_cases/registration/email_verification/default_email_verification.dart'
    as _i8;
import '../use_cases/registration/email_verification/email_verification.dart'
    as _i7;
import '../use_cases/registration/user_info_init/default_user_info_init.dart'
    as _i20;
import '../use_cases/registration/user_info_init/user_info_init.dart'
    as _i19; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.CompanyUsecase>(
      _i4.CompanyUseCaseImpl(get<_i5.RestClient>()));
  gh.singleton<_i6.DashboardCubit>(_i6.DashboardCubit());
  gh.singleton<_i7.EmailVerificationUseCase>(
      _i8.DefaultEmailVerificationUseCase(get<_i5.RestClient>()));
  gh.singleton<_i9.ForgetPasswordUseCase>(
      _i10.ForgetPasswordUseCaseImpl(get<_i5.RestClient>()));
  gh.singleton<_i11.LoginUseCase>(_i12.LoginUseCaseImpl(get<_i5.RestClient>()));
  gh.singleton<_i13.MenuDropdownCubit>(_i13.MenuDropdownCubit());
  gh.singleton<_i14.NumberVerificationUseCase>(
      _i15.NumberVerificationUseCaseImpl(repository: get<_i5.RestClient>()));
  gh.singleton<_i16.SnackBarManager>(_i16.SnackBarManager());
  gh.singleton<_i17.TokenRepository>(_i18.DefaultTokenRepository());
  gh.singleton<_i19.UserInfoInitUseCase>(
      _i20.DefaultUserInfoInitUseCase(get<_i5.RestClient>()));
  gh.singleton<_i21.AccountVerificationCubit>(_i21.AccountVerificationCubit(
      companyUsecase: get<_i3.CompanyUsecase>(),
      dashboardCubit: get<_i6.DashboardCubit>()));
  gh.singleton<_i22.CallMethodSelectorPageCubit>(
      _i22.CallMethodSelectorPageCubit(
          useCase: get<_i14.NumberVerificationUseCase>()));
  gh.factory<_i23.CompanyCreationCubit>(() => _i23.CompanyCreationCubit(
      usecase: get<_i3.CompanyUsecase>(),
      accountVerificationCubit: get<_i21.AccountVerificationCubit>()));
  gh.singleton<_i24.CountryCodeSelectorCubit>(_i24.CountryCodeSelectorCubit(
      useCase: get<_i14.NumberVerificationUseCase>()));
  gh.singleton<_i25.CountrySelectorCubit>(_i25.CountrySelectorCubit(
      useCase: get<_i14.NumberVerificationUseCase>()));
  gh.factory<_i26.EmailVerificationCubit>(
      () => _i26.EmailVerificationCubit(get<_i7.EmailVerificationUseCase>()));
  gh.factory<_i27.ForgetPasswordCubit>(
      () => _i27.ForgetPasswordCubit(get<_i9.ForgetPasswordUseCase>()));
  gh.factory<_i28.LoginCubit>(() =>
      _i28.LoginCubit(get<_i11.LoginUseCase>(), get<_i17.TokenRepository>()));
  gh.factory<_i29.NumberCodeConfirmationCubit>(() =>
      _i29.NumberCodeConfirmationCubit(
          useCase: get<_i14.NumberVerificationUseCase>()));
  gh.factory<_i30.UserInfoInitCubit>(
      () => _i30.UserInfoInitCubit(get<_i19.UserInfoInitUseCase>()));
  gh.factory<_i31.CountryCodeCubit>(() => _i31.CountryCodeCubit(
      useCase: get<_i14.NumberVerificationUseCase>(),
      codeSelectorCubit: get<_i24.CountryCodeSelectorCubit>()));
  return get;
}
