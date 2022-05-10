import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart';
import 'package:business_terminal/presentation/company_creation/company_creation_form.dart';
import 'package:business_terminal/presentation/company_creation/cubit/company_creation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CompanyCreationPage extends StatelessWidget {
  const CompanyCreationPage({Key? key}) : super(key: key);

  static const path = '/company_creation';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            return GetIt.instance.get<CompanyCreationCubit>();
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            return GetIt.instance.get<CountrySelectorCubit>();
          },
        ),
      ],
      child: const CompanyCreationForm(),
    );
  }
}
