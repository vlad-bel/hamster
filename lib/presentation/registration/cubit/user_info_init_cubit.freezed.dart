// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_info_init_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserInfoInitState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool shouldShowPasswordValidationWidget) initial,
    required TResult Function() loading,
    required TResult Function(String response) success,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldShowPasswordValidationWidget)? initial,
    TResult Function()? loading,
    TResult Function(String response)? success,
    TResult Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldShowPasswordValidationWidget)? initial,
    TResult Function()? loading,
    TResult Function(String response)? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialUserInfoInit value) initial,
    required TResult Function(LoadingUserInfoInit value) loading,
    required TResult Function(SuccessUserInfoInit value) success,
    required TResult Function(ErrorUserInfoInit value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialUserInfoInit value)? initial,
    TResult Function(LoadingUserInfoInit value)? loading,
    TResult Function(SuccessUserInfoInit value)? success,
    TResult Function(ErrorUserInfoInit value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialUserInfoInit value)? initial,
    TResult Function(LoadingUserInfoInit value)? loading,
    TResult Function(SuccessUserInfoInit value)? success,
    TResult Function(ErrorUserInfoInit value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoInitStateCopyWith<$Res> {
  factory $UserInfoInitStateCopyWith(
          UserInfoInitState value, $Res Function(UserInfoInitState) then) =
      _$UserInfoInitStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserInfoInitStateCopyWithImpl<$Res>
    implements $UserInfoInitStateCopyWith<$Res> {
  _$UserInfoInitStateCopyWithImpl(this._value, this._then);

  final UserInfoInitState _value;
  // ignore: unused_field
  final $Res Function(UserInfoInitState) _then;
}

/// @nodoc
abstract class _$$InitialUserInfoInitCopyWith<$Res> {
  factory _$$InitialUserInfoInitCopyWith(_$InitialUserInfoInit value,
          $Res Function(_$InitialUserInfoInit) then) =
      __$$InitialUserInfoInitCopyWithImpl<$Res>;
  $Res call({bool shouldShowPasswordValidationWidget});
}

/// @nodoc
class __$$InitialUserInfoInitCopyWithImpl<$Res>
    extends _$UserInfoInitStateCopyWithImpl<$Res>
    implements _$$InitialUserInfoInitCopyWith<$Res> {
  __$$InitialUserInfoInitCopyWithImpl(
      _$InitialUserInfoInit _value, $Res Function(_$InitialUserInfoInit) _then)
      : super(_value, (v) => _then(v as _$InitialUserInfoInit));

  @override
  _$InitialUserInfoInit get _value => super._value as _$InitialUserInfoInit;

  @override
  $Res call({
    Object? shouldShowPasswordValidationWidget = freezed,
  }) {
    return _then(_$InitialUserInfoInit(
      shouldShowPasswordValidationWidget: shouldShowPasswordValidationWidget ==
              freezed
          ? _value.shouldShowPasswordValidationWidget
          : shouldShowPasswordValidationWidget // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialUserInfoInit implements InitialUserInfoInit {
  const _$InitialUserInfoInit(
      {this.shouldShowPasswordValidationWidget = false});

  @override
  @JsonKey()
  final bool shouldShowPasswordValidationWidget;

  @override
  String toString() {
    return 'UserInfoInitState.initial(shouldShowPasswordValidationWidget: $shouldShowPasswordValidationWidget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialUserInfoInit &&
            const DeepCollectionEquality().equals(
                other.shouldShowPasswordValidationWidget,
                shouldShowPasswordValidationWidget));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(shouldShowPasswordValidationWidget));

  @JsonKey(ignore: true)
  @override
  _$$InitialUserInfoInitCopyWith<_$InitialUserInfoInit> get copyWith =>
      __$$InitialUserInfoInitCopyWithImpl<_$InitialUserInfoInit>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool shouldShowPasswordValidationWidget) initial,
    required TResult Function() loading,
    required TResult Function(String response) success,
    required TResult Function(Failure failure) error,
  }) {
    return initial(shouldShowPasswordValidationWidget);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldShowPasswordValidationWidget)? initial,
    TResult Function()? loading,
    TResult Function(String response)? success,
    TResult Function(Failure failure)? error,
  }) {
    return initial?.call(shouldShowPasswordValidationWidget);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldShowPasswordValidationWidget)? initial,
    TResult Function()? loading,
    TResult Function(String response)? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(shouldShowPasswordValidationWidget);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialUserInfoInit value) initial,
    required TResult Function(LoadingUserInfoInit value) loading,
    required TResult Function(SuccessUserInfoInit value) success,
    required TResult Function(ErrorUserInfoInit value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialUserInfoInit value)? initial,
    TResult Function(LoadingUserInfoInit value)? loading,
    TResult Function(SuccessUserInfoInit value)? success,
    TResult Function(ErrorUserInfoInit value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialUserInfoInit value)? initial,
    TResult Function(LoadingUserInfoInit value)? loading,
    TResult Function(SuccessUserInfoInit value)? success,
    TResult Function(ErrorUserInfoInit value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialUserInfoInit implements UserInfoInitState {
  const factory InitialUserInfoInit(
      {final bool shouldShowPasswordValidationWidget}) = _$InitialUserInfoInit;

  bool get shouldShowPasswordValidationWidget =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$InitialUserInfoInitCopyWith<_$InitialUserInfoInit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingUserInfoInitCopyWith<$Res> {
  factory _$$LoadingUserInfoInitCopyWith(_$LoadingUserInfoInit value,
          $Res Function(_$LoadingUserInfoInit) then) =
      __$$LoadingUserInfoInitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingUserInfoInitCopyWithImpl<$Res>
    extends _$UserInfoInitStateCopyWithImpl<$Res>
    implements _$$LoadingUserInfoInitCopyWith<$Res> {
  __$$LoadingUserInfoInitCopyWithImpl(
      _$LoadingUserInfoInit _value, $Res Function(_$LoadingUserInfoInit) _then)
      : super(_value, (v) => _then(v as _$LoadingUserInfoInit));

  @override
  _$LoadingUserInfoInit get _value => super._value as _$LoadingUserInfoInit;
}

/// @nodoc

class _$LoadingUserInfoInit implements LoadingUserInfoInit {
  const _$LoadingUserInfoInit();

  @override
  String toString() {
    return 'UserInfoInitState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingUserInfoInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool shouldShowPasswordValidationWidget) initial,
    required TResult Function() loading,
    required TResult Function(String response) success,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldShowPasswordValidationWidget)? initial,
    TResult Function()? loading,
    TResult Function(String response)? success,
    TResult Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldShowPasswordValidationWidget)? initial,
    TResult Function()? loading,
    TResult Function(String response)? success,
    TResult Function(Failure failure)? error,
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
    required TResult Function(InitialUserInfoInit value) initial,
    required TResult Function(LoadingUserInfoInit value) loading,
    required TResult Function(SuccessUserInfoInit value) success,
    required TResult Function(ErrorUserInfoInit value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialUserInfoInit value)? initial,
    TResult Function(LoadingUserInfoInit value)? loading,
    TResult Function(SuccessUserInfoInit value)? success,
    TResult Function(ErrorUserInfoInit value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialUserInfoInit value)? initial,
    TResult Function(LoadingUserInfoInit value)? loading,
    TResult Function(SuccessUserInfoInit value)? success,
    TResult Function(ErrorUserInfoInit value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingUserInfoInit implements UserInfoInitState {
  const factory LoadingUserInfoInit() = _$LoadingUserInfoInit;
}

/// @nodoc
abstract class _$$SuccessUserInfoInitCopyWith<$Res> {
  factory _$$SuccessUserInfoInitCopyWith(_$SuccessUserInfoInit value,
          $Res Function(_$SuccessUserInfoInit) then) =
      __$$SuccessUserInfoInitCopyWithImpl<$Res>;
  $Res call({String response});
}

/// @nodoc
class __$$SuccessUserInfoInitCopyWithImpl<$Res>
    extends _$UserInfoInitStateCopyWithImpl<$Res>
    implements _$$SuccessUserInfoInitCopyWith<$Res> {
  __$$SuccessUserInfoInitCopyWithImpl(
      _$SuccessUserInfoInit _value, $Res Function(_$SuccessUserInfoInit) _then)
      : super(_value, (v) => _then(v as _$SuccessUserInfoInit));

  @override
  _$SuccessUserInfoInit get _value => super._value as _$SuccessUserInfoInit;

  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$SuccessUserInfoInit(
      response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuccessUserInfoInit implements SuccessUserInfoInit {
  const _$SuccessUserInfoInit(this.response);

  @override
  final String response;

  @override
  String toString() {
    return 'UserInfoInitState.success(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessUserInfoInit &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  @JsonKey(ignore: true)
  @override
  _$$SuccessUserInfoInitCopyWith<_$SuccessUserInfoInit> get copyWith =>
      __$$SuccessUserInfoInitCopyWithImpl<_$SuccessUserInfoInit>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool shouldShowPasswordValidationWidget) initial,
    required TResult Function() loading,
    required TResult Function(String response) success,
    required TResult Function(Failure failure) error,
  }) {
    return success(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldShowPasswordValidationWidget)? initial,
    TResult Function()? loading,
    TResult Function(String response)? success,
    TResult Function(Failure failure)? error,
  }) {
    return success?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldShowPasswordValidationWidget)? initial,
    TResult Function()? loading,
    TResult Function(String response)? success,
    TResult Function(Failure failure)? error,
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
    required TResult Function(InitialUserInfoInit value) initial,
    required TResult Function(LoadingUserInfoInit value) loading,
    required TResult Function(SuccessUserInfoInit value) success,
    required TResult Function(ErrorUserInfoInit value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialUserInfoInit value)? initial,
    TResult Function(LoadingUserInfoInit value)? loading,
    TResult Function(SuccessUserInfoInit value)? success,
    TResult Function(ErrorUserInfoInit value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialUserInfoInit value)? initial,
    TResult Function(LoadingUserInfoInit value)? loading,
    TResult Function(SuccessUserInfoInit value)? success,
    TResult Function(ErrorUserInfoInit value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessUserInfoInit implements UserInfoInitState {
  const factory SuccessUserInfoInit(final String response) =
      _$SuccessUserInfoInit;

  String get response => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SuccessUserInfoInitCopyWith<_$SuccessUserInfoInit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorUserInfoInitCopyWith<$Res> {
  factory _$$ErrorUserInfoInitCopyWith(
          _$ErrorUserInfoInit value, $Res Function(_$ErrorUserInfoInit) then) =
      __$$ErrorUserInfoInitCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class __$$ErrorUserInfoInitCopyWithImpl<$Res>
    extends _$UserInfoInitStateCopyWithImpl<$Res>
    implements _$$ErrorUserInfoInitCopyWith<$Res> {
  __$$ErrorUserInfoInitCopyWithImpl(
      _$ErrorUserInfoInit _value, $Res Function(_$ErrorUserInfoInit) _then)
      : super(_value, (v) => _then(v as _$ErrorUserInfoInit));

  @override
  _$ErrorUserInfoInit get _value => super._value as _$ErrorUserInfoInit;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$ErrorUserInfoInit(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$ErrorUserInfoInit implements ErrorUserInfoInit {
  const _$ErrorUserInfoInit(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'UserInfoInitState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorUserInfoInit &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$ErrorUserInfoInitCopyWith<_$ErrorUserInfoInit> get copyWith =>
      __$$ErrorUserInfoInitCopyWithImpl<_$ErrorUserInfoInit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool shouldShowPasswordValidationWidget) initial,
    required TResult Function() loading,
    required TResult Function(String response) success,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldShowPasswordValidationWidget)? initial,
    TResult Function()? loading,
    TResult Function(String response)? success,
    TResult Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldShowPasswordValidationWidget)? initial,
    TResult Function()? loading,
    TResult Function(String response)? success,
    TResult Function(Failure failure)? error,
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
    required TResult Function(InitialUserInfoInit value) initial,
    required TResult Function(LoadingUserInfoInit value) loading,
    required TResult Function(SuccessUserInfoInit value) success,
    required TResult Function(ErrorUserInfoInit value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialUserInfoInit value)? initial,
    TResult Function(LoadingUserInfoInit value)? loading,
    TResult Function(SuccessUserInfoInit value)? success,
    TResult Function(ErrorUserInfoInit value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialUserInfoInit value)? initial,
    TResult Function(LoadingUserInfoInit value)? loading,
    TResult Function(SuccessUserInfoInit value)? success,
    TResult Function(ErrorUserInfoInit value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorUserInfoInit implements UserInfoInitState {
  const factory ErrorUserInfoInit(final Failure failure) = _$ErrorUserInfoInit;

  Failure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ErrorUserInfoInitCopyWith<_$ErrorUserInfoInit> get copyWith =>
      throw _privateConstructorUsedError;
}
