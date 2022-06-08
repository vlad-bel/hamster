import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/presentation/categories/cubit/subcategories_state.dart';
import 'package:business_terminal/use_cases/company/company_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class SubcategoriesCubit extends Cubit<SubcategoriesState> {
  SubcategoriesCubit({
    required this.companyUsecase,
  }) : super(
          const SubcategoriesState.loading(),
        );

  final CompanyUsecase companyUsecase;

  Future loadCategories() async {
    emit(const SubcategoriesState.loading());
    try {
      final categories = await companyUsecase.getCategories();
      emit(
        SubcategoriesState.init(
          selectedCategory: '',
          selectedSubcategories: [],
          categories: categories,
        ),
      );
    } on ApiFailure catch (e) {
      emit(SubcategoriesState.error(e));
    }
  }

  void selectCategory(String category) {
    state.whenOrNull(
      init: (selectedCategory, categories, selectedSubcategories) {
        final selectedCategory = categories.firstWhere(
          (element) => element == category,
        );

        emit(
          SubcategoriesState.init(
            selectedCategory: selectedCategory,
            selectedSubcategories: selectedSubcategories,
            categories: categories,
          ),
        );
      },
    );
  }

  void selectSubcategory(String category) {
    state.whenOrNull(
      init: (selectedCategory, categories, _selectedSubcategories) {
        final item = categories.firstWhere((element) => element == category);
        final selectedSubcategories = List.of(_selectedSubcategories)
          ..add(item);

        emit(
          SubcategoriesState.init(
            selectedCategory: selectedCategory,
            selectedSubcategories: selectedSubcategories,
            categories: categories,
          ),
        );
      },
    );
  }

  void removeSelectedSubcategory(int index) {
    state.whenOrNull(
      init: (selectedCategory, categories, _selectedSubcategories) {
        final selectedSubcategories = List<String>.of(_selectedSubcategories)
          ..removeAt(index);

        emit(
          SubcategoriesState.init(
            selectedCategory: selectedCategory,
            selectedSubcategories: selectedSubcategories,
            categories: categories,
          ),
        );
      },
    );
  }
}
