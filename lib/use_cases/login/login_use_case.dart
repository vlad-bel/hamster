import 'package:business_terminal/domain/model/login/login_request.dart';

abstract class LoginUseCase {
  Future<void> login(LoginRequest request);

  Future<void> logout();
}
