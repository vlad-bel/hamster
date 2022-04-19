import 'package:business_terminal/data/model/registration/user_info_request.dart';
import 'package:business_terminal/domain/repository/api_repository.dart';

class DefaultUserInfoInitUseCase implements UserInfoInitUseCase {

  DefaultUserInfoInitUseCase(this.apiService);

  final ApiRepository apiService;

  @override
  Future<String> initUserInfoCreation(UserInfoRequest request) {
    // TODO: implement initUserInfoCreation
    throw UnimplementedError();
  }
}

abstract class UserInfoInitUseCase {
  Future<String> initUserInfoCreation(UserInfoRequest request);
}
