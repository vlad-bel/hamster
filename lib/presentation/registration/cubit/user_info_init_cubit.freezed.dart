// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_info_init_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserInfoInitStateTearOff {
  const _$UserInfoInitStateTearOff();

  InitialUserInfoInit initial(
      {bool shouldShowPasswordValidationWidget = false}) {
    return InitialUserInfoInit(
      shouldShowPasswordValidationWidget: shouldShowPasswordValidationWidget,
    );
  }

  LoadingUserInfoInit loading() {
    return const LoadingUserInfoInit();
  }

  SuccessUserInfoInit success(String response) {
    return SuccessUserInfoInit(
      response,
    );
  }

  ErrorUserInfoInit error(Failure failure) {
    return ErrorUserInfoInit(
      failure,
    );
  }
}

/// @nodoc
const $UserInfoInitState = _$UserInfoInitStateTearOff();

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
abstract class $InitialUserInfoInitCopyWith<$Res> {
  factory $InitialUserInfoInitCopyWith(
          InitialUserInfoInit value, $Res Function(InitialUserInfoInit) then) =
      _$InitialUserInfoInitCopyWithImpl<$Res>;
  $Res call({bool shouldShowPasswordValidationWidget});
}

/// @nodoc
class _$InitialUserInfoInitCopyWithImpl<$Res>
    extends _$UserInfoInitStateCopyWithImpl<$Res>
    implements $InitialUserInfoInitCopyWith<$Res> {
  _$InitialUserInfoInitCopyWithImpl(
      InitialUserInfoInit _value, $Res Function(InitialUserInfoInit) _then)
      : super(_value, (v) => _then(v as InitialUserInfoInit));

  @override
  InitialUserInfoInit get _value => super._value as InitialUserInfoInit;

  @override
  $Res call({
    Object? shouldShowPasswordValidationWidget = freezed,
  }) {
    return _then(InitialUserInfoInit(
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

  @JsonKey(defaultValue: false)
  @override
  final bool shouldShowPasswordValidationWidget;

  @override
  String toString() {
    return 'UserInfoInitState.initial(shouldShowPasswordValidationWidget: $shouldShowPasswordValidationWidget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InitialUserInfoInit &&
            (identical(other.shouldShowPasswordValidationWidget,
                    shouldShowPasswordValidationWidget) ||
                const DeepCollectionEquality().equals(
                    other.shouldShowPasswordValidationWidget,
                    shouldShowPasswordValidationWidget)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(shouldShowPasswordValidationWidget);

  @JsonKey(ignore: true)
  @override
  $InitialUserInfoInitCopyWith<InitialUserInfoInit> get copyWith =>
      _$InitialUserInfoInitCopyWithImpl<InitialUserInfoInit>(this, _$identity);

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
  const factory InitialUserInfoInit({bool shouldShowPasswordValidationWidget}) =
      _$InitialUserInfoInit;

  bool get shouldShowPasswordValidationWidget =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InitialUserInfoInitCopyWith<InitialUserInfoInit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingUserInfoInitCopyWith<$Res> {
  factory $LoadingUserInfoInitCopyWith(
          LoadingUserInfoInit value, $Res Function(LoadingUserInfoInit) then) =
      _$LoadingUserInfoInitCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingUserInfoInitCopyWithImpl<$Res>
    extends _$UserInfoInitStateCopyWithImpl<$Res>
    implements $LoadingUserInfoInitCopyWith<$Res> {
  _$LoadingUserInfoInitCopyWithImpl(
      LoadingUserInfoInit _value, $Res Function(LoadingUserInfoInit) _then)
      : super(_value, (v) => _then(v as LoadingUserInfoInit));

  @override
  LoadingUserInfoInit get _value => super._value as LoadingUserInfoInit;
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
    return identical(this, other) || (other is LoadingUserInfoInit);
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
abstract class $SuccessUserInfoInitCopyWith<$Res> {
  factory $SuccessUserInfoInitCopyWith(
          SuccessUserInfoInit value, $Res Function(SuccessUserInfoInit) then) =
      _$SuccessUserInfoInitCopyWithImpl<$Res>;
  $Res call({String response});
}

/// @nodoc
class _$SuccessUserInfoInitCopyWithImpl<$Res>
    extends _$UserInfoInitStateCopyWithImpl<$Res>
    implements $SuccessUserInfoInitCopyWith<$Res> {
  _$SuccessUserInfoInitCopyWithImpl(
      SuccessUserInfoInit _value, $Res Function(SuccessUserInfoInit) _then)
      : super(_value, (v) => _then(v as SuccessUserInfoInit));

  @override
  SuccessUserInfoInit get _value => super._value as SuccessUserInfoInit;

  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(SuccessUserInfoInit(
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
        (other is SuccessUserInfoInit &&
            (identical(other.response, response) ||
                const DeepCollectionEquality()
                    .equals(other.response, response)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(response);

  @JsonKey(ignore: true)
  @override
  $SuccessUserInfoInitCopyWith<SuccessUserInfoInit> get copyWith =>
      _$SuccessUserInfoInitCopyWithImpl<SuccessUserInfoInit>(this, _$identity);

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
  const factory SuccessUserInfoInit(String response) = _$SuccessUserInfoInit;

  String get response => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuccessUserInfoInitCopyWith<SuccessUserInfoInit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorUserInfoInitCopyWith<$Res> {
  factory $ErrorUserInfoInitCopyWith(
          ErrorUserInfoInit value, $Res Function(ErrorUserInfoInit) then) =
      _$ErrorUserInfoInitCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class _$ErrorUserInfoInitCopyWithImpl<$Res>
    extends _$UserInfoInitStateCopyWithImpl<$Res>
    implements $ErrorUserInfoInitCopyWith<$Res> {
  _$ErrorUserInfoInitCopyWithImpl(
      ErrorUserInfoInit _value, $Res Function(ErrorUserInfoInit) _then)
      : super(_value, (v) => _then(v as ErrorUserInfoInit));

  @override
  ErrorUserInfoInit get _value => super._value as ErrorUserInfoInit;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(ErrorUserInfoInit(
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
        (other is ErrorUserInfoInit &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  $ErrorUserInfoInitCopyWith<ErrorUserInfoInit> get copyWith =>
      _$ErrorUserInfoInitCopyWithImpl<ErrorUserInfoInit>(this, _$identity);

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
  const factory ErrorUserInfoInit(Failure failure) = _$ErrorUserInfoInit;

  Failure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorUserInfoInitCopyWith<ErrorUserInfoInit> get copyWith =>
      throw _privateConstructorUsedError;
}
