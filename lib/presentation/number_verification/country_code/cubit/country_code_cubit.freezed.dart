// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'country_code_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CountryCodeStateTearOff {
  const _$CountryCodeStateTearOff();

  LoadingCountryCodeState loading() {
    return const LoadingCountryCodeState();
  }

  InitCountryCodeState init() {
    return const InitCountryCodeState();
  }

  NextCountryCodeState next({required String email, required String phone}) {
    return NextCountryCodeState(
      email: email,
      phone: phone,
    );
  }

  ErrorCountryCodeState error(ApiFailure e) {
    return ErrorCountryCodeState(
      e,
    );
  }
}

/// @nodoc
const $CountryCodeState = _$CountryCodeStateTearOff();

/// @nodoc
mixin _$CountryCodeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() init,
    required TResult Function(String email, String phone) next,
    required TResult Function(ApiFailure e) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
    TResult Function(String email, String phone)? next,
    TResult Function(ApiFailure e)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
    TResult Function(String email, String phone)? next,
    TResult Function(ApiFailure e)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCountryCodeState value) loading,
    required TResult Function(InitCountryCodeState value) init,
    required TResult Function(NextCountryCodeState value) next,
    required TResult Function(ErrorCountryCodeState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingCountryCodeState value)? loading,
    TResult Function(InitCountryCodeState value)? init,
    TResult Function(NextCountryCodeState value)? next,
    TResult Function(ErrorCountryCodeState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCountryCodeState value)? loading,
    TResult Function(InitCountryCodeState value)? init,
    TResult Function(NextCountryCodeState value)? next,
    TResult Function(ErrorCountryCodeState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCodeStateCopyWith<$Res> {
  factory $CountryCodeStateCopyWith(
          CountryCodeState value, $Res Function(CountryCodeState) then) =
      _$CountryCodeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CountryCodeStateCopyWithImpl<$Res>
    implements $CountryCodeStateCopyWith<$Res> {
  _$CountryCodeStateCopyWithImpl(this._value, this._then);

  final CountryCodeState _value;
  // ignore: unused_field
  final $Res Function(CountryCodeState) _then;
}

/// @nodoc
abstract class $LoadingCountryCodeStateCopyWith<$Res> {
  factory $LoadingCountryCodeStateCopyWith(LoadingCountryCodeState value,
          $Res Function(LoadingCountryCodeState) then) =
      _$LoadingCountryCodeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCountryCodeStateCopyWithImpl<$Res>
    extends _$CountryCodeStateCopyWithImpl<$Res>
    implements $LoadingCountryCodeStateCopyWith<$Res> {
  _$LoadingCountryCodeStateCopyWithImpl(LoadingCountryCodeState _value,
      $Res Function(LoadingCountryCodeState) _then)
      : super(_value, (v) => _then(v as LoadingCountryCodeState));

  @override
  LoadingCountryCodeState get _value => super._value as LoadingCountryCodeState;
}

/// @nodoc

class _$LoadingCountryCodeState implements LoadingCountryCodeState {
  const _$LoadingCountryCodeState();

  @override
  String toString() {
    return 'CountryCodeState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingCountryCodeState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() init,
    required TResult Function(String email, String phone) next,
    required TResult Function(ApiFailure e) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
    TResult Function(String email, String phone)? next,
    TResult Function(ApiFailure e)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
    TResult Function(String email, String phone)? next,
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
    required TResult Function(LoadingCountryCodeState value) loading,
    required TResult Function(InitCountryCodeState value) init,
    required TResult Function(NextCountryCodeState value) next,
    required TResult Function(ErrorCountryCodeState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingCountryCodeState value)? loading,
    TResult Function(InitCountryCodeState value)? init,
    TResult Function(NextCountryCodeState value)? next,
    TResult Function(ErrorCountryCodeState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCountryCodeState value)? loading,
    TResult Function(InitCountryCodeState value)? init,
    TResult Function(NextCountryCodeState value)? next,
    TResult Function(ErrorCountryCodeState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingCountryCodeState implements CountryCodeState {
  const factory LoadingCountryCodeState() = _$LoadingCountryCodeState;
}

/// @nodoc
abstract class $InitCountryCodeStateCopyWith<$Res> {
  factory $InitCountryCodeStateCopyWith(InitCountryCodeState value,
          $Res Function(InitCountryCodeState) then) =
      _$InitCountryCodeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitCountryCodeStateCopyWithImpl<$Res>
    extends _$CountryCodeStateCopyWithImpl<$Res>
    implements $InitCountryCodeStateCopyWith<$Res> {
  _$InitCountryCodeStateCopyWithImpl(
      InitCountryCodeState _value, $Res Function(InitCountryCodeState) _then)
      : super(_value, (v) => _then(v as InitCountryCodeState));

  @override
  InitCountryCodeState get _value => super._value as InitCountryCodeState;
}

/// @nodoc

class _$InitCountryCodeState implements InitCountryCodeState {
  const _$InitCountryCodeState();

  @override
  String toString() {
    return 'CountryCodeState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitCountryCodeState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() init,
    required TResult Function(String email, String phone) next,
    required TResult Function(ApiFailure e) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
    TResult Function(String email, String phone)? next,
    TResult Function(ApiFailure e)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
    TResult Function(String email, String phone)? next,
    TResult Function(ApiFailure e)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCountryCodeState value) loading,
    required TResult Function(InitCountryCodeState value) init,
    required TResult Function(NextCountryCodeState value) next,
    required TResult Function(ErrorCountryCodeState value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingCountryCodeState value)? loading,
    TResult Function(InitCountryCodeState value)? init,
    TResult Function(NextCountryCodeState value)? next,
    TResult Function(ErrorCountryCodeState value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCountryCodeState value)? loading,
    TResult Function(InitCountryCodeState value)? init,
    TResult Function(NextCountryCodeState value)? next,
    TResult Function(ErrorCountryCodeState value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class InitCountryCodeState implements CountryCodeState {
  const factory InitCountryCodeState() = _$InitCountryCodeState;
}

/// @nodoc
abstract class $NextCountryCodeStateCopyWith<$Res> {
  factory $NextCountryCodeStateCopyWith(NextCountryCodeState value,
          $Res Function(NextCountryCodeState) then) =
      _$NextCountryCodeStateCopyWithImpl<$Res>;
  $Res call({String email, String phone});
}

/// @nodoc
class _$NextCountryCodeStateCopyWithImpl<$Res>
    extends _$CountryCodeStateCopyWithImpl<$Res>
    implements $NextCountryCodeStateCopyWith<$Res> {
  _$NextCountryCodeStateCopyWithImpl(
      NextCountryCodeState _value, $Res Function(NextCountryCodeState) _then)
      : super(_value, (v) => _then(v as NextCountryCodeState));

  @override
  NextCountryCodeState get _value => super._value as NextCountryCodeState;

  @override
  $Res call({
    Object? email = freezed,
    Object? phone = freezed,
  }) {
    return _then(NextCountryCodeState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NextCountryCodeState implements NextCountryCodeState {
  const _$NextCountryCodeState({required this.email, required this.phone});

  @override
  final String email;
  @override
  final String phone;

  @override
  String toString() {
    return 'CountryCodeState.next(email: $email, phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NextCountryCodeState &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone);

  @JsonKey(ignore: true)
  @override
  $NextCountryCodeStateCopyWith<NextCountryCodeState> get copyWith =>
      _$NextCountryCodeStateCopyWithImpl<NextCountryCodeState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() init,
    required TResult Function(String email, String phone) next,
    required TResult Function(ApiFailure e) error,
  }) {
    return next(email, phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
    TResult Function(String email, String phone)? next,
    TResult Function(ApiFailure e)? error,
  }) {
    return next?.call(email, phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
    TResult Function(String email, String phone)? next,
    TResult Function(ApiFailure e)? error,
    required TResult orElse(),
  }) {
    if (next != null) {
      return next(email, phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCountryCodeState value) loading,
    required TResult Function(InitCountryCodeState value) init,
    required TResult Function(NextCountryCodeState value) next,
    required TResult Function(ErrorCountryCodeState value) error,
  }) {
    return next(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingCountryCodeState value)? loading,
    TResult Function(InitCountryCodeState value)? init,
    TResult Function(NextCountryCodeState value)? next,
    TResult Function(ErrorCountryCodeState value)? error,
  }) {
    return next?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCountryCodeState value)? loading,
    TResult Function(InitCountryCodeState value)? init,
    TResult Function(NextCountryCodeState value)? next,
    TResult Function(ErrorCountryCodeState value)? error,
    required TResult orElse(),
  }) {
    if (next != null) {
      return next(this);
    }
    return orElse();
  }
}

abstract class NextCountryCodeState implements CountryCodeState {
  const factory NextCountryCodeState(
      {required String email, required String phone}) = _$NextCountryCodeState;

  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NextCountryCodeStateCopyWith<NextCountryCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorCountryCodeStateCopyWith<$Res> {
  factory $ErrorCountryCodeStateCopyWith(ErrorCountryCodeState value,
          $Res Function(ErrorCountryCodeState) then) =
      _$ErrorCountryCodeStateCopyWithImpl<$Res>;
  $Res call({ApiFailure e});
}

/// @nodoc
class _$ErrorCountryCodeStateCopyWithImpl<$Res>
    extends _$CountryCodeStateCopyWithImpl<$Res>
    implements $ErrorCountryCodeStateCopyWith<$Res> {
  _$ErrorCountryCodeStateCopyWithImpl(
      ErrorCountryCodeState _value, $Res Function(ErrorCountryCodeState) _then)
      : super(_value, (v) => _then(v as ErrorCountryCodeState));

  @override
  ErrorCountryCodeState get _value => super._value as ErrorCountryCodeState;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(ErrorCountryCodeState(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as ApiFailure,
    ));
  }
}

/// @nodoc

class _$ErrorCountryCodeState implements ErrorCountryCodeState {
  const _$ErrorCountryCodeState(this.e);

  @override
  final ApiFailure e;

  @override
  String toString() {
    return 'CountryCodeState.error(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorCountryCodeState &&
            (identical(other.e, e) ||
                const DeepCollectionEquality().equals(other.e, e)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(e);

  @JsonKey(ignore: true)
  @override
  $ErrorCountryCodeStateCopyWith<ErrorCountryCodeState> get copyWith =>
      _$ErrorCountryCodeStateCopyWithImpl<ErrorCountryCodeState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() init,
    required TResult Function(String email, String phone) next,
    required TResult Function(ApiFailure e) error,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
    TResult Function(String email, String phone)? next,
    TResult Function(ApiFailure e)? error,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
    TResult Function(String email, String phone)? next,
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
    required TResult Function(LoadingCountryCodeState value) loading,
    required TResult Function(InitCountryCodeState value) init,
    required TResult Function(NextCountryCodeState value) next,
    required TResult Function(ErrorCountryCodeState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingCountryCodeState value)? loading,
    TResult Function(InitCountryCodeState value)? init,
    TResult Function(NextCountryCodeState value)? next,
    TResult Function(ErrorCountryCodeState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCountryCodeState value)? loading,
    TResult Function(InitCountryCodeState value)? init,
    TResult Function(NextCountryCodeState value)? next,
    TResult Function(ErrorCountryCodeState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorCountryCodeState implements CountryCodeState {
  const factory ErrorCountryCodeState(ApiFailure e) = _$ErrorCountryCodeState;

  ApiFailure get e => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorCountryCodeStateCopyWith<ErrorCountryCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}
