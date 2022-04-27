import 'package:business_terminal/data/model/country/country.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

///todo add .env file
@RestApi(baseUrl: 'http://localhost:3003/api/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/rep/init-creation')
  Future<String> initUserInfoCreation(
    @Body() Map<String, dynamic> userInfoMap,
  );

  @GET('/common/countries')
  Future<Map<String, Country>> getCountries();
}
