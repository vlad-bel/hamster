import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/network/api_manager.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';

@injectable
class BranchProfileRepository {
  BranchProfileRepository();

  Future<Response> uloadBranchProfilePictures(
    List<AppFile> pictureFiles,
  ) async {
    final formData = FormData();
    cachedPictureFiles = pictureFiles;
    for (final pictureFile in pictureFiles) {
      final multipartFile = MultipartFile.fromBytes(
        pictureFile.bytes!,
        filename: pictureFile.name,
        contentType: MediaType(
          'image',
          'image/${pictureFile.extension}',
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
      '/branch/pictures',
      data: formData,
    );

    return response;
  }
}

///It's need for caching pictures
///for repeating send if request with multipart files
///ended with 401 error and need refresh tokens and resend it again
///Multipart files need to cache for secondary using
///Because multipart files finalized after creating
///and it's cannot be used again
///Are using in [ApiManager] on 90 line
List<AppFile>? cachedPictureFiles;
