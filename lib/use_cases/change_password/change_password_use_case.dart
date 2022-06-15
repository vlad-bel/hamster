import 'package:business_terminal/domain/request_model/change_password/change_password_request.dart';

// UseCase that uses for change password flow
abstract class ChangePasswordUseCase {
  Future changePassword(ChangePasswordRequest request);
}
