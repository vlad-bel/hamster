// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'country_selector_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CountrySelectorStateTearOff {
  const _$CountrySelectorStateTearOff();

  LoadingCountrySelectorState loading() {
    return const LoadingCountrySelectorState();
  }

  SucessCountrySelectorState open(
      {Country? selectedCountry, List<Country>? countries}) {
    return SucessCountrySelectorState(
      selectedCountry: selectedCountry,
      countries: countries,
    );
  }

  CloseCountrySelectorState close(
      {Country? selectedCountry, List<Country>? countries}) {
    return CloseCountrySelectorState(
      selectedCountry: selectedCountry,
      countries: countries,
    );
  }

  ErrorCountrySelectorState error(ApiFailure e) {
    return ErrorCountrySelectorState(
      e,
    );
  }
}

/// @nodoc
const $CountrySelectorState = _$CountrySelectorStateTearOff();

/// @nodoc
mixin _$CountrySelectorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            Country? selectedCountry, List<Country>? countries)
        open,
    required TResult Function(
            Country? selectedCountry, List<Country>? countries)
        close,
    required TResult Function(ApiFailure e) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Country? selectedCountry, List<Country>? countries)? open,
    TResult Function(Country? selectedCountry, List<Country>? countries)? close,
    TResult Function(ApiFailure e)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Country? selectedCountry, List<Country>? countries)? open,
    TResult Function(Country? selectedCountry, List<Country>? countries)? close,
    TResult Function(ApiFailure e)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCountrySelectorState value) loading,
    required TResult Function(SucessCountrySelectorState value) open,
    required TResult Function(CloseCountrySelectorState value) close,
    required TResult Function(ErrorCountrySelectorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingCountrySelectorState value)? loading,
    TResult Function(SucessCountrySelectorState value)? open,
    TResult Function(CloseCountrySelectorState value)? close,
    TResult Function(ErrorCountrySelectorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCountrySelectorState value)? loading,
    TResult Function(SucessCountrySelectorState value)? open,
    TResult Function(CloseCountrySelectorState value)? close,
    TResult Function(ErrorCountrySelectorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountrySelectorStateCopyWith<$Res> {
  factory $CountrySelectorStateCopyWith(CountrySelectorState value,
          $Res Function(CountrySelectorState) then) =
      _$CountrySelectorStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CountrySelectorStateCopyWithImpl<$Res>
    implements $CountrySelectorStateCopyWith<$Res> {
  _$CountrySelectorStateCopyWithImpl(this._value, this._then);

  final CountrySelectorState _value;
  // ignore: unused_field
  final $Res Function(CountrySelectorState) _then;
}

/// @nodoc
abstract class $LoadingCountrySelectorStateCopyWith<$Res> {
  factory $LoadingCountrySelectorStateCopyWith(
          LoadingCountrySelectorState value,
          $Res Function(LoadingCountrySelectorState) then) =
      _$LoadingCountrySelectorStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCountrySelectorStateCopyWithImpl<$Res>
    extends _$CountrySelectorStateCopyWithImpl<$Res>
    implements $LoadingCountrySelectorStateCopyWith<$Res> {
  _$LoadingCountrySelectorStateCopyWithImpl(LoadingCountrySelectorState _value,
      $Res Function(LoadingCountrySelectorState) _then)
      : super(_value, (v) => _then(v as LoadingCountrySelectorState));

  @override
  LoadingCountrySelectorState get _value =>
      super._value as LoadingCountrySelectorState;
}

/// @nodoc

class _$LoadingCountrySelectorState implements LoadingCountrySelectorState {
  const _$LoadingCountrySelectorState();

  @override
  String toString() {
    return 'CountrySelectorState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingCountrySelectorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            Country? selectedCountry, List<Country>? countries)
        open,
    required TResult Function(
            Country? selectedCountry, List<Country>? countries)
        close,
    required TResult Function(ApiFailure e) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Country? selectedCountry, List<Country>? countries)? open,
    TResult Function(Country? selectedCountry, List<Country>? countries)? close,
    TResult Function(ApiFailure e)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Country? selectedCountry, List<Country>? countries)? open,
    TResult Function(Country? selectedCountry, List<Country>? countries)? close,
    TResult Function(ApiFailure e)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCountrySelectorState value) loading,
    required TResult Function(SucessCountrySelectorState value) open,
    required TResult Function(CloseCountrySelectorState value) close,
    required TResult Function(ErrorCountrySelectorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingCountrySelectorState value)? loading,
    TResult Function(SucessCountrySelectorState value)? open,
    TResult Function(CloseCountrySelectorState value)? close,
    TResult Function(ErrorCountrySelectorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCountrySelectorState value)? loading,
    TResult Function(SucessCountrySelectorState value)? open,
    TResult Function(CloseCountrySelectorState value)? close,
    TResult Function(ErrorCountrySelectorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingCountrySelectorState implements CountrySelectorState {
  const factory LoadingCountrySelectorState() = _$LoadingCountrySelectorState;
}

/// @nodoc
abstract class $SucessCountrySelectorStateCopyWith<$Res> {
  factory $SucessCountrySelectorStateCopyWith(SucessCountrySelectorState value,
          $Res Function(SucessCountrySelectorState) then) =
      _$SucessCountrySelectorStateCopyWithImpl<$Res>;
  $Res call({Country? selectedCountry, List<Country>? countries});
}

/// @nodoc
class _$SucessCountrySelectorStateCopyWithImpl<$Res>
    extends _$CountrySelectorStateCopyWithImpl<$Res>
    implements $SucessCountrySelectorStateCopyWith<$Res> {
  _$SucessCountrySelectorStateCopyWithImpl(SucessCountrySelectorState _value,
      $Res Function(SucessCountrySelectorState) _then)
      : super(_value, (v) => _then(v as SucessCountrySelectorState));

  @override
  SucessCountrySelectorState get _value =>
      super._value as SucessCountrySelectorState;

  @override
  $Res call({
    Object? selectedCountry = freezed,
    Object? countries = freezed,
  }) {
    return _then(SucessCountrySelectorState(
      selectedCountry: selectedCountry == freezed
          ? _value.selectedCountry
          : selectedCountry // ignore: cast_nullable_to_non_nullable
              as Country?,
      countries: countries == freezed
          ? _value.countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<Country>?,
    ));
  }
}

/// @nodoc

class _$SucessCountrySelectorState implements SucessCountrySelectorState {
  const _$SucessCountrySelectorState({this.selectedCountry, this.countries});

  @override
  final Country? selectedCountry;
  @override
  final List<Country>? countries;

  @override
  String toString() {
    return 'CountrySelectorState.open(selectedCountry: $selectedCountry, countries: $countries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SucessCountrySelectorState &&
            (identical(other.selectedCountry, selectedCountry) ||
                const DeepCollectionEquality()
                    .equals(other.selectedCountry, selectedCountry)) &&
            (identical(other.countries, countries) ||
                const DeepCollectionEquality()
                    .equals(other.countries, countries)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectedCountry) ^
      const DeepCollectionEquality().hash(countries);

  @JsonKey(ignore: true)
  @override
  $SucessCountrySelectorStateCopyWith<SucessCountrySelectorState>
      get copyWith =>
          _$SucessCountrySelectorStateCopyWithImpl<SucessCountrySelectorState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            Country? selectedCountry, List<Country>? countries)
        open,
    required TResult Function(
            Country? selectedCountry, List<Country>? countries)
        close,
    required TResult Function(ApiFailure e) error,
  }) {
    return open(selectedCountry, countries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Country? selectedCountry, List<Country>? countries)? open,
    TResult Function(Country? selectedCountry, List<Country>? countries)? close,
    TResult Function(ApiFailure e)? error,
  }) {
    return open?.call(selectedCountry, countries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Country? selectedCountry, List<Country>? countries)? open,
    TResult Function(Country? selectedCountry, List<Country>? countries)? close,
    TResult Function(ApiFailure e)? error,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(selectedCountry, countries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCountrySelectorState value) loading,
    required TResult Function(SucessCountrySelectorState value) open,
    required TResult Function(CloseCountrySelectorState value) close,
    required TResult Function(ErrorCountrySelectorState value) error,
  }) {
    return open(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingCountrySelectorState value)? loading,
    TResult Function(SucessCountrySelectorState value)? open,
    TResult Function(CloseCountrySelectorState value)? close,
    TResult Function(ErrorCountrySelectorState value)? error,
  }) {
    return open?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCountrySelectorState value)? loading,
    TResult Function(SucessCountrySelectorState value)? open,
    TResult Function(CloseCountrySelectorState value)? close,
    TResult Function(ErrorCountrySelectorState value)? error,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(this);
    }
    return orElse();
  }
}

