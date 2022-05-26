import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class BranchProfileCubit extends Cubit<BranchProfileState> {
  BranchProfileCubit() : super(BranchProfileState.init());

  void setCategories({
    required String category,
    required List<String> subcategories,
  }) {
    emit(BranchProfileState.init(
      category: category,
      subcategories: subcategories,
    ));
  }
}
