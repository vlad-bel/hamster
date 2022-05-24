import 'package:freezed_annotation/freezed_annotation.dart';

part 'subcategories_state.freezed.dart';

@freezed
class SubcategoriesState with _$SubcategoriesState {
  const factory SubcategoriesState.init({
    List<String>? subcategories,
    required List<String> selectedSubcategories,
  }) = InitSubcategoriesState;
}
