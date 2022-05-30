import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_list_state.freezed.dart';

@freezed
class CategoriesListState with _$CategoriesListState {
  const factory CategoriesListState.unfocused(List<String> items) =
      UnfocusedCategoriesListState;

  const factory CategoriesListState.focused(List<String> items) =
      FocusedCategoriesListState;
}
