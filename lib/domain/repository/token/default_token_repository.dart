import 'package:business_terminal/domain/repository/token/token_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: TokenRepository)
class DefaultTokenRepository extends TokenRepository {
  final String _accessTokenKey = 'access_token';
  final String _refreshTokenKey = 'refresh_token';

  final storage = const FlutterSecureStorage();
  // TODO: add apiRepository and implement refreshToken() later

  @override
  Future<String?> getAccessToken() async {
    final token = await storage.read(key: _accessTokenKey);
    return token;
  }

  @override
  Future<void> setAccessToken(String? token) async {
    await storage.write(
      key: _accessTokenKey,
      value: token,
    );
  }

  @override
  Future<String?> getRefreshToken() async {
    final token = await storage.read(key: _refreshTokenKey);
    return token;
  }

  @override
  Future<void> setRefreshToken(String? token) async {
    await storage.write(
      key: _refreshTokenKey,
      value: token,
    );
  }

  @override
  Future<void> refreshAccessToken(String? refreshToken) {
    // TODO: add apiRepository and implement refreshToken() later
    throw UnimplementedError();
  }


}
