import 'package:business_terminal/domain/request_model/registration/user_info_request.dart';

///UseCase for creating new user for register
abstract class UserInfoInitUseCase {
  ///init registration process by user data
  Future<String> initUserInfoCreation(UserInfoRequest request);
}
