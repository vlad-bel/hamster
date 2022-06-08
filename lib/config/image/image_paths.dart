// ignore_for_file: unused_field

part 'svg_paths.dart';

class ImagePaths {
  static const String _iconsPath = 'icons/';
  static const String _imagesPath = 'images/';
  static const String _logosPath = 'logos/';

  static String png(String name) => _assetPath(
        name,
        imageExtension: _ImageExtension.png,
      );

  static String jpg(String name) => _assetPath(
        name,
        imageExtension: _ImageExtension.jpg,
      );

  static String svg(String name) => _assetPath(name);

  static String svgLogo(String name) => _assetPath(
        name,
        path: _logosPath,
      );

  static String logo(String name) => _assetPath(
        name,
        path: _logosPath,
      );

  static String icon(String name) => _assetPath(
        name,
        path: _iconsPath,
      );

  static String _assetPath(
    String fileName, {
    _ImageExtension imageExtension = _ImageExtension.svg,
    String path = _imagesPath,
  }) =>
      'assets/$path$fileName${imageExtension.extensionName}';
}

enum _ImageExtension {
  svg('svg'),
  png('png'),
  jpg('jpg');

  const _ImageExtension(this._type);

  final String _type;

  String get extensionName {
    return '.$_type';
  }
}