abstract class SucessCountrySelectorState implements CountrySelectorState {
  const factory SucessCountrySelectorState(
      {Country? selectedCountry,
      List<Country>? countries}) = _$SucessCountrySelectorState;

  Country? get selectedCountry => throw _privateConstructorUsedError;
  List<Country>? get countries => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SucessCountrySelectorStateCopyWith<SucessCountrySelectorState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CloseCountrySelectorStateCopyWith<$Res> {
  factory $CloseCountrySelectorStateCopyWith(CloseCountrySelectorState value,
          $Res Function(CloseCountrySelectorState) then) =
      _$CloseCountrySelectorStateCopyWithImpl<$Res>;
  $Res call({Country? selectedCountry, List<Country>? countries});
}

/// @nodoc
class _$CloseCountrySelectorStateCopyWithImpl<$Res>
    extends _$CountrySelectorStateCopyWithImpl<$Res>
    implements $CloseCountrySelectorStateCopyWith<$Res> {
  _$CloseCountrySelectorStateCopyWithImpl(CloseCountrySelectorState _value,
      $Res Function(CloseCountrySelectorState) _then)
      : super(_value, (v) => _then(v as CloseCountrySelectorState));

  @override
  CloseCountrySelectorState get _value =>
      super._value as CloseCountrySelectorState;

  @override
  $Res call({
    Object? selectedCountry = freezed,
    Object? countries = freezed,
  }) {
    return _then(CloseCountrySelectorState(
      selectedCountry: selectedCountry == freezed
          ? _value.selectedCountry
          : selectedCountry // ignore: cast_nullable_to_non_nullable
              as Country?,
      countries: countries == freezed
          ? _value.countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<Country>?,
    ));
  }
}

/// @nodoc

class _$CloseCountrySelectorState implements CloseCountrySelectorState {
  const _$CloseCountrySelectorState({this.selectedCountry, this.countries});

