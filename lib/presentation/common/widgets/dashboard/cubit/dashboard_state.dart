import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.init({
    int? testCount,
    bool? finansenOpen,
    bool? administrationOpen,
  }) = InitDashboardState;
}
