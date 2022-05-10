import 'package:bloc/bloc.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/model/login/login_request.dart';
import 'package:business_terminal/domain/model/login/login_response.dart';
import 'package:business_terminal/use_cases/login/login_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._useCase)
      : super(
          const LoginState.initial(isWrongPasswordEmail: false),
        );
  final LoginUseCase _useCase;

  Future<void> login(String? email, String? password) async {
    try {
      emit(const LoginState.loading());

      final request = LoginRequest(
        email: email ?? '',
        password: password ?? '',
      );
      final response = await _useCase.login(request);

      final tempFixResponse = LoginResponse(
        accessToken: 'accessToken',
        refreshToken: 'refreshToken',
      );
      emit(LoginState.success(tempFixResponse));
    } on ApiFailure catch (e) {
      onErrorLogin(e);
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

  const factory LoginState.success(LoginResponse response) = SuccessLogin;

  const factory LoginState.wrongEmailPassword() = WrongEmailPasswordLogin;

  const factory LoginState.error(Failure failure) = ErrorLogin;
}
