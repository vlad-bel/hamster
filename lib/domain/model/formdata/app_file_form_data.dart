import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:dio/dio.dart';

class AppFilesFormData {
  final FormData formData;
  List<AppFile> appFiles;

  AppFilesFormData({
    required this.formData,
    required this.appFiles,
  });
}

class AppFileFormData {
  final FormData formData;
  AppFile appFile;

  AppFileFormData({
    required this.formData,
    required this.appFile,
  });
}
