import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddLogoCropperFormCubit extends Cubit<AddLogoCropperFormState> {
  AddLogoCropperFormCubit()
      : super(
          const AddLogoCropperFormState.init(
            text: 'init',
          ),
        );

  final List<String> palette = [];

  void loading() {
    emit(const AddLogoCropperFormState.loading(text: 'loading'));
  }

  void addColorToPalette({
    required String color,
  }) {
    palette.add(color);
    emit(
      AddLogoCropperFormState.success(
        palette: palette,
        color: color,
      ),
    );
  }

  void changeBackground({
    required String color,
  }) {
    loading();
    emit(
      AddLogoCropperFormState.success(
        palette: palette,
        color: color,
      ),
    );
  }

  void hide() {
    loading();
    emit(
      const AddLogoCropperFormState.hide(text: 'hide'),
    );
  }
}
