import 'package:business_terminal/presentation/branch_profile_picture/cubit/branch_profile_picture_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class BranchProfilePictureCubit extends Cubit<BranchProfilePictureState> {
  BranchProfilePictureCubit()
      : super(BranchProfilePictureState.init(
          images: [
            'https://cdn.cnn.com/cnnnext/dam/assets/211105205533-01-georgia-travel-file-full-169.jpg',
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/24701-nature-natural-beauty.jpg/1280px-24701-nature-natural-beauty.jpg',
            'https://ds.static.rtbf.be/article/image/1248x702/2/1/b/7e32a07d16f1e5929d06b65594dfb643-1563791453.jpg',
          ],
          selectedImage:
              'https://cdn.cnn.com/cnnnext/dam/assets/211105205533-01-georgia-travel-file-full-169.jpg',
        ));

  void selectImage(String imagePath) {
    emit(BranchProfilePictureState.init(
      selectedImage: imagePath,
      images: state.images,
    ));
  }

  void removeSelectedImage(String imagePath) {
    final removedIndex = state.images!.indexOf(imagePath);
    final updatedImages = List.of(state.images!)
      ..removeWhere(
        (element) => element == imagePath,
      );

    late String? updatedSelectedImage;
    if (updatedImages.isNotEmpty) {
      final indexForRemove = removedIndex > 1 ? removedIndex - 1 : 0;
      updatedSelectedImage = updatedImages[indexForRemove];
    } else {
      updatedSelectedImage = null;
    }

    emit(BranchProfilePictureState.init(
      selectedImage: updatedSelectedImage,
      images: updatedImages,
    ));
  }
}
