import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_webservice/places.dart';

part 'search_place_state.freezed.dart';

@freezed
class SearchPlaceState with _$SearchPlaceState {
  const factory SearchPlaceState.idle({
    Prediction? selectedPrediction,
  }) = IdleSearchPlaceState;

  const factory SearchPlaceState.open({
    required List<Prediction> predictionList,
  }) = OpenSearchPlaceState;
}
