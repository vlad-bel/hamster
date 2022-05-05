// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/gateway/rest_client.dart' as _i5;
import '../domain/repository/api_repository.dart' as _i3;
import '../domain/repository/rest_api_repository.dart' as _i4;
import '../presentation/common/snackbar_manager.dart' as _i16;
import '../presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart'
    as _i21;
import '../presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart'
    as _i6;
import '../presentation/common/widgets/dashboard/widget/top_menu/menu_dropdown/cubit/menu_dropdown_cubit.dart'
    as _i11;
import '../presentation/common/widgets/snackbar_manager.dart' as _i17;
import '../presentation/email_verification/cubit/email_verification_cubit.dart'
    as _i22;
import '../presentation/login/cubit/login_cubit.dart' as _i23;
import '../presentation/number_verification/call_method_selector_page/bloc/call_method_selector_page_cubit.dart'
    as _i20;
import '../presentation/number_verification/country_code/cubit/country_code_cubit.dart'
    as _i26;
import '../presentation/number_verification/number_code_confirmation/cubit/number_code_confirmation_cubit.dart'
    as _i24;
import '../presentation/registration/cubit/user_info_init_cubit.dart' as _i25;
import '../use_cases/login/login_use_case.dart' as _i9;
import '../use_cases/login/login_use_case_impl.dart' as _i10;
import '../use_cases/number_verification/number_verification_use_case.dart'
    as _i12;
import '../use_cases/number_verification/number_verification_use_case_impl.dart'
    as _i13;
import '../use_cases/registration/email_verification/default_email_verification.dart'
    as _i8;
import '../use_cases/registration/email_verification/default_resend_email_code.dart'
    as _i15;
import '../use_cases/registration/email_verification/email_verification.dart'
    as _i7;
import '../use_cases/registration/email_verification/resend_email_code.dart'
    as _i14;
import '../use_cases/registration/user_info_init/default_user_info_init.dart'
    as _i19;
import '../use_cases/registration/user_info_init/user_info_init.dart'
    as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.ApiRepository>(_i4.RestApiRepository(get<_i5.RestClient>()));
  gh.singleton<_i6.DashboardCubit>(_i6.DashboardCubit());
  gh.singleton<_i7.EmailVerificationUseCase>(
      _i8.DefaultEmailVerificationUseCase(get<_i3.ApiRepository>()));
  gh.singleton<_i9.LoginUseCase>(_i10.LoginUseCaseImpl(get<_i5.RestClient>()));
  gh.singleton<_i11.MenuDropdownCubit>(_i11.MenuDropdownCubit());
  gh.singleton<_i12.NumberVerificationUseCase>(
      _i13.NumberVerificationUseCaseImpl(repository: get<_i5.RestClient>()));
  gh.singleton<_i14.ResendEmailCodeUseCase>(
      _i15.DefaultResendEmailCodeUseCase(get<_i3.ApiRepository>()));
  gh.singleton<_i16.SnackBarManager>(_i16.SnackBarManager());
  gh.singleton<_i17.SnackBarManager>(_i17.SnackBarManager());
  gh.singleton<_i18.UserInfoInitUseCase>(
      _i19.DefaultUserInfoInitUseCase(get<_i3.ApiRepository>()));
  gh.singleton<_i20.CallMethodSelectorPageCubit>(
      _i20.CallMethodSelectorPageCubit(
          useCase: get<_i12.NumberVerificationUseCase>()));
  gh.singleton<_i21.CountryCodeSelectorCubit>(_i21.CountryCodeSelectorCubit(
      useCase: get<_i12.NumberVerificationUseCase>()));
  gh.factory<_i22.EmailVerificationCubit>(
      () => _i22.EmailVerificationCubit(get<_i7.EmailVerificationUseCase>()));
  gh.factory<_i23.LoginCubit>(() => _i23.LoginCubit(get<_i9.LoginUseCase>()));
  gh.factory<_i24.NumberCodeConfirmationCubit>(() =>
      _i24.NumberCodeConfirmationCubit(
          useCase: get<_i12.NumberVerificationUseCase>()));
  gh.factory<_i25.UserInfoInitCubit>(
      () => _i25.UserInfoInitCubit(get<_i18.UserInfoInitUseCase>()));
  gh.factory<_i26.CountryCodeCubit>(() => _i26.CountryCodeCubit(
      useCase: get<_i12.NumberVerificationUseCase>(),
      codeSelectorCubit: get<_i21.CountryCodeSelectorCubit>()));
  return get;
}
