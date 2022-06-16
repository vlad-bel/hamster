import 'dart:io';

import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/domain/model/personal_data/change_personal_data_request.dart';
import 'package:business_terminal/domain/model/personal_data/personal_data.dart';
import 'package:business_terminal/domain/model/personal_data/personal_data_response.dart';
import 'package:business_terminal/domain/repository/change_personal_data_repository/personal_avatar_repository.dart';
import 'package:business_terminal/use_cases/edit_personal_data/edit_personal_data_use_case.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditPersonalDataUseCase)
class EditPersonalDataUseCaseImpl implements EditPersonalDataUseCase {
  final RestClient _client;
  final PersonalAvatarRepository _personalAvatarRepository;

  EditPersonalDataUseCaseImpl(this._client, this._personalAvatarRepository);

  @override
  Future<PersonalData> getPersonalData() async {
    try {
      final personalDataResponse = await _client.getPersonalData();

      final avatarFile =
          await _downloadAvatar(personalDataResponse.avatarFileName);

      return _getPersonalDataFromResponse(personalDataResponse, avatarFile);
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'getPersonalData',
      );
    }
  }

  PersonalData _getPersonalDataFromResponse(
    PersonalDataResponse response,
    AppFile? appFile,
  ) =>
      PersonalData(
        email: response.email,
        firstName: response.firstName,
        lastName: response.lastName,
        phone: response.phone,
        avatar: appFile,
      );

  Future<AppFile?> _downloadAvatar(String? avatarFileName) async {
    try {
      AppFile? avatarFile;

      if (avatarFileName != null && avatarFileName.isNotEmpty) {
        avatarFile = await _client.getAppFileByName(avatarFileName);
      }

      return avatarFile;
    } on DioError catch (_) {
      return null;
    }
  }

  @override
  Future updateAvatar(AppFile file) async {
    try {
      return await _personalAvatarRepository.uploadAvatar(file);
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'updateAvatar',
      );
    }
  }

  @override
  Future updatePersonalData(ChangePersonalDataRequest request) async {
    try {
      return await _client.uploadNameSurname(request.toJson());
    } on DioError catch (e) {
      throw ApiFailure(
        ApiFailureResponse.fromJson(e),
        'updatePersonalData',
      );
    }
  }
}
