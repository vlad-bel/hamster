// ignore_for_file: unused_field

class ImagePaths {
  static final String brandLogoDenim = _assetPath('brand_logo_denim');

  static const String _logosPath = 'logos/';

  static String _assetPath(
    String fileName, [
    _ImageExtension imageExtension = _ImageExtension.svg,
  ]) =>
      '$_logosPath$fileName${imageExtension.extensionName}';
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
