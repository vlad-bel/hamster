import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'http://localhost:3003/api')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;


//endregion
}
