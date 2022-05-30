import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_cubit.dart';
import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_state.dart';
import 'package:business_terminal/presentation/categories/categories/categories_page.dart';
import 'package:business_terminal/presentation/categories/cubit/subcategories_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/bordered_container/bordered_edit_container.dart';
import 'package:business_terminal/presentation/common/widgets/dashed_button/dashed_button.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchProfileCategories extends StatelessWidget {
  const BranchProfileCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SubcategoriesCubit>().loadCategories();
    return BlocBuilder<BranchProfileCubit, BranchProfileState>(
      builder: (context, state) {
        if (state.category != null && state.subcategories != null) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FormTextField(
                  reactive: false,
                  readOnly: true,
                  initialText: state.category,
                  label: AppLocale.of(context).main_category,
                ),
              ),
              const SizedBox(width: 45),
              Expanded(
                child: SizedBox(
                  height: 200,
                  width: 300,
                  child: BorderedEditContainer(
                    title: AppLocale.of(context).subcategory,
                    onEditTap: () {
                      Navigator.of(context).pushNamed(CategoriesPage.path);
                    },
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          child: Text(
                            state.subcategories?[index] ?? '',
                            style: inter14Medium,
                          ),
                        );
                      },
                      itemCount: state.subcategories?.length ?? 0,
                    ),
                  ),
                ),
              ),
            ],
          );
        }

        return DashedButton(
          label: AppLocale.of(context).add_category,
          onTap: () {
            Navigator.pushNamed(context, CategoriesPage.path);
          },
        );
      },
    );
  }
}
