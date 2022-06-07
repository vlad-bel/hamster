import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';

@injectable
class BranchProfileRepository {
  BranchProfileRepository({
    required this.dio,
  });

  final Dio dio;

  Future<Response> uloadBranchProfilePictures(
    List<AppFile> pictureFiles,
  ) async {
    final formData = FormData();
    for (final pictureFile in pictureFiles) {
      final multipartFile = MultipartFile.fromBytes(
        pictureFile.bytes!,
        filename: pictureFile.name,
        contentType: MediaType(
          'image',
          'image/${pictureFile.getExtension}',
        ),
      );

      formData.files.add(
        MapEntry(
          'files',
          multipartFile,
        ),
      );
    }

    final response = await dio.post(
      'http://localhost:3003/api/branch/pictures',
      data: formData,
    );

    return response;
  }
}
