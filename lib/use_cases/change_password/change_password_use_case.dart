import 'package:business_terminal/domain/request_model/change_password/change_password_request.dart';

// ignore: one_member_abstracts
abstract class ChangePasswordUseCase {
  Future changePassword(ChangePasswordRequest request);
}
