import 'dart:typed_data';

import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/presentation/common/widgets/app_image/app_network_image_widget/bloc/app_network_image_widget_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppNetworkImageWidgetCubit extends Cubit<AppNetworkImageWidgetState> {
  AppNetworkImageWidgetCubit(this._client)
      : super(
          const AppNetworkImageWidgetState.loading(),
        );

  final RestClient _client;

  Future<void> loadFile({required String fileName}) async {
    try {
      final result = await _client.getFileByName(fileName);
      if (result is Map<String, dynamic> && result['buffer'] != null) {
        final bytes = Uint8List.fromList(
          List<int>.from(result['buffer']!['data'] as List<dynamic>),
        );
        emit(
          AppNetworkImageWidgetState.success(
            bytes: bytes,
          ),
        );
      } else {
        emit(
          const AppNetworkImageWidgetState.error(
            title: 'Error',
          ),
        );
      }
    } on DioError catch (e, s) {
      logger.e('loadFile: $e ,$s');
      final errorMessage = e.response?.statusMessage.toString();
      if (e.response?.statusCode == 404) {
        emit(
          const AppNetworkImageWidgetState.notFound(),
        );
        return;
      } else {
        emit(
          AppNetworkImageWidgetState.error(
            title: '$errorMessage',
          ),
        );
      }
    } catch (e, s) {
      logger.e('loadFile: $e, $s');
    }
  }
}