  @override
  final Country? selectedCountry;
  @override
  final List<Country>? countries;

  @override
  String toString() {
    return 'CountrySelectorState.close(selectedCountry: $selectedCountry, countries: $countries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CloseCountrySelectorState &&
            (identical(other.selectedCountry, selectedCountry) ||
                const DeepCollectionEquality()
                    .equals(other.selectedCountry, selectedCountry)) &&
            (identical(other.countries, countries) ||
                const DeepCollectionEquality()
                    .equals(other.countries, countries)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectedCountry) ^
      const DeepCollectionEquality().hash(countries);

  @JsonKey(ignore: true)
  @override
  $CloseCountrySelectorStateCopyWith<CloseCountrySelectorState> get copyWith =>
      _$CloseCountrySelectorStateCopyWithImpl<CloseCountrySelectorState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            Country? selectedCountry, List<Country>? countries)
        open,
    required TResult Function(
            Country? selectedCountry, List<Country>? countries)
        close,
    required TResult Function(ApiFailure e) error,
  }) {
    return close(selectedCountry, countries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Country? selectedCountry, List<Country>? countries)? open,
    TResult Function(Country? selectedCountry, List<Country>? countries)? close,
    TResult Function(ApiFailure e)? error,
  }) {
    return close?.call(selectedCountry, countries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Country? selectedCountry, List<Country>? countries)? open,
    TResult Function(Country? selectedCountry, List<Country>? countries)? close,
    TResult Function(ApiFailure e)? error,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close(selectedCountry, countries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCountrySelectorState value) loading,
    required TResult Function(SucessCountrySelectorState value) open,
    required TResult Function(CloseCountrySelectorState value) close,
    required TResult Function(ErrorCountrySelectorState value) error,
  }) {
    return close(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingCountrySelectorState value)? loading,
    TResult Function(SucessCountrySelectorState value)? open,
    TResult Function(CloseCountrySelectorState value)? close,
    TResult Function(ErrorCountrySelectorState value)? error,
  }) {
    return close?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCountrySelectorState value)? loading,
    TResult Function(SucessCountrySelectorState value)? open,
    TResult Function(CloseCountrySelectorState value)? close,
    TResult Function(ErrorCountrySelectorState value)? error,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close(this);
    }
    return orElse();
  }
}

