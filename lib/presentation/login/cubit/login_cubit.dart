import 'package:bloc/bloc.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/model/login/login_request.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/dashboard_page.dart';
import 'package:business_terminal/presentation/company_creation/company_creation_page.dart';
import 'package:business_terminal/use_cases/company/company_use_case.dart';
import 'package:business_terminal/use_cases/login/login_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._useCase,
    this._companyUsecase,
  ) : super(
          const LoginState.initial(isWrongPasswordEmail: false),
        );
  final LoginUseCase _useCase;
  final CompanyUsecase _companyUsecase;

  Future<void> login(String? email, String? password) async {
    try {
      emit(const LoginState.loading());

      await _useCase.login(
        LoginRequest(
          email: email,
          password: password,
        ),
      );

      await checkCompanyCreatedGoNext();
    } on ApiFailure catch (e) {
      onErrorLogin(e);
    }
  }

  Future<void> checkCompanyCreatedGoNext() async {
    try {
      final repCompany = await _companyUsecase.fetchRepCompany();

      if (repCompany.company != null) {
        return emit(LoginState.success(DashboardPage.path));
      }

      return emit(LoginState.success(CompanyCreationPage.path));
    } on ApiFailure catch (e) {
      ///TODO change logic from backend
      ///now when company is not created
      ///it's returns to front 500 error
      ///need to more specify error for that case
      if (e.response.statusCode == 404) {
        return emit(LoginState.success(CompanyCreationPage.path));
      }

      return emit(LoginState.error(e));
    }
  }

  void onErrorLogin(ApiFailure e) {
    if (e.response.statusCode == 401) {
      emit(const LoginState.initial(isWrongPasswordEmail: true));
    } else {
      logger.e(e);
      emit(LoginState.error(e));
    }
  }
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial({
    required bool isWrongPasswordEmail,
  }) = InitialLogin;

  const factory LoginState.loading() = LoadingLogin;

  const factory LoginState.success(String path) = SuccessLogin;

  const factory LoginState.wrongEmailPassword() = WrongEmailPasswordLogin;

  const factory LoginState.error(ApiFailure failure) = ErrorLogin;
}
