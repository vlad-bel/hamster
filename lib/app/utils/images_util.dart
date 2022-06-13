import 'dart:typed_data';

import 'package:business_terminal/domain/gateway/rest_client.dart';

///Provides image bytes of image uloaded from backend by filename
Future<Uint8List?> loadImage({
  required RestClient client,
  required String fileName,
}) async {
  final result = await client.getFileByName(fileName);
  if (result is Map<String, dynamic> && result['buffer'] != null) {
    final bytes = Uint8List.fromList(
      List<int>.from(result['buffer']!['data'] as List<dynamic>),
    );
    return bytes;
  }

  return null;
}
