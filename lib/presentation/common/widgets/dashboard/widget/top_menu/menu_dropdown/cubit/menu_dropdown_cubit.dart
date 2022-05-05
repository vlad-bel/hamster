import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'menu_dropdown_cubit.freezed.dart';

@singleton
class MenuDropdownCubit extends Cubit<MenuDropdownState> {
  MenuDropdownCubit() : super(const MenuDropdownState.close());

  void closeMenu() {
    emit(const MenuDropdownState.close());
  }

  void openMenu() {
    emit(const MenuDropdownState.open());
  }
}

@freezed
class MenuDropdownState with _$MenuDropdownState {
  const factory MenuDropdownState.close() = CloseMenuDropdownState;

  const factory MenuDropdownState.open() = OpenMenuDropdownState;
}
