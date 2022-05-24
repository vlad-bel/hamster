import 'package:business_terminal/presentation/categories/subcategories/cubit/subcategories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class SubcategoriesCubit extends Cubit<SubcategoriesState> {
  SubcategoriesCubit()
      : super(
          SubcategoriesState.init(
            subcategories: [
              "subcategory1",
              "subcategory2",
              "subcategory3",
              "subcategory4",
              "subcategory5",
            ],
            selectedSubcategories: [],
          ),
        );

  void selectSubcategory(int index) {
    final item = state.subcategories?[index] ?? '';
    final selectedSubcategories = List.of(state.selectedSubcategories)
      ..add(item);

    emit(
      SubcategoriesState.init(
        selectedSubcategories: selectedSubcategories,
        subcategories: state.subcategories,
      ),
    );
  }

  void removeSelectedSubcategory(int index) {
    final selectedSubcategories = List<String>.of(state.selectedSubcategories)
      ..removeAt(index);

    emit(
      SubcategoriesState.init(
        selectedSubcategories: selectedSubcategories,
        subcategories: state.subcategories,
      ),
    );
  }
}
