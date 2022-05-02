import 'package:business_terminal/domain/request_model/registration/user_info_request.dart';

abstract class UserInfoInitUseCase {
  Future<String> initUserInfoCreation(UserInfoRequest request);
}