import 'package:business_terminal/presentation/branch_profile_avatar_picture/cubit/branch_profile_avatar_picture_cubit.dart';
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
    List<PictureModel> pictureModels,
  ) async {
    final formData = FormData();
    for (final pictureModel in pictureModels) {
      final multipartFile = MultipartFile.fromBytes(
        pictureModel.imageBytes,
        filename: pictureModel.imageFile.name,
        contentType: MediaType(
          'image',
          pictureModel.imageFile.mimeType!,
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
