import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_file.dart';

part 'app_image.freezed.dart';

///Image representation. It could be image path or file
@freezed
class AppImage with _$AppImage {
  const factory AppImage.network(String path) = _$Network;

  const factory AppImage.file(AppFile file) = _$File;
}
