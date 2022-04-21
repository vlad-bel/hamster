import 'package:business_terminal/data/model/registration/user_info_request.dart';

abstract class UserInfoInitUseCase {
  Future<String> initUserInfoCreation(UserInfoRequest request);
}