import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddLogoCropperFormCubit extends Cubit<AddLogoCropperFormState> {
  AddLogoCropperFormCubit()
      : super(
          AddLogoCropperFormState.init(
            text: 'init',
          ),
        );

  void loading() {
    emit(AddLogoCropperFormState.loading(text: 'loading'));
  }

  void changeBackground({
    required BackgroundColorModel backgroundColorModel,
  }) {
    loading();
    emit(
      AddLogoCropperFormState.success(
        backgroundColorModel: backgroundColorModel,
      ),
    );
  }

  void hide() {
    loading();
    emit(AddLogoCropperFormState.hide(text: 'hide'));
  }
}
