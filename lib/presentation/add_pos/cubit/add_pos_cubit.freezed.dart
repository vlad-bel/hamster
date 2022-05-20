// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_pos_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddPosState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginResponse response) success,
    required TResult Function(ApiFailure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? success,
    TResult Function(ApiFailure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? success,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAddPos value) initial,
    required TResult Function(LoadingAddPos value) loading,
    required TResult Function(SuccessAddPos value) success,
    required TResult Function(ErrorAddPos value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialAddPos value)? initial,
    TResult Function(LoadingAddPos value)? loading,
    TResult Function(SuccessAddPos value)? success,
    TResult Function(ErrorAddPos value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAddPos value)? initial,
    TResult Function(LoadingAddPos value)? loading,
    TResult Function(SuccessAddPos value)? success,
    TResult Function(ErrorAddPos value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPosStateCopyWith<$Res> {
  factory $AddPosStateCopyWith(
          AddPosState value, $Res Function(AddPosState) then) =
      _$AddPosStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AddPosStateCopyWithImpl<$Res> implements $AddPosStateCopyWith<$Res> {
  _$AddPosStateCopyWithImpl(this._value, this._then);

  final AddPosState _value;
  // ignore: unused_field
  final $Res Function(AddPosState) _then;
}

/// @nodoc
abstract class _$$InitialAddPosCopyWith<$Res> {
  factory _$$InitialAddPosCopyWith(
          _$InitialAddPos value, $Res Function(_$InitialAddPos) then) =
      __$$InitialAddPosCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialAddPosCopyWithImpl<$Res>
    extends _$AddPosStateCopyWithImpl<$Res>
    implements _$$InitialAddPosCopyWith<$Res> {
  __$$InitialAddPosCopyWithImpl(
      _$InitialAddPos _value, $Res Function(_$InitialAddPos) _then)
      : super(_value, (v) => _then(v as _$InitialAddPos));

  @override
  _$InitialAddPos get _value => super._value as _$InitialAddPos;
}

/// @nodoc

class _$InitialAddPos implements InitialAddPos {
  const _$InitialAddPos();

  @override
  String toString() {
    return 'AddPosState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialAddPos);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginResponse response) success,
    required TResult Function(ApiFailure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? success,
    TResult Function(ApiFailure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? success,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAddPos value) initial,
    required TResult Function(LoadingAddPos value) loading,
    required TResult Function(SuccessAddPos value) success,
    required TResult Function(ErrorAddPos value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialAddPos value)? initial,
    TResult Function(LoadingAddPos value)? loading,
    TResult Function(SuccessAddPos value)? success,
    TResult Function(ErrorAddPos value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAddPos value)? initial,
    TResult Function(LoadingAddPos value)? loading,
    TResult Function(SuccessAddPos value)? success,
    TResult Function(ErrorAddPos value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialAddPos implements AddPosState {
  const factory InitialAddPos() = _$InitialAddPos;
}

/// @nodoc
abstract class _$$LoadingAddPosCopyWith<$Res> {
  factory _$$LoadingAddPosCopyWith(
          _$LoadingAddPos value, $Res Function(_$LoadingAddPos) then) =
      __$$LoadingAddPosCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingAddPosCopyWithImpl<$Res>
    extends _$AddPosStateCopyWithImpl<$Res>
    implements _$$LoadingAddPosCopyWith<$Res> {
  __$$LoadingAddPosCopyWithImpl(
      _$LoadingAddPos _value, $Res Function(_$LoadingAddPos) _then)
      : super(_value, (v) => _then(v as _$LoadingAddPos));

  @override
  _$LoadingAddPos get _value => super._value as _$LoadingAddPos;
}

/// @nodoc

class _$LoadingAddPos implements LoadingAddPos {
  const _$LoadingAddPos();

  @override
  String toString() {
    return 'AddPosState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingAddPos);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginResponse response) success,
    required TResult Function(ApiFailure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? success,
    TResult Function(ApiFailure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? success,
    TResult Function(ApiFailure failure)? error,
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
    required TResult Function(InitialAddPos value) initial,
    required TResult Function(LoadingAddPos value) loading,
    required TResult Function(SuccessAddPos value) success,
    required TResult Function(ErrorAddPos value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialAddPos value)? initial,
    TResult Function(LoadingAddPos value)? loading,
    TResult Function(SuccessAddPos value)? success,
    TResult Function(ErrorAddPos value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAddPos value)? initial,
    TResult Function(LoadingAddPos value)? loading,
    TResult Function(SuccessAddPos value)? success,
    TResult Function(ErrorAddPos value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingAddPos implements AddPosState {
  const factory LoadingAddPos() = _$LoadingAddPos;
}

/// @nodoc
abstract class _$$SuccessAddPosCopyWith<$Res> {
  factory _$$SuccessAddPosCopyWith(
          _$SuccessAddPos value, $Res Function(_$SuccessAddPos) then) =
      __$$SuccessAddPosCopyWithImpl<$Res>;
  $Res call({LoginResponse response});
}

/// @nodoc
class __$$SuccessAddPosCopyWithImpl<$Res>
    extends _$AddPosStateCopyWithImpl<$Res>
    implements _$$SuccessAddPosCopyWith<$Res> {
  __$$SuccessAddPosCopyWithImpl(
      _$SuccessAddPos _value, $Res Function(_$SuccessAddPos) _then)
      : super(_value, (v) => _then(v as _$SuccessAddPos));

  @override
  _$SuccessAddPos get _value => super._value as _$SuccessAddPos;

  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$SuccessAddPos(
      response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as LoginResponse,
    ));
  }
}

/// @nodoc

class _$SuccessAddPos implements SuccessAddPos {
  const _$SuccessAddPos(this.response);

  @override
  final LoginResponse response;

  @override
  String toString() {
    return 'AddPosState.success(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessAddPos &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  @JsonKey(ignore: true)
  @override
  _$$SuccessAddPosCopyWith<_$SuccessAddPos> get copyWith =>
      __$$SuccessAddPosCopyWithImpl<_$SuccessAddPos>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginResponse response) success,
    required TResult Function(ApiFailure failure) error,
  }) {
    return success(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? success,
    TResult Function(ApiFailure failure)? error,
  }) {
    return success?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? success,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAddPos value) initial,
    required TResult Function(LoadingAddPos value) loading,
    required TResult Function(SuccessAddPos value) success,
    required TResult Function(ErrorAddPos value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialAddPos value)? initial,
    TResult Function(LoadingAddPos value)? loading,
    TResult Function(SuccessAddPos value)? success,
    TResult Function(ErrorAddPos value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAddPos value)? initial,
    TResult Function(LoadingAddPos value)? loading,
    TResult Function(SuccessAddPos value)? success,
    TResult Function(ErrorAddPos value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessAddPos implements AddPosState {
  const factory SuccessAddPos(final LoginResponse response) = _$SuccessAddPos;

  LoginResponse get response => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SuccessAddPosCopyWith<_$SuccessAddPos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorAddPosCopyWith<$Res> {
  factory _$$ErrorAddPosCopyWith(
          _$ErrorAddPos value, $Res Function(_$ErrorAddPos) then) =
      __$$ErrorAddPosCopyWithImpl<$Res>;
  $Res call({ApiFailure failure});
}

/// @nodoc
class __$$ErrorAddPosCopyWithImpl<$Res> extends _$AddPosStateCopyWithImpl<$Res>
    implements _$$ErrorAddPosCopyWith<$Res> {
  __$$ErrorAddPosCopyWithImpl(
      _$ErrorAddPos _value, $Res Function(_$ErrorAddPos) _then)
      : super(_value, (v) => _then(v as _$ErrorAddPos));

  @override
  _$ErrorAddPos get _value => super._value as _$ErrorAddPos;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$ErrorAddPos(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as ApiFailure,
    ));
  }
}

/// @nodoc

class _$ErrorAddPos implements ErrorAddPos {
  const _$ErrorAddPos(this.failure);

  @override
  final ApiFailure failure;

  @override
  String toString() {
    return 'AddPosState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorAddPos &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$ErrorAddPosCopyWith<_$ErrorAddPos> get copyWith =>
      __$$ErrorAddPosCopyWithImpl<_$ErrorAddPos>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginResponse response) success,
    required TResult Function(ApiFailure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? success,
    TResult Function(ApiFailure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? success,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAddPos value) initial,
    required TResult Function(LoadingAddPos value) loading,
    required TResult Function(SuccessAddPos value) success,
    required TResult Function(ErrorAddPos value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialAddPos value)? initial,
    TResult Function(LoadingAddPos value)? loading,
    TResult Function(SuccessAddPos value)? success,
    TResult Function(ErrorAddPos value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAddPos value)? initial,
    TResult Function(LoadingAddPos value)? loading,
    TResult Function(SuccessAddPos value)? success,
    TResult Function(ErrorAddPos value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorAddPos implements AddPosState {
  const factory ErrorAddPos(final ApiFailure failure) = _$ErrorAddPos;

  ApiFailure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ErrorAddPosCopyWith<_$ErrorAddPos> get copyWith =>
      throw _privateConstructorUsedError;
}
