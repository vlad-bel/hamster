import 'dart:io';

import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/domain/model/formdata/app_file_form_data.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class PersonalAvatarRepository {
  final Dio _client;

  PersonalAvatarRepository(this._client);

  Future uploadAvatar(AppFile appFile) async {
    final formData = AppFileFormData(
      formData: FormData(),
      appFile: appFile,
    );

    await _client.put('rep/', data: {'file': formData});
  }
}
