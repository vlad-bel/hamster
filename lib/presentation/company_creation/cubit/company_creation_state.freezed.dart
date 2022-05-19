// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'company_creation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CompanyCreationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(ApiFailure e) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(ApiFailure e)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(ApiFailure e)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitCompanyCreationState value) init,
    required TResult Function(LoadingCompanyCreationState value) loading,
    required TResult Function(SuccessCompanyCreationState value) success,
    required TResult Function(ErrorCompanyCreationState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitCompanyCreationState value)? init,
    TResult Function(LoadingCompanyCreationState value)? loading,
    TResult Function(SuccessCompanyCreationState value)? success,
    TResult Function(ErrorCompanyCreationState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitCompanyCreationState value)? init,
    TResult Function(LoadingCompanyCreationState value)? loading,
    TResult Function(SuccessCompanyCreationState value)? success,
    TResult Function(ErrorCompanyCreationState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyCreationStateCopyWith<$Res> {
  factory $CompanyCreationStateCopyWith(CompanyCreationState value,
          $Res Function(CompanyCreationState) then) =
      _$CompanyCreationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CompanyCreationStateCopyWithImpl<$Res>
    implements $CompanyCreationStateCopyWith<$Res> {
  _$CompanyCreationStateCopyWithImpl(this._value, this._then);

  final CompanyCreationState _value;
  // ignore: unused_field
  final $Res Function(CompanyCreationState) _then;
}

/// @nodoc
abstract class _$$InitCompanyCreationStateCopyWith<$Res> {
  factory _$$InitCompanyCreationStateCopyWith(_$InitCompanyCreationState value,
          $Res Function(_$InitCompanyCreationState) then) =
      __$$InitCompanyCreationStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitCompanyCreationStateCopyWithImpl<$Res>
    extends _$CompanyCreationStateCopyWithImpl<$Res>
    implements _$$InitCompanyCreationStateCopyWith<$Res> {
  __$$InitCompanyCreationStateCopyWithImpl(_$InitCompanyCreationState _value,
      $Res Function(_$InitCompanyCreationState) _then)
      : super(_value, (v) => _then(v as _$InitCompanyCreationState));

  @override
  _$InitCompanyCreationState get _value =>
      super._value as _$InitCompanyCreationState;
}

/// @nodoc

class _$InitCompanyCreationState implements InitCompanyCreationState {
  const _$InitCompanyCreationState();

  @override
  String toString() {
    return 'CompanyCreationState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitCompanyCreationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(ApiFailure e) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(ApiFailure e)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? success,
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
    required TResult Function(InitCompanyCreationState value) init,
    required TResult Function(LoadingCompanyCreationState value) loading,
    required TResult Function(SuccessCompanyCreationState value) success,
    required TResult Function(ErrorCompanyCreationState value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitCompanyCreationState value)? init,
    TResult Function(LoadingCompanyCreationState value)? loading,
    TResult Function(SuccessCompanyCreationState value)? success,
    TResult Function(ErrorCompanyCreationState value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitCompanyCreationState value)? init,
    TResult Function(LoadingCompanyCreationState value)? loading,
    TResult Function(SuccessCompanyCreationState value)? success,
    TResult Function(ErrorCompanyCreationState value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class InitCompanyCreationState implements CompanyCreationState {
  const factory InitCompanyCreationState() = _$InitCompanyCreationState;
}

/// @nodoc
abstract class _$$LoadingCompanyCreationStateCopyWith<$Res> {
  factory _$$LoadingCompanyCreationStateCopyWith(
          _$LoadingCompanyCreationState value,
          $Res Function(_$LoadingCompanyCreationState) then) =
      __$$LoadingCompanyCreationStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCompanyCreationStateCopyWithImpl<$Res>
    extends _$CompanyCreationStateCopyWithImpl<$Res>
    implements _$$LoadingCompanyCreationStateCopyWith<$Res> {
  __$$LoadingCompanyCreationStateCopyWithImpl(
      _$LoadingCompanyCreationState _value,
      $Res Function(_$LoadingCompanyCreationState) _then)
      : super(_value, (v) => _then(v as _$LoadingCompanyCreationState));

  @override
  _$LoadingCompanyCreationState get _value =>
      super._value as _$LoadingCompanyCreationState;
}

/// @nodoc

class _$LoadingCompanyCreationState implements LoadingCompanyCreationState {
  const _$LoadingCompanyCreationState();

  @override
  String toString() {
    return 'CompanyCreationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingCompanyCreationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(ApiFailure e) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(ApiFailure e)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? success,
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
    required TResult Function(InitCompanyCreationState value) init,
    required TResult Function(LoadingCompanyCreationState value) loading,
    required TResult Function(SuccessCompanyCreationState value) success,
    required TResult Function(ErrorCompanyCreationState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitCompanyCreationState value)? init,
    TResult Function(LoadingCompanyCreationState value)? loading,
    TResult Function(SuccessCompanyCreationState value)? success,
    TResult Function(ErrorCompanyCreationState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitCompanyCreationState value)? init,
    TResult Function(LoadingCompanyCreationState value)? loading,
    TResult Function(SuccessCompanyCreationState value)? success,
    TResult Function(ErrorCompanyCreationState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingCompanyCreationState implements CompanyCreationState {
  const factory LoadingCompanyCreationState() = _$LoadingCompanyCreationState;
}

/// @nodoc
abstract class _$$SuccessCompanyCreationStateCopyWith<$Res> {
  factory _$$SuccessCompanyCreationStateCopyWith(
          _$SuccessCompanyCreationState value,
          $Res Function(_$SuccessCompanyCreationState) then) =
      __$$SuccessCompanyCreationStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessCompanyCreationStateCopyWithImpl<$Res>
    extends _$CompanyCreationStateCopyWithImpl<$Res>
    implements _$$SuccessCompanyCreationStateCopyWith<$Res> {
  __$$SuccessCompanyCreationStateCopyWithImpl(
      _$SuccessCompanyCreationState _value,
      $Res Function(_$SuccessCompanyCreationState) _then)
      : super(_value, (v) => _then(v as _$SuccessCompanyCreationState));

  @override
  _$SuccessCompanyCreationState get _value =>
      super._value as _$SuccessCompanyCreationState;
}

/// @nodoc

class _$SuccessCompanyCreationState implements SuccessCompanyCreationState {
  const _$SuccessCompanyCreationState();

  @override
  String toString() {
    return 'CompanyCreationState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessCompanyCreationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(ApiFailure e) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(ApiFailure e)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(ApiFailure e)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitCompanyCreationState value) init,
    required TResult Function(LoadingCompanyCreationState value) loading,
    required TResult Function(SuccessCompanyCreationState value) success,
    required TResult Function(ErrorCompanyCreationState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitCompanyCreationState value)? init,
    TResult Function(LoadingCompanyCreationState value)? loading,
    TResult Function(SuccessCompanyCreationState value)? success,
    TResult Function(ErrorCompanyCreationState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitCompanyCreationState value)? init,
    TResult Function(LoadingCompanyCreationState value)? loading,
    TResult Function(SuccessCompanyCreationState value)? success,
    TResult Function(ErrorCompanyCreationState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessCompanyCreationState implements CompanyCreationState {
  const factory SuccessCompanyCreationState() = _$SuccessCompanyCreationState;
}

/// @nodoc
abstract class _$$ErrorCompanyCreationStateCopyWith<$Res> {
  factory _$$ErrorCompanyCreationStateCopyWith(
          _$ErrorCompanyCreationState value,
          $Res Function(_$ErrorCompanyCreationState) then) =
      __$$ErrorCompanyCreationStateCopyWithImpl<$Res>;
  $Res call({ApiFailure e});
}

/// @nodoc
class __$$ErrorCompanyCreationStateCopyWithImpl<$Res>
    extends _$CompanyCreationStateCopyWithImpl<$Res>
    implements _$$ErrorCompanyCreationStateCopyWith<$Res> {
  __$$ErrorCompanyCreationStateCopyWithImpl(_$ErrorCompanyCreationState _value,
      $Res Function(_$ErrorCompanyCreationState) _then)
      : super(_value, (v) => _then(v as _$ErrorCompanyCreationState));

  @override
  _$ErrorCompanyCreationState get _value =>
      super._value as _$ErrorCompanyCreationState;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_$ErrorCompanyCreationState(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as ApiFailure,
    ));
  }
}

/// @nodoc

class _$ErrorCompanyCreationState implements ErrorCompanyCreationState {
  const _$ErrorCompanyCreationState(this.e);

  @override
  final ApiFailure e;

  @override
  String toString() {
    return 'CompanyCreationState.error(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorCompanyCreationState &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  _$$ErrorCompanyCreationStateCopyWith<_$ErrorCompanyCreationState>
      get copyWith => __$$ErrorCompanyCreationStateCopyWithImpl<
          _$ErrorCompanyCreationState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(ApiFailure e) error,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(ApiFailure e)? error,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? success,
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
    required TResult Function(InitCompanyCreationState value) init,
    required TResult Function(LoadingCompanyCreationState value) loading,
    required TResult Function(SuccessCompanyCreationState value) success,
    required TResult Function(ErrorCompanyCreationState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitCompanyCreationState value)? init,
    TResult Function(LoadingCompanyCreationState value)? loading,
    TResult Function(SuccessCompanyCreationState value)? success,
    TResult Function(ErrorCompanyCreationState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitCompanyCreationState value)? init,
    TResult Function(LoadingCompanyCreationState value)? loading,
    TResult Function(SuccessCompanyCreationState value)? success,
    TResult Function(ErrorCompanyCreationState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorCompanyCreationState implements CompanyCreationState {
  const factory ErrorCompanyCreationState(final ApiFailure e) =
      _$ErrorCompanyCreationState;

  ApiFailure get e => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ErrorCompanyCreationStateCopyWith<_$ErrorCompanyCreationState>
      get copyWith => throw _privateConstructorUsedError;
}
