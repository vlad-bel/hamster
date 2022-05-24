import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/common/widgets/categories_list/cubit/categories_list_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/categories_list/cubit/categories_list_state.dart';
import 'package:business_terminal/presentation/common/widgets/categories_list/widget/categories_items.dart';
import 'package:business_terminal/presentation/common/widgets/categories_list/widget/categories_list_search.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key? key,
    required this.data,
    required this.onSelect,
  }) : super(key: key);

  final Function(int index) onSelect;
  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesListCubit>(
      ///todo move to getIt
      ///will be done at next PR
      create: (context) => CategoriesListCubit(
        items: data,
      ),
      child: BlocBuilder<CategoriesListCubit, CategoriesListState>(
        builder: (BuildContext context, state) {
          final cubit = context.read<CategoriesListCubit>();
          return ReactiveFormBuilder(
            form: () => cubit.searchForm,
            builder: (context, group, child) {
              final hasText = group
                  .control(CategoriesListCubit.searchFormField)
                  .value
                  .toString()
                  .isNotEmpty;
              return Column(
                children: [
                  SizedBox(height: 32),
                  CategoriesListSearch(
                    hasFocus: state.when(
                      unfocused: (_) => false || hasText,
                      focused: (_) => true,
                    ),
                  ),
                  CategoriesItems(
                    onSelect: onSelect,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
