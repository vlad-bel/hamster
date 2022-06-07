import 'package:business_terminal/presentation/common/cropper_page/cubit/cropper_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CropperCubit extends Cubit<CropperState> {
  CropperCubit() : super(const CropperState.init());

  void loading() {
    emit(const CropperState.loading());
  }
}
