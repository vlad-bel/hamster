// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_edit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileEditState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ApiFailure error) error,
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ApiFailure error)? error,
    TResult Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ApiFailure error)? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorProfileEditState value) error,
    required TResult Function(InitialProfileEditState value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ErrorProfileEditState value)? error,
    TResult Function(InitialProfileEditState value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorProfileEditState value)? error,
    TResult Function(InitialProfileEditState value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEditStateCopyWith<$Res> {
  factory $ProfileEditStateCopyWith(
          ProfileEditState value, $Res Function(ProfileEditState) then) =
      _$ProfileEditStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProfileEditStateCopyWithImpl<$Res>
    implements $ProfileEditStateCopyWith<$Res> {
  _$ProfileEditStateCopyWithImpl(this._value, this._then);

  final ProfileEditState _value;
  // ignore: unused_field
  final $Res Function(ProfileEditState) _then;
}

/// @nodoc
abstract class _$$ErrorProfileEditStateCopyWith<$Res> {
  factory _$$ErrorProfileEditStateCopyWith(_$ErrorProfileEditState value,
          $Res Function(_$ErrorProfileEditState) then) =
      __$$ErrorProfileEditStateCopyWithImpl<$Res>;
  $Res call({ApiFailure error});
}

/// @nodoc
class __$$ErrorProfileEditStateCopyWithImpl<$Res>
    extends _$ProfileEditStateCopyWithImpl<$Res>
    implements _$$ErrorProfileEditStateCopyWith<$Res> {
  __$$ErrorProfileEditStateCopyWithImpl(_$ErrorProfileEditState _value,
      $Res Function(_$ErrorProfileEditState) _then)
      : super(_value, (v) => _then(v as _$ErrorProfileEditState));

  @override
  _$ErrorProfileEditState get _value => super._value as _$ErrorProfileEditState;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ErrorProfileEditState(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiFailure,
    ));
  }
}

/// @nodoc

class _$ErrorProfileEditState implements ErrorProfileEditState {
  const _$ErrorProfileEditState({required this.error});

  @override
  final ApiFailure error;

  @override
  String toString() {
    return 'ProfileEditState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorProfileEditState &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$ErrorProfileEditStateCopyWith<_$ErrorProfileEditState> get copyWith =>
      __$$ErrorProfileEditStateCopyWithImpl<_$ErrorProfileEditState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ApiFailure error) error,
    required TResult Function() initial,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ApiFailure error)? error,
    TResult Function()? initial,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ApiFailure error)? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorProfileEditState value) error,
    required TResult Function(InitialProfileEditState value) initial,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ErrorProfileEditState value)? error,
    TResult Function(InitialProfileEditState value)? initial,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorProfileEditState value)? error,
    TResult Function(InitialProfileEditState value)? initial,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorProfileEditState implements ProfileEditState {
  const factory ErrorProfileEditState({required final ApiFailure error}) =
      _$ErrorProfileEditState;

  ApiFailure get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ErrorProfileEditStateCopyWith<_$ErrorProfileEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialProfileEditStateCopyWith<$Res> {
  factory _$$InitialProfileEditStateCopyWith(_$InitialProfileEditState value,
          $Res Function(_$InitialProfileEditState) then) =
      __$$InitialProfileEditStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialProfileEditStateCopyWithImpl<$Res>
    extends _$ProfileEditStateCopyWithImpl<$Res>
    implements _$$InitialProfileEditStateCopyWith<$Res> {
  __$$InitialProfileEditStateCopyWithImpl(_$InitialProfileEditState _value,
      $Res Function(_$InitialProfileEditState) _then)
      : super(_value, (v) => _then(v as _$InitialProfileEditState));

  @override
  _$InitialProfileEditState get _value =>
      super._value as _$InitialProfileEditState;
}

/// @nodoc

class _$InitialProfileEditState implements InitialProfileEditState {
  const _$InitialProfileEditState();

  @override
  String toString() {
    return 'ProfileEditState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialProfileEditState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ApiFailure error) error,
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ApiFailure error)? error,
    TResult Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ApiFailure error)? error,
    TResult Function()? initial,
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
    required TResult Function(ErrorProfileEditState value) error,
    required TResult Function(InitialProfileEditState value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ErrorProfileEditState value)? error,
    TResult Function(InitialProfileEditState value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorProfileEditState value)? error,
    TResult Function(InitialProfileEditState value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialProfileEditState implements ProfileEditState {
  const factory InitialProfileEditState() = _$InitialProfileEditState;
}
