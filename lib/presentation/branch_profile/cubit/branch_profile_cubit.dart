import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class BranchProfileCubit extends Cubit<BranchProfileState> {
  BranchProfileCubit()
      : super(
          BranchProfileState.init(

              ///todo mock images
            branchImages: [
              'https://cdn.cnn.com/cnnnext/dam/assets/211105205533-01-georgia-travel-file-full-169.jpg',
              'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/24701-nature-natural-beauty.jpg/1280px-24701-nature-natural-beauty.jpg',
              'https://ds.static.rtbf.be/article/image/1248x702/2/1/b/7e32a07d16f1e5929d06b65594dfb643-1563791453.jpg',
            ],
            avatarImages: [
              'https://static.stacker.com/s3fs-public/styles/slide_desktop/s3/pepsi.png',
              'https://growyournutritionbusiness.com/wp-content/uploads/2019/11/company-logo-test.jpg',
            ],
          ),
        );

  void setCategories({
    required String category,
    required List<String> subcategories,
  }) {
    emit(
      BranchProfileState.init(
        category: category,
        subcategories: subcategories,
        branchImages: state.branchImages,
        avatarImages: state.avatarImages,
      ),
    );
  }

  void setImages({
    required List<dynamic> branchImages,
    required List<dynamic> avatarImages,
  }) {
    emit(
      BranchProfileState.init(
        category: state.category,
        subcategories: state.subcategories,
        branchImages: branchImages,
        avatarImages: avatarImages,
      ),
    );
  }
}
