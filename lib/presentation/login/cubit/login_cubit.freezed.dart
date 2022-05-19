// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isWrongPasswordEmail) initial,
    required TResult Function() loading,
    required TResult Function(String path) success,
    required TResult Function() wrongEmailPassword,
    required TResult Function(ApiFailure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isWrongPasswordEmail)? initial,
    TResult Function()? loading,
    TResult Function(String path)? success,
    TResult Function()? wrongEmailPassword,
    TResult Function(ApiFailure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isWrongPasswordEmail)? initial,
    TResult Function()? loading,
    TResult Function(String path)? success,
    TResult Function()? wrongEmailPassword,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialLogin value) initial,
    required TResult Function(LoadingLogin value) loading,
    required TResult Function(SuccessLogin value) success,
    required TResult Function(WrongEmailPasswordLogin value) wrongEmailPassword,
    required TResult Function(ErrorLogin value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialLogin value)? initial,
    TResult Function(LoadingLogin value)? loading,
    TResult Function(SuccessLogin value)? success,
    TResult Function(WrongEmailPasswordLogin value)? wrongEmailPassword,
    TResult Function(ErrorLogin value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialLogin value)? initial,
    TResult Function(LoadingLogin value)? loading,
    TResult Function(SuccessLogin value)? success,
    TResult Function(WrongEmailPasswordLogin value)? wrongEmailPassword,
    TResult Function(ErrorLogin value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;
}

/// @nodoc
abstract class _$$InitialLoginCopyWith<$Res> {
  factory _$$InitialLoginCopyWith(
          _$InitialLogin value, $Res Function(_$InitialLogin) then) =
      __$$InitialLoginCopyWithImpl<$Res>;
  $Res call({bool isWrongPasswordEmail});
}

/// @nodoc
class __$$InitialLoginCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$InitialLoginCopyWith<$Res> {
  __$$InitialLoginCopyWithImpl(
      _$InitialLogin _value, $Res Function(_$InitialLogin) _then)
      : super(_value, (v) => _then(v as _$InitialLogin));

  @override
  _$InitialLogin get _value => super._value as _$InitialLogin;

