import 'package:business_terminal/presentation/common/widgets/categories_list/cubit/categories_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class CategoriesListCubit extends Cubit<CategoriesListState> {
  CategoriesListCubit({
    required this.items,
  })  : cachedItems = items,
        super(CategoriesListState.unfocused(items)) {
    searchForm.control(searchFormField).valueChanges.listen(
      (event) {
        emit(
          CategoriesListState.focused(filterCategories(event)),
        );
      },
    );
  }

  static const searchFormField = 'categories_search';

  final searchForm = fb.group({
    searchFormField: FormControl<String>(
      value: '',
      validators: [],
    ),
  });

  final List<String> cachedItems;

  final List<String> items;

  void setFocus() {
    emit(CategoriesListState.focused(state.items));
  }

  void unfocus() {
    emit(CategoriesListState.unfocused(state.items));
  }

  List<String> filterCategories(dynamic event) {
    return cachedItems
        .where(
          (element) => element.toLowerCase().startsWith(
                event.toString().toLowerCase(),
              ),
        )
        .toList();
  }

  void clearSearchForm() {
    searchForm.control(CategoriesListCubit.searchFormField).value = '';
  }
}
