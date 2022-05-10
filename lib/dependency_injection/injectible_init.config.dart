// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/gateway/rest_client.dart' as _i6;
import '../domain/repository/api_repository.dart' as _i4;
import '../domain/repository/rest_api_repository.dart' as _i5;
import '../presentation/common/snackbar_manager.dart' as _i17;
import '../presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart'
    as _i22;
import '../presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart'
    as _i7;
import '../presentation/common/widgets/dashboard/widget/top_menu/menu_dropdown/cubit/menu_dropdown_cubit.dart'
    as _i12;
import '../presentation/common/widgets/snackbar_manager.dart' as _i18;
import '../presentation/dashboard/account_verification/cubit/account_verification_cubit.dart'
    as _i3;
import '../presentation/email_verification/cubit/email_verification_cubit.dart'
    as _i23;
import '../presentation/login/cubit/login_cubit.dart' as _i24;
import '../presentation/number_verification/call_method_selector_page/bloc/call_method_selector_page_cubit.dart'
    as _i21;
import '../presentation/number_verification/country_code/cubit/country_code_cubit.dart'
    as _i27;
import '../presentation/number_verification/number_code_confirmation/cubit/number_code_confirmation_cubit.dart'
    as _i25;
import '../presentation/registration/cubit/user_info_init_cubit.dart' as _i26;
import '../use_cases/login/login_use_case.dart' as _i10;
import '../use_cases/login/login_use_case_impl.dart' as _i11;
import '../use_cases/number_verification/number_verification_use_case.dart'
    as _i13;
import '../use_cases/number_verification/number_verification_use_case_impl.dart'
    as _i14;
import '../use_cases/registration/email_verification/default_email_verification.dart'
    as _i9;
import '../use_cases/registration/email_verification/default_resend_email_code.dart'
    as _i16;
import '../use_cases/registration/email_verification/email_verification.dart'
    as _i8;
import '../use_cases/registration/email_verification/resend_email_code.dart'
    as _i15;
import '../use_cases/registration/user_info_init/default_user_info_init.dart'
    as _i20;
import '../use_cases/registration/user_info_init/user_info_init.dart'
    as _i19; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AccountVerificationCubit>(
      () => _i3.AccountVerificationCubit());
  gh.singleton<_i4.ApiRepository>(_i5.RestApiRepository(get<_i6.RestClient>()));
  gh.singleton<_i7.DashboardCubit>(_i7.DashboardCubit());
  gh.singleton<_i8.EmailVerificationUseCase>(
      _i9.DefaultEmailVerificationUseCase(get<_i4.ApiRepository>()));
  gh.singleton<_i10.LoginUseCase>(_i11.LoginUseCaseImpl(get<_i6.RestClient>()));
  gh.singleton<_i12.MenuDropdownCubit>(_i12.MenuDropdownCubit());
  gh.singleton<_i13.NumberVerificationUseCase>(
      _i14.NumberVerificationUseCaseImpl(repository: get<_i6.RestClient>()));
  gh.singleton<_i15.ResendEmailCodeUseCase>(
      _i16.DefaultResendEmailCodeUseCase(get<_i4.ApiRepository>()));
  gh.singleton<_i17.SnackBarManager>(_i17.SnackBarManager());
  gh.singleton<_i18.SnackBarManager>(_i18.SnackBarManager());
  gh.singleton<_i19.UserInfoInitUseCase>(
      _i20.DefaultUserInfoInitUseCase(get<_i4.ApiRepository>()));
  gh.singleton<_i21.CallMethodSelectorPageCubit>(
      _i21.CallMethodSelectorPageCubit(
          useCase: get<_i13.NumberVerificationUseCase>()));
  gh.singleton<_i22.CountryCodeSelectorCubit>(_i22.CountryCodeSelectorCubit(
      useCase: get<_i13.NumberVerificationUseCase>()));
  gh.factory<_i23.EmailVerificationCubit>(
      () => _i23.EmailVerificationCubit(get<_i8.EmailVerificationUseCase>()));
  gh.factory<_i24.LoginCubit>(() => _i24.LoginCubit(get<_i10.LoginUseCase>()));
  gh.factory<_i25.NumberCodeConfirmationCubit>(() =>
      _i25.NumberCodeConfirmationCubit(
          useCase: get<_i13.NumberVerificationUseCase>()));
  gh.factory<_i26.UserInfoInitCubit>(
      () => _i26.UserInfoInitCubit(get<_i19.UserInfoInitUseCase>()));
  gh.factory<_i27.CountryCodeCubit>(() => _i27.CountryCodeCubit(
      useCase: get<_i13.NumberVerificationUseCase>(),
      codeSelectorCubit: get<_i22.CountryCodeSelectorCubit>()));
  return get;
}
