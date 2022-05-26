import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_state.dart';
import 'package:business_terminal/presentation/branch_profile_picture/cubit/branch_profile_picture_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class BranchProfilePictureCubit extends Cubit<BranchProfilePictureState> {
  BranchProfilePictureCubit() : super(BranchProfilePictureState.init());
}
