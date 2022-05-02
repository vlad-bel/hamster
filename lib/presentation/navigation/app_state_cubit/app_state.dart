part of 'app_state_cubit.dart';

@immutable
abstract class AppState extends Equatable {
  final RouteMap routeMap;

  const AppState({required this.routeMap});

  @override
  List<Object?> get props => [routeMap];
}

class UnauthorizedState extends AppState {
  UnauthorizedState()
      : super(
          routeMap: AuthRouteMap(),
        );
}
