import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_network_image_widget_state.freezed.dart';

@freezed
class AppNetworkImageWidgetState with _$AppNetworkImageWidgetState {
  const factory AppNetworkImageWidgetState.error({
    required String title,
  }) = _$AppNetworkImageWidgetErrorState;

  const factory AppNetworkImageWidgetState.loading() =
      _$AppNetworkImageWidgetLoadingState;

  const factory AppNetworkImageWidgetState.notFound() =
      _$AppNetworkImageWidgetNotFoundState;

  const factory AppNetworkImageWidgetState.success({
    required Uint8List bytes,
  }) = _$AppNetworkImageWidgetSuccessState;
}
