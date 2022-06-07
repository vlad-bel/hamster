import 'dart:typed_data';

import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:flutter/material.dart';

class AppNetworkImageWidget extends StatefulWidget {
  const AppNetworkImageWidget({
    Key? key,
    required this.fileName,
  }) : super(key: key);

  final String fileName;

  @override
  State<AppNetworkImageWidget> createState() => _AppNetworkImageWidgetState();
}

class _AppNetworkImageWidgetState extends State<AppNetworkImageWidget> {
  Uint8List? imageBytes;

  @override
  void initState() {
    getNetworkImage(widget.fileName).then((value) {
      setState(() {
        imageBytes = value;
      });
    });
    super.initState();
  }

  Future<Uint8List?> getNetworkImage(
    String filename,
  ) async {
    final result = await getIt.get<RestClient>().getFileByName(filename)
        as Map<String, dynamic>;

    if (result['buffer'] != null) {
      return Uint8List.fromList(
        List<int>.from(result['buffer']!['data'] as List<dynamic>),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (imageBytes != null) {
      return Image.memory(imageBytes!);
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
