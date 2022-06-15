import 'package:business_terminal/domain/model/login/login_request.dart';
import 'package:business_terminal/use_cases/company/company_use_case.dart';

///Usecase for login and logout logic
abstract class LoginUseCase {
  ///Login by email and password
  ///Updates tokens in secure storate
  Future<void> login(LoginRequest request);

  ///Logout by token
  ///Clears tokens in secure storage
  ///Disposes rest client
  ///Disposes [CompanyUsecase] cached data
  Future<void> logout();
}
