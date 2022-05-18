// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_place_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchPlaceStateTearOff {
  const _$SearchPlaceStateTearOff();

  IdleSearchPlaceState idle({Prediction? selectedPrediction}) {
    return IdleSearchPlaceState(
      selectedPrediction: selectedPrediction,
    );
  }

  OpenSearchPlaceState open({required List<Prediction> predictionList}) {
    return OpenSearchPlaceState(
      predictionList: predictionList,
    );
  }
}

/// @nodoc
const $SearchPlaceState = _$SearchPlaceStateTearOff();

/// @nodoc
mixin _$SearchPlaceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Prediction? selectedPrediction) idle,
    required TResult Function(List<Prediction> predictionList) open,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Prediction? selectedPrediction)? idle,
    TResult Function(List<Prediction> predictionList)? open,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Prediction? selectedPrediction)? idle,
    TResult Function(List<Prediction> predictionList)? open,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleSearchPlaceState value) idle,
    required TResult Function(OpenSearchPlaceState value) open,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdleSearchPlaceState value)? idle,
    TResult Function(OpenSearchPlaceState value)? open,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleSearchPlaceState value)? idle,
    TResult Function(OpenSearchPlaceState value)? open,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPlaceStateCopyWith<$Res> {
  factory $SearchPlaceStateCopyWith(
          SearchPlaceState value, $Res Function(SearchPlaceState) then) =
      _$SearchPlaceStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchPlaceStateCopyWithImpl<$Res>
    implements $SearchPlaceStateCopyWith<$Res> {
  _$SearchPlaceStateCopyWithImpl(this._value, this._then);

  final SearchPlaceState _value;
  // ignore: unused_field
  final $Res Function(SearchPlaceState) _then;
}

/// @nodoc
abstract class $IdleSearchPlaceStateCopyWith<$Res> {
  factory $IdleSearchPlaceStateCopyWith(IdleSearchPlaceState value,
          $Res Function(IdleSearchPlaceState) then) =
      _$IdleSearchPlaceStateCopyWithImpl<$Res>;
  $Res call({Prediction? selectedPrediction});
}

/// @nodoc
class _$IdleSearchPlaceStateCopyWithImpl<$Res>
    extends _$SearchPlaceStateCopyWithImpl<$Res>
    implements $IdleSearchPlaceStateCopyWith<$Res> {
  _$IdleSearchPlaceStateCopyWithImpl(
      IdleSearchPlaceState _value, $Res Function(IdleSearchPlaceState) _then)
      : super(_value, (v) => _then(v as IdleSearchPlaceState));

  @override
  IdleSearchPlaceState get _value => super._value as IdleSearchPlaceState;

  @override
  $Res call({
    Object? selectedPrediction = freezed,
  }) {
    return _then(IdleSearchPlaceState(
      selectedPrediction: selectedPrediction == freezed
          ? _value.selectedPrediction
          : selectedPrediction // ignore: cast_nullable_to_non_nullable
              as Prediction?,
    ));
  }
}

/// @nodoc

class _$IdleSearchPlaceState implements IdleSearchPlaceState {
  const _$IdleSearchPlaceState({this.selectedPrediction});

  @override
  final Prediction? selectedPrediction;

  @override
  String toString() {
    return 'SearchPlaceState.idle(selectedPrediction: $selectedPrediction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IdleSearchPlaceState &&
            (identical(other.selectedPrediction, selectedPrediction) ||
                const DeepCollectionEquality()
                    .equals(other.selectedPrediction, selectedPrediction)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectedPrediction);

  @JsonKey(ignore: true)
  @override
  $IdleSearchPlaceStateCopyWith<IdleSearchPlaceState> get copyWith =>
      _$IdleSearchPlaceStateCopyWithImpl<IdleSearchPlaceState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Prediction? selectedPrediction) idle,
    required TResult Function(List<Prediction> predictionList) open,
  }) {
    return idle(selectedPrediction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Prediction? selectedPrediction)? idle,
    TResult Function(List<Prediction> predictionList)? open,
  }) {
    return idle?.call(selectedPrediction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Prediction? selectedPrediction)? idle,
    TResult Function(List<Prediction> predictionList)? open,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(selectedPrediction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleSearchPlaceState value) idle,
    required TResult Function(OpenSearchPlaceState value) open,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdleSearchPlaceState value)? idle,
    TResult Function(OpenSearchPlaceState value)? open,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleSearchPlaceState value)? idle,
    TResult Function(OpenSearchPlaceState value)? open,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class IdleSearchPlaceState implements SearchPlaceState {
  const factory IdleSearchPlaceState({Prediction? selectedPrediction}) =
      _$IdleSearchPlaceState;

  Prediction? get selectedPrediction => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdleSearchPlaceStateCopyWith<IdleSearchPlaceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenSearchPlaceStateCopyWith<$Res> {
  factory $OpenSearchPlaceStateCopyWith(OpenSearchPlaceState value,
          $Res Function(OpenSearchPlaceState) then) =
      _$OpenSearchPlaceStateCopyWithImpl<$Res>;
  $Res call({List<Prediction> predictionList});
}

/// @nodoc
class _$OpenSearchPlaceStateCopyWithImpl<$Res>
    extends _$SearchPlaceStateCopyWithImpl<$Res>
    implements $OpenSearchPlaceStateCopyWith<$Res> {
  _$OpenSearchPlaceStateCopyWithImpl(
      OpenSearchPlaceState _value, $Res Function(OpenSearchPlaceState) _then)
      : super(_value, (v) => _then(v as OpenSearchPlaceState));

  @override
  OpenSearchPlaceState get _value => super._value as OpenSearchPlaceState;

  @override
  $Res call({
    Object? predictionList = freezed,
  }) {
    return _then(OpenSearchPlaceState(
      predictionList: predictionList == freezed
          ? _value.predictionList
          : predictionList // ignore: cast_nullable_to_non_nullable
              as List<Prediction>,
    ));
  }
}

/// @nodoc

class _$OpenSearchPlaceState implements OpenSearchPlaceState {
  const _$OpenSearchPlaceState({required this.predictionList});

  @override
  final List<Prediction> predictionList;

  @override
  String toString() {
    return 'SearchPlaceState.open(predictionList: $predictionList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OpenSearchPlaceState &&
            (identical(other.predictionList, predictionList) ||
                const DeepCollectionEquality()
                    .equals(other.predictionList, predictionList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(predictionList);

  @JsonKey(ignore: true)
  @override
  $OpenSearchPlaceStateCopyWith<OpenSearchPlaceState> get copyWith =>
      _$OpenSearchPlaceStateCopyWithImpl<OpenSearchPlaceState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Prediction? selectedPrediction) idle,
    required TResult Function(List<Prediction> predictionList) open,
  }) {
    return open(predictionList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Prediction? selectedPrediction)? idle,
    TResult Function(List<Prediction> predictionList)? open,
  }) {
    return open?.call(predictionList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Prediction? selectedPrediction)? idle,
    TResult Function(List<Prediction> predictionList)? open,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(predictionList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleSearchPlaceState value) idle,
    required TResult Function(OpenSearchPlaceState value) open,
  }) {
    return open(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdleSearchPlaceState value)? idle,
    TResult Function(OpenSearchPlaceState value)? open,
  }) {
    return open?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleSearchPlaceState value)? idle,
    TResult Function(OpenSearchPlaceState value)? open,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(this);
    }
    return orElse();
  }
}

abstract class OpenSearchPlaceState implements SearchPlaceState {
  const factory OpenSearchPlaceState(
      {required List<Prediction> predictionList}) = _$OpenSearchPlaceState;

  List<Prediction> get predictionList => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OpenSearchPlaceStateCopyWith<OpenSearchPlaceState> get copyWith =>
      throw _privateConstructorUsedError;
}
