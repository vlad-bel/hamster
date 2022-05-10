import 'package:business_terminal/domain/model/login/login_request.dart';
import 'package:business_terminal/domain/model/login/login_response.dart';

abstract class LoginUseCase {
  Future<String> login(LoginRequest request);
}
