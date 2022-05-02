import 'package:business_terminal/presentation/navigation/auth_map.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:routemaster/routemaster.dart';

part '../app_state_cubit/app_state.dart';

class AppStateCubit extends Cubit<AppState> {
  AppStateCubit() : super(UnauthorizedState());
}
