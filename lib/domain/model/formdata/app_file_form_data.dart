import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:dio/dio.dart';

class AppFileFormData {
  final FormData formData;
  List<AppFile> appFiles;

  AppFileFormData({
    required this.formData,
    required this.appFiles,
  });
}