  @override
  $Res call({
    Object? isWrongPasswordEmail = freezed,
  }) {
    return _then(_$InitialLogin(
      isWrongPasswordEmail: isWrongPasswordEmail == freezed
          ? _value.isWrongPasswordEmail
          : isWrongPasswordEmail // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialLogin implements InitialLogin {
  const _$InitialLogin({required this.isWrongPasswordEmail});

  @override
  final bool isWrongPasswordEmail;

  @override
  String toString() {
    return 'LoginState.initial(isWrongPasswordEmail: $isWrongPasswordEmail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialLogin &&
            const DeepCollectionEquality()
                .equals(other.isWrongPasswordEmail, isWrongPasswordEmail));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(isWrongPasswordEmail));

  @JsonKey(ignore: true)
  @override
  _$$InitialLoginCopyWith<_$InitialLogin> get copyWith =>
      __$$InitialLoginCopyWithImpl<_$InitialLogin>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isWrongPasswordEmail) initial,
    required TResult Function() loading,
    required TResult Function(String path) success,
    required TResult Function() wrongEmailPassword,
    required TResult Function(ApiFailure failure) error,
  }) {
    return initial(isWrongPasswordEmail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isWrongPasswordEmail)? initial,
    TResult Function()? loading,
    TResult Function(String path)? success,
    TResult Function()? wrongEmailPassword,
    TResult Function(ApiFailure failure)? error,
  }) {
    return initial?.call(isWrongPasswordEmail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isWrongPasswordEmail)? initial,
    TResult Function()? loading,
    TResult Function(String path)? success,
    TResult Function()? wrongEmailPassword,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isWrongPasswordEmail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialLogin value) initial,
    required TResult Function(LoadingLogin value) loading,
    required TResult Function(SuccessLogin value) success,
    required TResult Function(WrongEmailPasswordLogin value) wrongEmailPassword,
    required TResult Function(ErrorLogin value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialLogin value)? initial,
    TResult Function(LoadingLogin value)? loading,
    TResult Function(SuccessLogin value)? success,
    TResult Function(WrongEmailPasswordLogin value)? wrongEmailPassword,
    TResult Function(ErrorLogin value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialLogin value)? initial,
    TResult Function(LoadingLogin value)? loading,
    TResult Function(SuccessLogin value)? success,
    TResult Function(WrongEmailPasswordLogin value)? wrongEmailPassword,
    TResult Function(ErrorLogin value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialLogin implements LoginState {
  const factory InitialLogin({required final bool isWrongPasswordEmail}) =
      _$InitialLogin;

  bool get isWrongPasswordEmail => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$InitialLoginCopyWith<_$InitialLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingLoginCopyWith<$Res> {
  factory _$$LoadingLoginCopyWith(
          _$LoadingLogin value, $Res Function(_$LoadingLogin) then) =
      __$$LoadingLoginCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingLoginCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$LoadingLoginCopyWith<$Res> {
  __$$LoadingLoginCopyWithImpl(
      _$LoadingLogin _value, $Res Function(_$LoadingLogin) _then)
      : super(_value, (v) => _then(v as _$LoadingLogin));

  @override
  _$LoadingLogin get _value => super._value as _$LoadingLogin;
}

/// @nodoc

class _$LoadingLogin implements LoadingLogin {
  const _$LoadingLogin();

  @override
  String toString() {
    return 'LoginState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingLogin);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isWrongPasswordEmail) initial,
    required TResult Function() loading,
    required TResult Function(String path) success,
    required TResult Function() wrongEmailPassword,
    required TResult Function(ApiFailure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isWrongPasswordEmail)? initial,
    TResult Function()? loading,
    TResult Function(String path)? success,
    TResult Function()? wrongEmailPassword,
    TResult Function(ApiFailure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isWrongPasswordEmail)? initial,
    TResult Function()? loading,
    TResult Function(String path)? success,
    TResult Function()? wrongEmailPassword,
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
    required TResult Function(InitialLogin value) initial,
    required TResult Function(LoadingLogin value) loading,
    required TResult Function(SuccessLogin value) success,
    required TResult Function(WrongEmailPasswordLogin value) wrongEmailPassword,
    required TResult Function(ErrorLogin value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialLogin value)? initial,
    TResult Function(LoadingLogin value)? loading,
    TResult Function(SuccessLogin value)? success,
    TResult Function(WrongEmailPasswordLogin value)? wrongEmailPassword,
    TResult Function(ErrorLogin value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialLogin value)? initial,
    TResult Function(LoadingLogin value)? loading,
    TResult Function(SuccessLogin value)? success,
    TResult Function(WrongEmailPasswordLogin value)? wrongEmailPassword,
    TResult Function(ErrorLogin value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingLogin implements LoginState {
  const factory LoadingLogin() = _$LoadingLogin;
}

/// @nodoc
abstract class _$$SuccessLoginCopyWith<$Res> {
  factory _$$SuccessLoginCopyWith(
          _$SuccessLogin value, $Res Function(_$SuccessLogin) then) =
      __$$SuccessLoginCopyWithImpl<$Res>;
  $Res call({String path});
}

/// @nodoc
class __$$SuccessLoginCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$SuccessLoginCopyWith<$Res> {
  __$$SuccessLoginCopyWithImpl(
      _$SuccessLogin _value, $Res Function(_$SuccessLogin) _then)
      : super(_value, (v) => _then(v as _$SuccessLogin));

  @override
  _$SuccessLogin get _value => super._value as _$SuccessLogin;

  @override
  $Res call({
    Object? path = freezed,
  }) {
    return _then(_$SuccessLogin(
      path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuccessLogin implements SuccessLogin {
  const _$SuccessLogin(this.path);

  @override
  final String path;

  @override
  String toString() {
    return 'LoginState.success(path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessLogin &&
            const DeepCollectionEquality().equals(other.path, path));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(path));

  @JsonKey(ignore: true)
  @override
  _$$SuccessLoginCopyWith<_$SuccessLogin> get copyWith =>
      __$$SuccessLoginCopyWithImpl<_$SuccessLogin>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isWrongPasswordEmail) initial,
    required TResult Function() loading,
    required TResult Function(String path) success,
    required TResult Function() wrongEmailPassword,
    required TResult Function(ApiFailure failure) error,
  }) {
    return success(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isWrongPasswordEmail)? initial,
    TResult Function()? loading,
    TResult Function(String path)? success,
    TResult Function()? wrongEmailPassword,
    TResult Function(ApiFailure failure)? error,
  }) {
    return success?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isWrongPasswordEmail)? initial,
    TResult Function()? loading,
    TResult Function(String path)? success,
    TResult Function()? wrongEmailPassword,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialLogin value) initial,
    required TResult Function(LoadingLogin value) loading,
    required TResult Function(SuccessLogin value) success,
    required TResult Function(WrongEmailPasswordLogin value) wrongEmailPassword,
    required TResult Function(ErrorLogin value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialLogin value)? initial,
    TResult Function(LoadingLogin value)? loading,
    TResult Function(SuccessLogin value)? success,
    TResult Function(WrongEmailPasswordLogin value)? wrongEmailPassword,
    TResult Function(ErrorLogin value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialLogin value)? initial,
    TResult Function(LoadingLogin value)? loading,
    TResult Function(SuccessLogin value)? success,
    TResult Function(WrongEmailPasswordLogin value)? wrongEmailPassword,
    TResult Function(ErrorLogin value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessLogin implements LoginState {
  const factory SuccessLogin(final String path) = _$SuccessLogin;

  String get path => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SuccessLoginCopyWith<_$SuccessLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WrongEmailPasswordLoginCopyWith<$Res> {
  factory _$$WrongEmailPasswordLoginCopyWith(_$WrongEmailPasswordLogin value,
          $Res Function(_$WrongEmailPasswordLogin) then) =
      __$$WrongEmailPasswordLoginCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WrongEmailPasswordLoginCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res>
    implements _$$WrongEmailPasswordLoginCopyWith<$Res> {
  __$$WrongEmailPasswordLoginCopyWithImpl(_$WrongEmailPasswordLogin _value,
      $Res Function(_$WrongEmailPasswordLogin) _then)
      : super(_value, (v) => _then(v as _$WrongEmailPasswordLogin));

  @override
  _$WrongEmailPasswordLogin get _value =>
      super._value as _$WrongEmailPasswordLogin;
}

/// @nodoc

class _$WrongEmailPasswordLogin implements WrongEmailPasswordLogin {
  const _$WrongEmailPasswordLogin();

  @override
  String toString() {
    return 'LoginState.wrongEmailPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WrongEmailPasswordLogin);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isWrongPasswordEmail) initial,
    required TResult Function() loading,
    required TResult Function(String path) success,
    required TResult Function() wrongEmailPassword,
    required TResult Function(ApiFailure failure) error,
  }) {
    return wrongEmailPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isWrongPasswordEmail)? initial,
    TResult Function()? loading,
    TResult Function(String path)? success,
    TResult Function()? wrongEmailPassword,
    TResult Function(ApiFailure failure)? error,
  }) {
    return wrongEmailPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isWrongPasswordEmail)? initial,
    TResult Function()? loading,
    TResult Function(String path)? success,
    TResult Function()? wrongEmailPassword,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) {
    if (wrongEmailPassword != null) {
      return wrongEmailPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialLogin value) initial,
    required TResult Function(LoadingLogin value) loading,
    required TResult Function(SuccessLogin value) success,
    required TResult Function(WrongEmailPasswordLogin value) wrongEmailPassword,
    required TResult Function(ErrorLogin value) error,
  }) {
    return wrongEmailPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialLogin value)? initial,
    TResult Function(LoadingLogin value)? loading,
    TResult Function(SuccessLogin value)? success,
    TResult Function(WrongEmailPasswordLogin value)? wrongEmailPassword,
    TResult Function(ErrorLogin value)? error,
  }) {
    return wrongEmailPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialLogin value)? initial,
    TResult Function(LoadingLogin value)? loading,
    TResult Function(SuccessLogin value)? success,
    TResult Function(WrongEmailPasswordLogin value)? wrongEmailPassword,
    TResult Function(ErrorLogin value)? error,
    required TResult orElse(),
  }) {
    if (wrongEmailPassword != null) {
      return wrongEmailPassword(this);
    }
    return orElse();
  }
}

