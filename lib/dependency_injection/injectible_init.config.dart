// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/gateway/rest_client.dart' as _i7;
import '../domain/repository/token/default_token_repository.dart' as _i18;
import '../domain/repository/token/token_repository.dart' as _i17;
import '../presentation/add_payment/cubit/add_payment_cubit.dart' as _i3;
import '../presentation/add_pos/cubit/add_pos_cubit.dart' as _i4;
import '../presentation/common/snackbar_manager.dart' as _i16;
import '../presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart'
    as _i24;
import '../presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart'
    as _i25;
import '../presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart'
    as _i34;
import '../presentation/common/widgets/dashboard/widget/top_menu/menu_dropdown/cubit/menu_dropdown_cubit.dart'
    as _i10;
import '../presentation/company_creation/cubit/company_creation_cubit.dart'
    as _i37;
import '../presentation/dashboard/account_verification/cubit/account_verification_cubit.dart'
    as _i36;
import '../presentation/dashboard/profile/profile_edit/cubit/profile_edit_cubit.dart'
    as _i31;
import '../presentation/dashboard/profile/profile_edit/form_validation/profile_edit_form_validation.dart'
    as _i13;
import '../presentation/email_verification/cubit/email_verification_cubit.dart'
    as _i26;
import '../presentation/forgetpassword.dart/cubit/forget_password_cubit.dart'
    as _i27;
import '../presentation/login/cubit/login_cubit.dart' as _i35;
import '../presentation/number_verification/call_method_selector_page/bloc/call_method_selector_page_cubit.dart'
    as _i21;
import '../presentation/number_verification/country_code/cubit/country_code_cubit.dart'
    as _i33;
import '../presentation/number_verification/number_code_confirmation/cubit/number_code_confirmation_cubit.dart'
    as _i30;
import '../presentation/registration/cubit/user_info_init_cubit.dart' as _i32;
import '../use_cases/company/company_use_case.dart' as _i22;
import '../use_cases/company/company_use_case_impl.dart' as _i23;
import '../use_cases/forget_password/forget_password_use_case.dart' as _i8;
import '../use_cases/forget_password/forget_password_use_case_impl.dart' as _i9;
import '../use_cases/login/login_use_case.dart' as _i28;
import '../use_cases/login/login_use_case_impl.dart' as _i29;
import '../use_cases/number_verification/number_verification_use_case.dart'
    as _i11;
import '../use_cases/number_verification/number_verification_use_case_impl.dart'
    as _i12;
import '../use_cases/profile/profile_edit/profile_edit_use_case.dart' as _i14;
import '../use_cases/profile/profile_edit/profile_edit_use_case_impl.dart'
    as _i15;
import '../use_cases/registration/email_verification/default_email_verification.dart'
    as _i6;
import '../use_cases/registration/email_verification/email_verification.dart'
    as _i5;
import '../use_cases/registration/user_info_init/default_user_info_init.dart'
    as _i20;
import '../use_cases/registration/user_info_init/user_info_init.dart'
    as _i19; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AddPaymentCubit>(() => _i3.AddPaymentCubit());
  gh.factory<_i4.AddPosCubit>(() => _i4.AddPosCubit());
  gh.singleton<_i5.EmailVerificationUseCase>(
      _i6.DefaultEmailVerificationUseCase(get<_i7.RestClient>()));
  gh.singleton<_i8.ForgetPasswordUseCase>(
      _i9.ForgetPasswordUseCaseImpl(get<_i7.RestClient>()));
  gh.singleton<_i10.MenuDropdownCubit>(_i10.MenuDropdownCubit());
  gh.singleton<_i11.NumberVerificationUseCase>(
      _i12.NumberVerificationUseCaseImpl(repository: get<_i7.RestClient>()));
  gh.singleton<_i13.ProfileEditFormSettings>(_i13.ProfileEditFormSettings());
  gh.singleton<_i14.ProfileEditUsecase>(
      _i15.ProfileEditUsecaseImpl(get<_i7.RestClient>()));
  gh.singleton<_i16.SnackBarManager>(_i16.SnackBarManager());
  gh.singleton<_i17.TokenRepository>(_i18.DefaultTokenRepository());
  gh.singleton<_i19.UserInfoInitUseCase>(
      _i20.DefaultUserInfoInitUseCase(get<_i7.RestClient>()));
  gh.singleton<_i21.CallMethodSelectorPageCubit>(
      _i21.CallMethodSelectorPageCubit(
          useCase: get<_i11.NumberVerificationUseCase>()));
  gh.singleton<_i22.CompanyUsecase>(_i23.CompanyUseCaseImpl(
      get<_i7.RestClient>(), get<_i17.TokenRepository>()));
  gh.singleton<_i24.CountryCodeSelectorCubit>(_i24.CountryCodeSelectorCubit(
      useCase: get<_i11.NumberVerificationUseCase>()));
  gh.factory<_i25.CountrySelectorCubit>(() => _i25.CountrySelectorCubit(
      useCase: get<_i11.NumberVerificationUseCase>()));
  gh.factory<_i26.EmailVerificationCubit>(
      () => _i26.EmailVerificationCubit(get<_i5.EmailVerificationUseCase>()));
  gh.factory<_i27.ForgetPasswordCubit>(
      () => _i27.ForgetPasswordCubit(get<_i8.ForgetPasswordUseCase>()));
  gh.singleton<_i28.LoginUseCase>(_i29.LoginUseCaseImpl(
      get<_i7.RestClient>(), get<_i17.TokenRepository>()));
  gh.factory<_i30.NumberCodeConfirmationCubit>(() =>
      _i30.NumberCodeConfirmationCubit(
          useCase: get<_i11.NumberVerificationUseCase>()));
  gh.singleton<_i31.ProfileEditCubit>(_i31.ProfileEditCubit(
      profileEditFormSettings: get<_i13.ProfileEditFormSettings>(),
      profileEditUsecase: get<_i14.ProfileEditUsecase>()));
  gh.factory<_i32.UserInfoInitCubit>(
      () => _i32.UserInfoInitCubit(get<_i19.UserInfoInitUseCase>()));
  gh.singleton<_i33.CountryCodeCubit>(_i33.CountryCodeCubit(
      useCase: get<_i11.NumberVerificationUseCase>(),
      codeSelectorCubit: get<_i24.CountryCodeSelectorCubit>()));
  gh.singleton<_i34.DashboardCubit>(
      _i34.DashboardCubit(loginUseCase: get<_i28.LoginUseCase>()));
  gh.factory<_i35.LoginCubit>(() =>
      _i35.LoginCubit(get<_i28.LoginUseCase>(), get<_i22.CompanyUsecase>()));
  gh.singleton<_i36.AccountVerificationCubit>(_i36.AccountVerificationCubit(
      companyUsecase: get<_i22.CompanyUsecase>(),
      dashboardCubit: get<_i34.DashboardCubit>()));
  gh.factory<_i37.CompanyCreationCubit>(() => _i37.CompanyCreationCubit(
      usecase: get<_i22.CompanyUsecase>(),
      accountVerificationCubit: get<_i36.AccountVerificationCubit>(),
      loginUseCase: get<_i28.LoginUseCase>()));
  return get;
}
