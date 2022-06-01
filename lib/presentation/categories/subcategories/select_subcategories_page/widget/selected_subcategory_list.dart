import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/categories/cubit/subcategories_cubit.dart';
import 'package:business_terminal/presentation/categories/cubit/subcategories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedSubcategoryList extends StatelessWidget {
  const SelectedSubcategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubcategoriesCubit, SubcategoriesState>(
      builder: (context, state) {
        final cubit = context.read<SubcategoriesCubit>();
        return Material(
          color: white,
          child: state.whenOrNull(
                init: (_, categories, selectedCategories) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            minVerticalPadding: 0,
                            contentPadding: EdgeInsets.only(
                              left: 16,
                            ),
                            onTap: () {},
                            title: Text(
                              selectedCategories[index],
                              style: inter14Medium,
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: MaterialButton(
                                padding: EdgeInsets.zero,
                                minWidth: 32,
                                onPressed: () {
                                  cubit.removeSelectedSubcategory(index);
                                },
                                child: Icon(
                                  Icons.close_rounded,
                                  size: 16,
                                  color: lynch,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 1,
                            color: lynch.withOpacity(0.3),
                          ),
                        ],
                      );
                    },
                    itemCount: selectedCategories.length,
                  );
                },
              ) ??
             const SizedBox(),
        );
      },
    );
  }
}
