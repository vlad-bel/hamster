import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/categories/subcategories/cubit/subcategories_cubit.dart';
import 'package:business_terminal/presentation/categories/subcategories/cubit/subcategories_state.dart';
import 'package:business_terminal/presentation/common/widgets/categories_list/categories_list.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubcategoriesForm extends StatelessWidget {
  const SubcategoriesForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubcategoriesCubit, SubcategoriesState>(
      builder: (context, state) {
        final cubit = context.read<SubcategoriesCubit>();
        return OnboardingBackground(
          children: OnboardingWhiteContainer(
            header: OnboardingWhiteContainerHeader(
              header: AppLocale.current.choose_main_category,
              subHeader: Text(
                AppLocale.current.choose_main_category_descr,
                style: inter14,
              ),
            ),
            body: Column(
              children: [
                CategoriesList(
                  data: state.subcategories ?? [],
                  onSelect: (index) {
                    cubit.selectSubcategory(index);
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(height: 32),
                WhiteButton(
                  width: 500,
                  child: Text(
                    AppLocale.current.return_button,
                    style: inter14.copyWith(
                      color: denim,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