abstract class CloseCountrySelectorState implements CountrySelectorState {
  const factory CloseCountrySelectorState(
      {Country? selectedCountry,
      List<Country>? countries}) = _$CloseCountrySelectorState;

  Country? get selectedCountry => throw _privateConstructorUsedError;
  List<Country>? get countries => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CloseCountrySelectorStateCopyWith<CloseCountrySelectorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorCountrySelectorStateCopyWith<$Res> {
  factory $ErrorCountrySelectorStateCopyWith(ErrorCountrySelectorState value,
          $Res Function(ErrorCountrySelectorState) then) =
      _$ErrorCountrySelectorStateCopyWithImpl<$Res>;
  $Res call({ApiFailure e});
}

/// @nodoc
class _$ErrorCountrySelectorStateCopyWithImpl<$Res>
    extends _$CountrySelectorStateCopyWithImpl<$Res>
    implements $ErrorCountrySelectorStateCopyWith<$Res> {
  _$ErrorCountrySelectorStateCopyWithImpl(ErrorCountrySelectorState _value,
      $Res Function(ErrorCountrySelectorState) _then)
      : super(_value, (v) => _then(v as ErrorCountrySelectorState));

  @override
  ErrorCountrySelectorState get _value =>
      super._value as ErrorCountrySelectorState;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(ErrorCountrySelectorState(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as ApiFailure,
    ));
  }
}

/// @nodoc

class _$ErrorCountrySelectorState implements ErrorCountrySelectorState {
  const _$ErrorCountrySelectorState(this.e);

  @override
  final ApiFailure e;

  @override
  String toString() {
    return 'CountrySelectorState.error(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorCountrySelectorState &&
            (identical(other.e, e) ||
                const DeepCollectionEquality().equals(other.e, e)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(e);

  @JsonKey(ignore: true)
  @override
  $ErrorCountrySelectorStateCopyWith<ErrorCountrySelectorState> get copyWith =>
      _$ErrorCountrySelectorStateCopyWithImpl<ErrorCountrySelectorState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            Country? selectedCountry, List<Country>? countries)
        open,
    required TResult Function(
            Country? selectedCountry, List<Country>? countries)
        close,
    required TResult Function(ApiFailure e) error,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Country? selectedCountry, List<Country>? countries)? open,
    TResult Function(Country? selectedCountry, List<Country>? countries)? close,
    TResult Function(ApiFailure e)? error,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Country? selectedCountry, List<Country>? countries)? open,
    TResult Function(Country? selectedCountry, List<Country>? countries)? close,
    TResult Function(ApiFailure e)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCountrySelectorState value) loading,
    required TResult Function(SucessCountrySelectorState value) open,
    required TResult Function(CloseCountrySelectorState value) close,
    required TResult Function(ErrorCountrySelectorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingCountrySelectorState value)? loading,
    TResult Function(SucessCountrySelectorState value)? open,
    TResult Function(CloseCountrySelectorState value)? close,
    TResult Function(ErrorCountrySelectorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCountrySelectorState value)? loading,
    TResult Function(SucessCountrySelectorState value)? open,
    TResult Function(CloseCountrySelectorState value)? close,
    TResult Function(ErrorCountrySelectorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorCountrySelectorState implements CountrySelectorState {
  const factory ErrorCountrySelectorState(ApiFailure e) =
      _$ErrorCountrySelectorState;

  ApiFailure get e => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorCountrySelectorStateCopyWith<ErrorCountrySelectorState> get copyWith =>
      throw _privateConstructorUsedError;
}
