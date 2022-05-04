// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/gateway/rest_client.dart' as _i5;
import '../domain/repository/api_repository.dart' as _i3;
import '../domain/repository/rest_api_repository.dart' as _i4;
import '../presentation/common/snackbar_manager.dart' as _i14;
import '../presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart'
    as _i19;
import '../presentation/common/widgets/snackbar_manager.dart' as _i15;
import '../presentation/email_verification/cubit/email_verification_cubit.dart'
    as _i20;
import '../presentation/login/cubit/login_cubit.dart' as _i21;
import '../presentation/number_verification/call_method_selector_page/bloc/call_method_selector_page_cubit.dart'
    as _i18;
import '../presentation/number_verification/country_code/cubit/country_code_cubit.dart'
    as _i24;
import '../presentation/number_verification/number_code_confirmation/cubit/number_code_confirmation_cubit.dart'
    as _i22;
import '../presentation/registration/cubit/user_info_init_cubit.dart' as _i23;
import '../use_cases/login/login_use_case.dart' as _i8;
import '../use_cases/login/login_use_case_impl.dart' as _i9;
import '../use_cases/number_verification/number_verification_use_case.dart'
    as _i10;
import '../use_cases/number_verification/number_verification_use_case_impl.dart'
    as _i11;
import '../use_cases/registration/email_verification/default_email_verification.dart'
    as _i7;
import '../use_cases/registration/email_verification/default_resend_email_code.dart'
    as _i13;
import '../use_cases/registration/email_verification/email_verification.dart'
    as _i6;
import '../use_cases/registration/email_verification/resend_email_code.dart'
    as _i12;
import '../use_cases/registration/user_info_init/default_user_info_init.dart'
    as _i17;
import '../use_cases/registration/user_info_init/user_info_init.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.ApiRepository>(_i4.RestApiRepository(get<_i5.RestClient>()));
  gh.singleton<_i6.EmailVerificationUseCase>(
      _i7.DefaultEmailVerificationUseCase(get<_i3.ApiRepository>()));
  gh.singleton<_i8.LoginUseCase>(_i9.LoginUseCaseImpl(get<_i5.RestClient>()));
  gh.singleton<_i10.NumberVerificationUseCase>(
      _i11.NumberVerificationUseCaseImpl(repository: get<_i5.RestClient>()));
  gh.singleton<_i12.ResendEmailCodeUseCase>(
      _i13.DefaultResendEmailCodeUseCase(get<_i3.ApiRepository>()));
  gh.singleton<_i14.SnackBarManager>(_i14.SnackBarManager());
  gh.singleton<_i15.SnackBarManager>(_i15.SnackBarManager());
  gh.singleton<_i16.UserInfoInitUseCase>(
      _i17.DefaultUserInfoInitUseCase(get<_i3.ApiRepository>()));
  gh.singleton<_i18.CallMethodSelectorPageCubit>(
      _i18.CallMethodSelectorPageCubit(
          useCase: get<_i10.NumberVerificationUseCase>()));
  gh.singleton<_i19.CountryCodeSelectorCubit>(_i19.CountryCodeSelectorCubit(
      useCase: get<_i10.NumberVerificationUseCase>()));
  gh.factory<_i20.EmailVerificationCubit>(
      () => _i20.EmailVerificationCubit(get<_i6.EmailVerificationUseCase>()));
  gh.factory<_i21.LoginCubit>(() => _i21.LoginCubit(get<_i8.LoginUseCase>()));
  gh.factory<_i22.NumberCodeConfirmationCubit>(() =>
      _i22.NumberCodeConfirmationCubit(
          useCase: get<_i10.NumberVerificationUseCase>()));
  gh.factory<_i23.UserInfoInitCubit>(
      () => _i23.UserInfoInitCubit(get<_i16.UserInfoInitUseCase>()));
  gh.factory<_i24.CountryCodeCubit>(() => _i24.CountryCodeCubit(
      useCase: get<_i10.NumberVerificationUseCase>(),
      codeSelectorCubit: get<_i19.CountryCodeSelectorCubit>()));
  return get;
}
