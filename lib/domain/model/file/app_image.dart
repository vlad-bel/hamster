import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_image.freezed.dart';

///Image representation. It could be image path or file
@freezed
class AppImage with _$AppImage {
  const factory AppImage.network(String path) = _$Network;

  const factory AppImage.file(AppFile file) = _$File;
}
