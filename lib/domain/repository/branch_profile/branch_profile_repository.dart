import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/domain/model/formdata/app_file_form_data.dart';
import 'package:business_terminal/network/api_manager.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class BranchProfileRepository {
  BranchProfileRepository();

  Future<Response> uloadBranchProfilePictures(
    List<AppFile> pictureFiles,
  ) async {
    final formData = AppFilesFormData(
      formData: FormData(),
      appFiles: pictureFiles,
    );

    final response = await dio.post(
      '/branch/pictures',
      data: {appFileFormDataKey: formData},
    );

    return response;
  }
}