abstract class WrongEmailPasswordLogin implements LoginState {
  const factory WrongEmailPasswordLogin() = _$WrongEmailPasswordLogin;
}

/// @nodoc
abstract class _$$ErrorLoginCopyWith<$Res> {
  factory _$$ErrorLoginCopyWith(
          _$ErrorLogin value, $Res Function(_$ErrorLogin) then) =
      __$$ErrorLoginCopyWithImpl<$Res>;
  $Res call({ApiFailure failure});
}

/// @nodoc
class __$$ErrorLoginCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$ErrorLoginCopyWith<$Res> {
  __$$ErrorLoginCopyWithImpl(
      _$ErrorLogin _value, $Res Function(_$ErrorLogin) _then)
      : super(_value, (v) => _then(v as _$ErrorLogin));

  @override
  _$ErrorLogin get _value => super._value as _$ErrorLogin;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$ErrorLogin(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as ApiFailure,
    ));
  }
}

/// @nodoc

class _$ErrorLogin implements ErrorLogin {
  const _$ErrorLogin(this.failure);

  @override
  final ApiFailure failure;

  @override
  String toString() {
    return 'LoginState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorLogin &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$ErrorLoginCopyWith<_$ErrorLogin> get copyWith =>
      __$$ErrorLoginCopyWithImpl<_$ErrorLogin>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isWrongPasswordEmail) initial,
    required TResult Function() loading,
    required TResult Function(String path) success,
    required TResult Function() wrongEmailPassword,
    required TResult Function(ApiFailure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isWrongPasswordEmail)? initial,
    TResult Function()? loading,
    TResult Function(String path)? success,
    TResult Function()? wrongEmailPassword,
    TResult Function(ApiFailure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isWrongPasswordEmail)? initial,
    TResult Function()? loading,
    TResult Function(String path)? success,
    TResult Function()? wrongEmailPassword,
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
    required TResult Function(InitialLogin value) initial,
    required TResult Function(LoadingLogin value) loading,
    required TResult Function(SuccessLogin value) success,
    required TResult Function(WrongEmailPasswordLogin value) wrongEmailPassword,
    required TResult Function(ErrorLogin value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialLogin value)? initial,
    TResult Function(LoadingLogin value)? loading,
    TResult Function(SuccessLogin value)? success,
    TResult Function(WrongEmailPasswordLogin value)? wrongEmailPassword,
    TResult Function(ErrorLogin value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialLogin value)? initial,
    TResult Function(LoadingLogin value)? loading,
    TResult Function(SuccessLogin value)? success,
    TResult Function(WrongEmailPasswordLogin value)? wrongEmailPassword,
    TResult Function(ErrorLogin value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorLogin implements LoginState {
  const factory ErrorLogin(final ApiFailure failure) = _$ErrorLogin;

  ApiFailure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ErrorLoginCopyWith<_$ErrorLogin> get copyWith =>
      throw _privateConstructorUsedError;
}
