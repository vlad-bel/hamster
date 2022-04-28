import 'package:business_terminal/domain/repository/api_repository.dart';
import 'package:business_terminal/domain/request_model/registration/user_info_request.dart';
import 'package:business_terminal/use_cases/registration/user_info_init/user_info_init.dart';

class DefaultUserInfoInitUseCase implements UserInfoInitUseCase {
  DefaultUserInfoInitUseCase(this.apiService);

  final ApiRepository apiService;

  @override
  Future<String> initUserInfoCreation(UserInfoRequest request) async {
    final response = await apiService.initUserInfoCreation(request);

    return response;
  }
}
