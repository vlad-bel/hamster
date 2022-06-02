import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/cubit/add_logo_cropper_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddLogoCropperCubit extends Cubit<AddLogoCropperState> {
  AddLogoCropperCubit() : super(AddLogoCropperState.init());

  void loading() {
    emit(AddLogoCropperState.loading());
  }
}
