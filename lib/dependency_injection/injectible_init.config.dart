// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/gateway/rest_client.dart' as _i6;
import '../domain/repository/token/default_token_repository.dart' as _i16;
import '../domain/repository/token/token_repository.dart' as _i15;
import '../presentation/add_payment/cubit/add_payment_cubit.dart' as _i3;
import '../presentation/common/snackbar_manager.dart' as _i14;
import '../presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart'
    as _i22;
import '../presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart'
    as _i23;
import '../presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart'
    as _i32;
import '../presentation/common/widgets/dashboard/widget/top_menu/menu_dropdown/cubit/menu_dropdown_cubit.dart'
    as _i9;
import '../presentation/company_creation/cubit/company_creation_cubit.dart'
    as _i35;
import '../presentation/dashboard/account_verification/cubit/account_verification_cubit.dart'
    as _i34;
import '../presentation/dashboard/profile/profile_edit/cubit/profile_edit_cubit.dart'
    as _i29;
import '../presentation/email_verification/cubit/email_verification_cubit.dart'
    as _i24;
import '../presentation/forgetpassword.dart/cubit/forget_password_cubit.dart'
    as _i25;
import '../presentation/login/cubit/login_cubit.dart' as _i33;
import '../presentation/number_verification/call_method_selector_page/bloc/call_method_selector_page_cubit.dart'
    as _i19;
import '../presentation/number_verification/country_code/cubit/country_code_cubit.dart'
    as _i31;
import '../presentation/number_verification/number_code_confirmation/cubit/number_code_confirmation_cubit.dart'
    as _i28;
import '../presentation/registration/cubit/user_info_init_cubit.dart' as _i30;
import '../use_cases/company/company_use_case.dart' as _i20;
import '../use_cases/company/company_use_case_impl.dart' as _i21;
import '../use_cases/forget_password/forget_password_use_case.dart' as _i7;
import '../use_cases/forget_password/forget_password_use_case_impl.dart' as _i8;
import '../use_cases/login/login_use_case.dart' as _i26;
import '../use_cases/login/login_use_case_impl.dart' as _i27;
import '../use_cases/number_verification/number_verification_use_case.dart'
    as _i10;
import '../use_cases/number_verification/number_verification_use_case_impl.dart'
    as _i11;
import '../use_cases/profile/profile_edit/profile_edit_use_case.dart' as _i12;
import '../use_cases/profile/profile_edit/profile_edit_use_case_impl.dart'
    as _i13;
import '../use_cases/registration/email_verification/default_email_verification.dart'
    as _i5;
import '../use_cases/registration/email_verification/email_verification.dart'
    as _i4;
import '../use_cases/registration/user_info_init/default_user_info_init.dart'
    as _i18;
import '../use_cases/registration/user_info_init/user_info_init.dart'
    as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AddPaymentCubit>(() => _i3.AddPaymentCubit());
  gh.singleton<_i4.EmailVerificationUseCase>(
      _i5.DefaultEmailVerificationUseCase(get<_i6.RestClient>()));
  gh.singleton<_i7.ForgetPasswordUseCase>(
      _i8.ForgetPasswordUseCaseImpl(get<_i6.RestClient>()));
  gh.singleton<_i9.MenuDropdownCubit>(_i9.MenuDropdownCubit());
  gh.singleton<_i10.NumberVerificationUseCase>(
      _i11.NumberVerificationUseCaseImpl(repository: get<_i6.RestClient>()));
  gh.singleton<_i12.ProfileEditUsecase>(_i13.ProfileEditUsecaseImpl());
  gh.singleton<_i14.SnackBarManager>(_i14.SnackBarManager());
  gh.singleton<_i15.TokenRepository>(_i16.DefaultTokenRepository());
  gh.singleton<_i17.UserInfoInitUseCase>(
      _i18.DefaultUserInfoInitUseCase(get<_i6.RestClient>()));
  gh.singleton<_i19.CallMethodSelectorPageCubit>(
      _i19.CallMethodSelectorPageCubit(
          useCase: get<_i10.NumberVerificationUseCase>()));
  gh.singleton<_i20.CompanyUsecase>(_i21.CompanyUseCaseImpl(
      get<_i6.RestClient>(), get<_i15.TokenRepository>()));
  gh.singleton<_i22.CountryCodeSelectorCubit>(_i22.CountryCodeSelectorCubit(
      useCase: get<_i10.NumberVerificationUseCase>()));
  gh.factory<_i23.CountrySelectorCubit>(() => _i23.CountrySelectorCubit(
      useCase: get<_i10.NumberVerificationUseCase>()));
  gh.factory<_i24.EmailVerificationCubit>(
      () => _i24.EmailVerificationCubit(get<_i4.EmailVerificationUseCase>()));
  gh.factory<_i25.ForgetPasswordCubit>(
      () => _i25.ForgetPasswordCubit(get<_i7.ForgetPasswordUseCase>()));
  gh.singleton<_i26.LoginUseCase>(_i27.LoginUseCaseImpl(
      get<_i6.RestClient>(), get<_i15.TokenRepository>()));
  gh.factory<_i28.NumberCodeConfirmationCubit>(() =>
      _i28.NumberCodeConfirmationCubit(
          useCase: get<_i10.NumberVerificationUseCase>()));
  gh.singleton<_i29.ProfileEditCubit>(_i29.ProfileEditCubit(
      profileEditUsecase: get<_i12.ProfileEditUsecase>()));
  gh.factory<_i30.UserInfoInitCubit>(
      () => _i30.UserInfoInitCubit(get<_i17.UserInfoInitUseCase>()));
  gh.singleton<_i31.CountryCodeCubit>(_i31.CountryCodeCubit(
      useCase: get<_i10.NumberVerificationUseCase>(),
      codeSelectorCubit: get<_i22.CountryCodeSelectorCubit>()));
  gh.singleton<_i32.DashboardCubit>(
      _i32.DashboardCubit(loginUseCase: get<_i26.LoginUseCase>()));
  gh.factory<_i33.LoginCubit>(() =>
      _i33.LoginCubit(get<_i26.LoginUseCase>(), get<_i20.CompanyUsecase>()));
  gh.singleton<_i34.AccountVerificationCubit>(_i34.AccountVerificationCubit(
      companyUsecase: get<_i20.CompanyUsecase>(),
      dashboardCubit: get<_i32.DashboardCubit>()));
  gh.factory<_i35.CompanyCreationCubit>(() => _i35.CompanyCreationCubit(
      usecase: get<_i20.CompanyUsecase>(),
      accountVerificationCubit: get<_i34.AccountVerificationCubit>(),
      loginUseCase: get<_i26.LoginUseCase>()));
  return get;
}
