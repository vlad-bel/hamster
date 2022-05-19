// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/gateway/rest_client.dart' as _i6;
import '../domain/repository/token/default_token_repository.dart' as _i14;
import '../domain/repository/token/token_repository.dart' as _i13;
import '../presentation/add_payment/cubit/add_payment_cubit.dart' as _i3;
import '../presentation/common/snackbar_manager.dart' as _i12;
import '../presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart'
    as _i20;
import '../presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart'
    as _i21;
import '../presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart'
    as _i29;
import '../presentation/common/widgets/dashboard/widget/top_menu/menu_dropdown/cubit/menu_dropdown_cubit.dart'
    as _i7;
import '../presentation/company_creation/cubit/company_creation_cubit.dart'
    as _i32;
import '../presentation/dashboard/account_verification/cubit/account_verification_cubit.dart'
    as _i31;
import '../presentation/dashboard/profile/profile_edit/cubit/profile_edit_cubit.dart'
    as _i26;
import '../presentation/email_verification/cubit/email_verification_cubit.dart'
    as _i22;
import '../presentation/login/cubit/login_cubit.dart' as _i30;
import '../presentation/number_verification/call_method_selector_page/bloc/call_method_selector_page_cubit.dart'
    as _i17;
import '../presentation/number_verification/country_code/cubit/country_code_cubit.dart'
    as _i28;
import '../presentation/number_verification/number_code_confirmation/cubit/number_code_confirmation_cubit.dart'
    as _i25;
import '../presentation/registration/cubit/user_info_init_cubit.dart' as _i27;
import '../use_cases/company/company_use_case.dart' as _i18;
import '../use_cases/company/company_use_case_impl.dart' as _i19;
import '../use_cases/login/login_use_case.dart' as _i23;
import '../use_cases/login/login_use_case_impl.dart' as _i24;
import '../use_cases/number_verification/number_verification_use_case.dart'
    as _i8;
import '../use_cases/number_verification/number_verification_use_case_impl.dart'
    as _i9;
import '../use_cases/profile/profile_edit/profile_edit_use_case.dart' as _i10;
import '../use_cases/profile/profile_edit/profile_edit_use_case_impl.dart'
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
  gh.factory<_i3.AddPaymentCubit>(() => _i3.AddPaymentCubit());
  gh.singleton<_i4.EmailVerificationUseCase>(
      _i5.DefaultEmailVerificationUseCase(get<_i6.RestClient>()));
  gh.singleton<_i7.MenuDropdownCubit>(_i7.MenuDropdownCubit());
  gh.singleton<_i8.NumberVerificationUseCase>(
      _i9.NumberVerificationUseCaseImpl(repository: get<_i6.RestClient>()));
  gh.singleton<_i10.ProfileEditUsecase>(_i11.ProfileEditUsecaseImpl());
  gh.singleton<_i12.SnackBarManager>(_i12.SnackBarManager());
  gh.singleton<_i13.TokenRepository>(_i14.DefaultTokenRepository());
  gh.singleton<_i15.UserInfoInitUseCase>(
      _i16.DefaultUserInfoInitUseCase(get<_i6.RestClient>()));
  gh.singleton<_i17.CallMethodSelectorPageCubit>(
      _i17.CallMethodSelectorPageCubit(
          useCase: get<_i8.NumberVerificationUseCase>()));
  gh.singleton<_i18.CompanyUsecase>(_i19.CompanyUseCaseImpl(
      get<_i6.RestClient>(), get<_i13.TokenRepository>()));
  gh.singleton<_i20.CountryCodeSelectorCubit>(_i20.CountryCodeSelectorCubit(
      useCase: get<_i8.NumberVerificationUseCase>()));
  gh.singleton<_i21.CountrySelectorCubit>(
      _i21.CountrySelectorCubit(useCase: get<_i8.NumberVerificationUseCase>()));
  gh.factory<_i22.EmailVerificationCubit>(
      () => _i22.EmailVerificationCubit(get<_i4.EmailVerificationUseCase>()));
  gh.singleton<_i23.LoginUseCase>(_i24.LoginUseCaseImpl(
      get<_i6.RestClient>(), get<_i13.TokenRepository>()));
  gh.factory<_i25.NumberCodeConfirmationCubit>(() =>
      _i25.NumberCodeConfirmationCubit(
          useCase: get<_i8.NumberVerificationUseCase>()));
  gh.singleton<_i26.ProfileEditCubit>(_i26.ProfileEditCubit(
      profileEditUsecase: get<_i10.ProfileEditUsecase>()));
  gh.factory<_i27.UserInfoInitCubit>(
      () => _i27.UserInfoInitCubit(get<_i15.UserInfoInitUseCase>()));
  gh.factory<_i28.CountryCodeCubit>(() => _i28.CountryCodeCubit(
      useCase: get<_i8.NumberVerificationUseCase>(),
      codeSelectorCubit: get<_i20.CountryCodeSelectorCubit>()));
  gh.singleton<_i29.DashboardCubit>(
      _i29.DashboardCubit(get<_i23.LoginUseCase>()));
  gh.factory<_i30.LoginCubit>(() =>
      _i30.LoginCubit(get<_i23.LoginUseCase>(), get<_i18.CompanyUsecase>()));
  gh.singleton<_i31.AccountVerificationCubit>(_i31.AccountVerificationCubit(
      companyUsecase: get<_i18.CompanyUsecase>(),
      dashboardCubit: get<_i29.DashboardCubit>()));
  gh.factory<_i32.CompanyCreationCubit>(() => _i32.CompanyCreationCubit(
      usecase: get<_i18.CompanyUsecase>(),
      accountVerificationCubit: get<_i31.AccountVerificationCubit>(),
      loginUseCase: get<_i23.LoginUseCase>()));
  return get;
}
