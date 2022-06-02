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

  final List<BackgroundColorModel> palette = [];

  void loading() {
    emit(AddLogoCropperFormState.loading(text: 'loading'));
  }

  void addColorToPalette({
    required BackgroundColorModel backgroundColorModel,
  }) {
    palette.add(backgroundColorModel);
    emit(
      AddLogoCropperFormState.success(
        palette: palette,
        backgroundColorModel: backgroundColorModel,
      ),
    );
  }

  void changeBackground({
    required BackgroundColorModel backgroundColorModel,
  }) {
    loading();
    emit(
      AddLogoCropperFormState.success(
        palette: palette,
        backgroundColorModel: backgroundColorModel,
      ),
    );
  }

  void hide() {
    loading();
    emit(AddLogoCropperFormState.hide(text: 'hide'));
  }
}
