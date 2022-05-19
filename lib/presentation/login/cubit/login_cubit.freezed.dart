// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginStateTearOff {
  const _$LoginStateTearOff();

  InitialLogin initial({required bool isWrongPasswordEmail}) {
    return InitialLogin(
      isWrongPasswordEmail: isWrongPasswordEmail,
    );
  }

  LoadingLogin loading() {
    return const LoadingLogin();
  }

  SuccessLogin success(String path) {
    return SuccessLogin(
      path,
    );
  }

  WrongEmailPasswordLogin wrongEmailPassword() {
    return const WrongEmailPasswordLogin();
  }

  ErrorLogin error(ApiFailure failure) {
    return ErrorLogin(
      failure,
    );
  }
}

/// @nodoc
const $LoginState = _$LoginStateTearOff();

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
abstract class $InitialLoginCopyWith<$Res> {
  factory $InitialLoginCopyWith(
          InitialLogin value, $Res Function(InitialLogin) then) =
      _$InitialLoginCopyWithImpl<$Res>;
  $Res call({bool isWrongPasswordEmail});
}

/// @nodoc
class _$InitialLoginCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements $InitialLoginCopyWith<$Res> {
  _$InitialLoginCopyWithImpl(
      InitialLogin _value, $Res Function(InitialLogin) _then)
      : super(_value, (v) => _then(v as InitialLogin));

  @override
  InitialLogin get _value => super._value as InitialLogin;

  @override
  $Res call({
    Object? isWrongPasswordEmail = freezed,
  }) {
    return _then(InitialLogin(
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
        (other is InitialLogin &&
            (identical(other.isWrongPasswordEmail, isWrongPasswordEmail) ||
                const DeepCollectionEquality()
                    .equals(other.isWrongPasswordEmail, isWrongPasswordEmail)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isWrongPasswordEmail);

  @JsonKey(ignore: true)
  @override
  $InitialLoginCopyWith<InitialLogin> get copyWith =>
      _$InitialLoginCopyWithImpl<InitialLogin>(this, _$identity);

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
  const factory InitialLogin({required bool isWrongPasswordEmail}) =
      _$InitialLogin;

  bool get isWrongPasswordEmail => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InitialLoginCopyWith<InitialLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingLoginCopyWith<$Res> {
  factory $LoadingLoginCopyWith(
          LoadingLogin value, $Res Function(LoadingLogin) then) =
      _$LoadingLoginCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingLoginCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements $LoadingLoginCopyWith<$Res> {
  _$LoadingLoginCopyWithImpl(
      LoadingLogin _value, $Res Function(LoadingLogin) _then)
      : super(_value, (v) => _then(v as LoadingLogin));

  @override
  LoadingLogin get _value => super._value as LoadingLogin;
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
    return identical(this, other) || (other is LoadingLogin);
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
abstract class $SuccessLoginCopyWith<$Res> {
  factory $SuccessLoginCopyWith(
          SuccessLogin value, $Res Function(SuccessLogin) then) =
      _$SuccessLoginCopyWithImpl<$Res>;
  $Res call({String path});
}

/// @nodoc
class _$SuccessLoginCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements $SuccessLoginCopyWith<$Res> {
  _$SuccessLoginCopyWithImpl(
      SuccessLogin _value, $Res Function(SuccessLogin) _then)
      : super(_value, (v) => _then(v as SuccessLogin));

  @override
  SuccessLogin get _value => super._value as SuccessLogin;

  @override
  $Res call({
    Object? path = freezed,
  }) {
    return _then(SuccessLogin(
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
        (other is SuccessLogin &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(path);

  @JsonKey(ignore: true)
  @override
  $SuccessLoginCopyWith<SuccessLogin> get copyWith =>
      _$SuccessLoginCopyWithImpl<SuccessLogin>(this, _$identity);

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
  const factory SuccessLogin(String path) = _$SuccessLogin;

  String get path => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuccessLoginCopyWith<SuccessLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WrongEmailPasswordLoginCopyWith<$Res> {
  factory $WrongEmailPasswordLoginCopyWith(WrongEmailPasswordLogin value,
          $Res Function(WrongEmailPasswordLogin) then) =
      _$WrongEmailPasswordLoginCopyWithImpl<$Res>;
}

/// @nodoc
class _$WrongEmailPasswordLoginCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res>
    implements $WrongEmailPasswordLoginCopyWith<$Res> {
  _$WrongEmailPasswordLoginCopyWithImpl(WrongEmailPasswordLogin _value,
      $Res Function(WrongEmailPasswordLogin) _then)
      : super(_value, (v) => _then(v as WrongEmailPasswordLogin));

  @override
  WrongEmailPasswordLogin get _value => super._value as WrongEmailPasswordLogin;
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
    return identical(this, other) || (other is WrongEmailPasswordLogin);
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
abstract class $ErrorLoginCopyWith<$Res> {
  factory $ErrorLoginCopyWith(
          ErrorLogin value, $Res Function(ErrorLogin) then) =
      _$ErrorLoginCopyWithImpl<$Res>;
  $Res call({ApiFailure failure});
}

/// @nodoc
class _$ErrorLoginCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements $ErrorLoginCopyWith<$Res> {
  _$ErrorLoginCopyWithImpl(ErrorLogin _value, $Res Function(ErrorLogin) _then)
      : super(_value, (v) => _then(v as ErrorLogin));

  @override
  ErrorLogin get _value => super._value as ErrorLogin;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(ErrorLogin(
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
        (other is ErrorLogin &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  $ErrorLoginCopyWith<ErrorLogin> get copyWith =>
      _$ErrorLoginCopyWithImpl<ErrorLogin>(this, _$identity);

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
  const factory ErrorLogin(ApiFailure failure) = _$ErrorLogin;

  ApiFailure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorLoginCopyWith<ErrorLogin> get copyWith =>
      throw _privateConstructorUsedError;
}
