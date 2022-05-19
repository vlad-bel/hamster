// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'country_code_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$LoadingCountryCodeStateCopyWith<$Res> {
  factory _$$LoadingCountryCodeStateCopyWith(_$LoadingCountryCodeState value,
          $Res Function(_$LoadingCountryCodeState) then) =
      __$$LoadingCountryCodeStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCountryCodeStateCopyWithImpl<$Res>
    extends _$CountryCodeStateCopyWithImpl<$Res>
    implements _$$LoadingCountryCodeStateCopyWith<$Res> {
  __$$LoadingCountryCodeStateCopyWithImpl(_$LoadingCountryCodeState _value,
      $Res Function(_$LoadingCountryCodeState) _then)
      : super(_value, (v) => _then(v as _$LoadingCountryCodeState));

  @override
  _$LoadingCountryCodeState get _value =>
      super._value as _$LoadingCountryCodeState;
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
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingCountryCodeState);
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
abstract class _$$InitCountryCodeStateCopyWith<$Res> {
  factory _$$InitCountryCodeStateCopyWith(_$InitCountryCodeState value,
          $Res Function(_$InitCountryCodeState) then) =
      __$$InitCountryCodeStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitCountryCodeStateCopyWithImpl<$Res>
    extends _$CountryCodeStateCopyWithImpl<$Res>
    implements _$$InitCountryCodeStateCopyWith<$Res> {
  __$$InitCountryCodeStateCopyWithImpl(_$InitCountryCodeState _value,
      $Res Function(_$InitCountryCodeState) _then)
      : super(_value, (v) => _then(v as _$InitCountryCodeState));

  @override
  _$InitCountryCodeState get _value => super._value as _$InitCountryCodeState;
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
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitCountryCodeState);
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
abstract class _$$NextCountryCodeStateCopyWith<$Res> {
  factory _$$NextCountryCodeStateCopyWith(_$NextCountryCodeState value,
          $Res Function(_$NextCountryCodeState) then) =
      __$$NextCountryCodeStateCopyWithImpl<$Res>;
  $Res call({String email, String phone});
}

/// @nodoc
class __$$NextCountryCodeStateCopyWithImpl<$Res>
    extends _$CountryCodeStateCopyWithImpl<$Res>
    implements _$$NextCountryCodeStateCopyWith<$Res> {
  __$$NextCountryCodeStateCopyWithImpl(_$NextCountryCodeState _value,
      $Res Function(_$NextCountryCodeState) _then)
      : super(_value, (v) => _then(v as _$NextCountryCodeState));

  @override
  _$NextCountryCodeState get _value => super._value as _$NextCountryCodeState;

  @override
  $Res call({
    Object? email = freezed,
    Object? phone = freezed,
  }) {
    return _then(_$NextCountryCodeState(
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
        (other.runtimeType == runtimeType &&
            other is _$NextCountryCodeState &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.phone, phone));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(phone));

  @JsonKey(ignore: true)
  @override
  _$$NextCountryCodeStateCopyWith<_$NextCountryCodeState> get copyWith =>
      __$$NextCountryCodeStateCopyWithImpl<_$NextCountryCodeState>(
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
      {required final String email,
      required final String phone}) = _$NextCountryCodeState;

  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$NextCountryCodeStateCopyWith<_$NextCountryCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorCountryCodeStateCopyWith<$Res> {
  factory _$$ErrorCountryCodeStateCopyWith(_$ErrorCountryCodeState value,
          $Res Function(_$ErrorCountryCodeState) then) =
      __$$ErrorCountryCodeStateCopyWithImpl<$Res>;
  $Res call({ApiFailure e});
}

/// @nodoc
class __$$ErrorCountryCodeStateCopyWithImpl<$Res>
    extends _$CountryCodeStateCopyWithImpl<$Res>
    implements _$$ErrorCountryCodeStateCopyWith<$Res> {
  __$$ErrorCountryCodeStateCopyWithImpl(_$ErrorCountryCodeState _value,
      $Res Function(_$ErrorCountryCodeState) _then)
      : super(_value, (v) => _then(v as _$ErrorCountryCodeState));

  @override
  _$ErrorCountryCodeState get _value => super._value as _$ErrorCountryCodeState;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_$ErrorCountryCodeState(
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
        (other.runtimeType == runtimeType &&
            other is _$ErrorCountryCodeState &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  _$$ErrorCountryCodeStateCopyWith<_$ErrorCountryCodeState> get copyWith =>
      __$$ErrorCountryCodeStateCopyWithImpl<_$ErrorCountryCodeState>(
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
  const factory ErrorCountryCodeState(final ApiFailure e) =
      _$ErrorCountryCodeState;

  ApiFailure get e => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ErrorCountryCodeStateCopyWith<_$ErrorCountryCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}
