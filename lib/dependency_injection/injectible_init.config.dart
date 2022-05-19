// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/gateway/rest_client.dart' as _i7;
import '../domain/repository/token/default_token_repository.dart' as _i15;
import '../domain/repository/token/token_repository.dart' as _i14;
import '../presentation/add_payment/cubit/add_payment_cubit.dart' as _i3;
import '../presentation/common/snackbar_manager.dart' as _i13;
import '../presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart'
    as _i21;
import '../presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart'
    as _i22;
import '../presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart'
    as _i4;
import '../presentation/common/widgets/dashboard/widget/top_menu/menu_dropdown/cubit/menu_dropdown_cubit.dart'
    as _i10;
import '../presentation/company_creation/cubit/company_creation_cubit.dart'
    as _i28;
import '../presentation/dashboard/account_verification/cubit/account_verification_cubit.dart'
    as _i27;
import '../presentation/email_verification/cubit/email_verification_cubit.dart'
    as _i23;
import '../presentation/login/cubit/login_cubit.dart' as _i24;
import '../presentation/number_verification/call_method_selector_page/bloc/call_method_selector_page_cubit.dart'
    as _i18;
import '../presentation/number_verification/country_code/cubit/country_code_cubit.dart'
    as _i29;
import '../presentation/number_verification/number_code_confirmation/cubit/number_code_confirmation_cubit.dart'
    as _i25;
import '../presentation/registration/cubit/user_info_init_cubit.dart' as _i26;
import '../use_cases/company/company_use_case.dart' as _i19;
import '../use_cases/company/company_use_case_impl.dart' as _i20;
import '../use_cases/login/login_use_case.dart' as _i8;
import '../use_cases/login/login_use_case_impl.dart' as _i9;
import '../use_cases/number_verification/number_verification_use_case.dart'
    as _i11;
import '../use_cases/number_verification/number_verification_use_case_impl.dart'
    as _i12;
import '../use_cases/registration/email_verification/default_email_verification.dart'
    as _i6;
import '../use_cases/registration/email_verification/email_verification.dart'
    as _i5;
import '../use_cases/registration/user_info_init/default_user_info_init.dart'
    as _i17;
import '../use_cases/registration/user_info_init/user_info_init.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AddPaymentCubit>(() => _i3.AddPaymentCubit());
  gh.singleton<_i4.DashboardCubit>(_i4.DashboardCubit());
  gh.singleton<_i5.EmailVerificationUseCase>(
      _i6.DefaultEmailVerificationUseCase(get<_i7.RestClient>()));
  gh.singleton<_i8.LoginUseCase>(_i9.LoginUseCaseImpl(get<_i7.RestClient>()));
  gh.singleton<_i10.MenuDropdownCubit>(_i10.MenuDropdownCubit());
  gh.singleton<_i11.NumberVerificationUseCase>(
      _i12.NumberVerificationUseCaseImpl(repository: get<_i7.RestClient>()));
  gh.singleton<_i13.SnackBarManager>(_i13.SnackBarManager());
  gh.singleton<_i14.TokenRepository>(_i15.DefaultTokenRepository());
  gh.singleton<_i16.UserInfoInitUseCase>(
      _i17.DefaultUserInfoInitUseCase(get<_i7.RestClient>()));
  gh.singleton<_i18.CallMethodSelectorPageCubit>(
      _i18.CallMethodSelectorPageCubit(
          useCase: get<_i11.NumberVerificationUseCase>()));
  gh.singleton<_i19.CompanyUsecase>(_i20.CompanyUseCaseImpl(
      get<_i7.RestClient>(), get<_i14.TokenRepository>()));
  gh.singleton<_i21.CountryCodeSelectorCubit>(_i21.CountryCodeSelectorCubit(
      useCase: get<_i11.NumberVerificationUseCase>()));
  gh.singleton<_i22.CountrySelectorCubit>(_i22.CountrySelectorCubit(
      useCase: get<_i11.NumberVerificationUseCase>()));
  gh.factory<_i23.EmailVerificationCubit>(
      () => _i23.EmailVerificationCubit(get<_i5.EmailVerificationUseCase>()));
  gh.factory<_i24.LoginCubit>(() =>
      _i24.LoginCubit(get<_i8.LoginUseCase>(), get<_i14.TokenRepository>()));
  gh.factory<_i25.NumberCodeConfirmationCubit>(() =>
      _i25.NumberCodeConfirmationCubit(
          useCase: get<_i11.NumberVerificationUseCase>()));
  gh.factory<_i26.UserInfoInitCubit>(
      () => _i26.UserInfoInitCubit(get<_i16.UserInfoInitUseCase>()));
  gh.singleton<_i27.AccountVerificationCubit>(_i27.AccountVerificationCubit(
      companyUsecase: get<_i19.CompanyUsecase>(),
      dashboardCubit: get<_i4.DashboardCubit>()));
  gh.factory<_i28.CompanyCreationCubit>(() => _i28.CompanyCreationCubit(
      usecase: get<_i19.CompanyUsecase>(),
      accountVerificationCubit: get<_i27.AccountVerificationCubit>()));
  gh.factory<_i29.CountryCodeCubit>(() => _i29.CountryCodeCubit(
      useCase: get<_i11.NumberVerificationUseCase>(),
      codeSelectorCubit: get<_i21.CountryCodeSelectorCubit>()));
  return get;
}
