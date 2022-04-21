import 'package:business_terminal/data/gateway/rest_client.dart';
import 'package:business_terminal/data/model/registration/user_info_request.dart';
import 'package:business_terminal/domain/repository/api_repository.dart';

class RestApiRepository extends ApiRepository {
  RestApiRepository(this._client);

  final RestClient _client;

  @override
  Future<String> initUserInfoCreation(UserInfoRequest request) async {
    final requestJson = request.toJson();
    final response = await _client.initUserInfoCreation(requestJson);

    return response;
  }
}
