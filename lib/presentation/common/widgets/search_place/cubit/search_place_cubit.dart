import 'package:business_terminal/presentation/common/widgets/search_place/cubit/search_place_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:google_maps_webservice/places.dart';

class SearchPlaceCubit extends Cubit<SearchPlaceState> {
  SearchPlaceCubit({
    required this.formGroup,
    required this.formName,
    required this.onPredictionSelect,
  }) : super(const SearchPlaceState.idle()) {
    formGroup.valueChanges.listen((event) async {
      if (event != null) {
        final value = event[formName]! as String;
        final response = await places.autocomplete(value, language: 'en');

        emit(SearchPlaceState.open(predictionList: response.predictions));
        response.predictions.forEach((element) {
          print("prediction:${element.description}");
        });
      }
    });
  }

  final FormGroup formGroup;
  final String formName;

  Function(
    Prediction prediction,
  ) onPredictionSelect;

  final places = GoogleMapsPlaces(
    apiKey: 'AIzaSyBkUrWkOYuIXxLHNLrqrZpGzk3aYP7vX7A',
  );

  void selectPrediction(Prediction prediction) {
    formGroup.control(formName).value = prediction.description;
    onPredictionSelect(prediction);

    emit(SearchPlaceState.idle(
      selectedPrediction: prediction,
    ));
  }
}
