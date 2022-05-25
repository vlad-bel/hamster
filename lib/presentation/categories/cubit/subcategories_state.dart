import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subcategories_state.freezed.dart';

@freezed
class SubcategoriesState with _$SubcategoriesState {
  const factory SubcategoriesState.loading() = LoadingSubcategoriesState;

  const factory SubcategoriesState.init({
    required String selectedCategory,
    required List<String> categories,
    required List<String> selectedSubcategories,
  }) = InitSubcategoriesState;

  const factory SubcategoriesState.error(ApiFailure e) = ErrorSubcategoriesState;
}
