import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/presentation/categories/cubit/subcategories_cubit.dart';
import 'package:business_terminal/presentation/categories/cubit/subcategories_state.dart';
import 'package:business_terminal/presentation/categories/subcategories/select_subcategories_page/select_subcategories_page.dart';
import 'package:business_terminal/presentation/common/widgets/categories_list/categories_list.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesForm extends StatelessWidget {
  const CategoriesForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: AppLocale.of(context).choose_main_category,
          subHeader: Text(
            AppLocale.of(context).choose_main_category_descr,
            style: inter14,
          ),
        ),
        body: BlocBuilder<SubcategoriesCubit, SubcategoriesState>(
          builder: (context, state) {
            final cubit = context.read<SubcategoriesCubit>();
            return Column(
              children: [
                state.when(
                  loading: () {
                    return Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: CircularProgressIndicator(),
                    );
                  },
                  init: (
                    selectedCategory,
                    categories,
                    selectedCategories,
                  ) {
                    return CategoriesList(
                      data: categories,
                      onSelect: (category) {
                        cubit.selectCategory(category);
                        Navigator.pushNamed(
                          context,
                          SelectSubCategoriesPage.path,
                        );
                      },
                    );
                  },
                  error: (ApiFailure e) {
                    return Center(
                      child: Text(
                        ///TODO improvement
                        ///make real error placeholder
                        'Error of loading categories',
                        style: inter14,
                      ),
                    );
                  },
                ),
                SizedBox(height: 32),
                WhiteButton(
                  width: 500,
                  child: Text(
                    AppLocale.of(context).return_button,
                    style: inter14.copyWith(
                      color: denim,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
