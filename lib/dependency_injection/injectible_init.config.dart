// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/gateway/rest_client.dart' as _i6;
import '../domain/repository/api_repository.dart' as _i4;
import '../domain/repository/rest_api_repository.dart' as _i5;
import '../presentation/common/snackbar_manager.dart' as _i19;
import '../presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart'
    as _i25;
import '../presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart'
    as _i26;
import '../presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart'
    as _i9;
import '../presentation/common/widgets/dashboard/widget/top_menu/menu_dropdown/cubit/menu_dropdown_cubit.dart'
    as _i14;
import '../presentation/common/widgets/snackbar_manager.dart' as _i20;
import '../presentation/company_creation/cubit/company_creation_cubit.dart'
    as _i24;
import '../presentation/dashboard/account_verification/cubit/account_verification_cubit.dart'
    as _i3;
import '../presentation/email_verification/cubit/email_verification_cubit.dart'
    as _i27;
import '../presentation/login/cubit/login_cubit.dart' as _i28;
import '../presentation/number_verification/call_method_selector_page/bloc/call_method_selector_page_cubit.dart'
    as _i23;
import '../presentation/number_verification/country_code/cubit/country_code_cubit.dart'
    as _i31;
import '../presentation/number_verification/number_code_confirmation/cubit/number_code_confirmation_cubit.dart'
    as _i29;
import '../presentation/registration/cubit/user_info_init_cubit.dart' as _i30;
import '../use_cases/company/company_use_case.dart' as _i7;
import '../use_cases/company/company_use_case_impl.dart' as _i8;
import '../use_cases/login/login_use_case.dart' as _i12;
import '../use_cases/login/login_use_case_impl.dart' as _i13;
import '../use_cases/number_verification/number_verification_use_case.dart'
    as _i15;
import '../use_cases/number_verification/number_verification_use_case_impl.dart'
    as _i16;
import '../use_cases/registration/email_verification/default_email_verification.dart'
    as _i11;
import '../use_cases/registration/email_verification/default_resend_email_code.dart'
    as _i18;
import '../use_cases/registration/email_verification/email_verification.dart'
    as _i10;
import '../use_cases/registration/email_verification/resend_email_code.dart'
    as _i17;
import '../use_cases/registration/user_info_init/default_user_info_init.dart'
    as _i22;
import '../use_cases/registration/user_info_init/user_info_init.dart'
    as _i21; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AccountVerificationCubit>(
      () => _i3.AccountVerificationCubit());
  gh.singleton<_i4.ApiRepository>(_i5.RestApiRepository(get<_i6.RestClient>()));
  gh.singleton<_i7.CompanyUsecase>(
      _i8.CompanyUseCaseImpl(get<_i6.RestClient>()));
  gh.singleton<_i9.DashboardCubit>(_i9.DashboardCubit());
  gh.singleton<_i10.EmailVerificationUseCase>(
      _i11.DefaultEmailVerificationUseCase(get<_i4.ApiRepository>()));
  gh.singleton<_i12.LoginUseCase>(_i13.LoginUseCaseImpl(get<_i6.RestClient>()));
  gh.singleton<_i14.MenuDropdownCubit>(_i14.MenuDropdownCubit());
  gh.singleton<_i15.NumberVerificationUseCase>(
      _i16.NumberVerificationUseCaseImpl(repository: get<_i6.RestClient>()));
  gh.singleton<_i17.ResendEmailCodeUseCase>(
      _i18.DefaultResendEmailCodeUseCase(get<_i4.ApiRepository>()));
  gh.singleton<_i19.SnackBarManager>(_i19.SnackBarManager());
  gh.singleton<_i20.SnackBarManager>(_i20.SnackBarManager());
  gh.singleton<_i21.UserInfoInitUseCase>(
      _i22.DefaultUserInfoInitUseCase(get<_i4.ApiRepository>()));
  gh.singleton<_i23.CallMethodSelectorPageCubit>(
      _i23.CallMethodSelectorPageCubit(
          useCase: get<_i15.NumberVerificationUseCase>()));
  gh.factory<_i24.CompanyCreationCubit>(
      () => _i24.CompanyCreationCubit(usecase: get<_i7.CompanyUsecase>()));
  gh.singleton<_i25.CountryCodeSelectorCubit>(_i25.CountryCodeSelectorCubit(
      useCase: get<_i15.NumberVerificationUseCase>()));
  gh.singleton<_i26.CountrySelectorCubit>(_i26.CountrySelectorCubit(
      useCase: get<_i15.NumberVerificationUseCase>()));
  gh.factory<_i27.EmailVerificationCubit>(
      () => _i27.EmailVerificationCubit(get<_i10.EmailVerificationUseCase>()));
  gh.factory<_i28.LoginCubit>(() => _i28.LoginCubit(get<_i12.LoginUseCase>()));
  gh.factory<_i29.NumberCodeConfirmationCubit>(() =>
      _i29.NumberCodeConfirmationCubit(
          useCase: get<_i15.NumberVerificationUseCase>()));
  gh.factory<_i30.UserInfoInitCubit>(
      () => _i30.UserInfoInitCubit(get<_i21.UserInfoInitUseCase>()));
  gh.factory<_i31.CountryCodeCubit>(() => _i31.CountryCodeCubit(
      useCase: get<_i15.NumberVerificationUseCase>(),
      codeSelectorCubit: get<_i25.CountryCodeSelectorCubit>()));
  return get;
}
