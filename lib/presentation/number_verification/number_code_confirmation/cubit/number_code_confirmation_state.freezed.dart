// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'number_code_confirmation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NumberCodeConfirmationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? response) init,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() resend,
    required TResult Function(ApiFailure e) codeError,
    required TResult Function(ApiFailure e) resendError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? response)? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? resend,
    TResult Function(ApiFailure e)? codeError,
    TResult Function(ApiFailure e)? resendError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? response)? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? resend,
    TResult Function(ApiFailure e)? codeError,
    TResult Function(ApiFailure e)? resendError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitNumberCodeConfirmationState value) init,
    required TResult Function(LoadingNumberCodeConfirmationState value) loading,
    required TResult Function(SucessNumberCodeConfirmationState value) success,
    required TResult Function(ResendNumberCodeConfirmationState value) resend,
    required TResult Function(CodeErrorCodeConfirmationState value) codeError,
    required TResult Function(ResendErrorCodeConfirmationState value)
        resendError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitNumberCodeConfirmationState value)? init,
    TResult Function(LoadingNumberCodeConfirmationState value)? loading,
    TResult Function(SucessNumberCodeConfirmationState value)? success,
    TResult Function(ResendNumberCodeConfirmationState value)? resend,
    TResult Function(CodeErrorCodeConfirmationState value)? codeError,
    TResult Function(ResendErrorCodeConfirmationState value)? resendError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitNumberCodeConfirmationState value)? init,
    TResult Function(LoadingNumberCodeConfirmationState value)? loading,
    TResult Function(SucessNumberCodeConfirmationState value)? success,
    TResult Function(ResendNumberCodeConfirmationState value)? resend,
    TResult Function(CodeErrorCodeConfirmationState value)? codeError,
    TResult Function(ResendErrorCodeConfirmationState value)? resendError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberCodeConfirmationStateCopyWith<$Res> {
  factory $NumberCodeConfirmationStateCopyWith(
          NumberCodeConfirmationState value,
          $Res Function(NumberCodeConfirmationState) then) =
      _$NumberCodeConfirmationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NumberCodeConfirmationStateCopyWithImpl<$Res>
    implements $NumberCodeConfirmationStateCopyWith<$Res> {
  _$NumberCodeConfirmationStateCopyWithImpl(this._value, this._then);

  final NumberCodeConfirmationState _value;
  // ignore: unused_field
  final $Res Function(NumberCodeConfirmationState) _then;
}

/// @nodoc
abstract class _$$InitNumberCodeConfirmationStateCopyWith<$Res> {
  factory _$$InitNumberCodeConfirmationStateCopyWith(
          _$InitNumberCodeConfirmationState value,
          $Res Function(_$InitNumberCodeConfirmationState) then) =
      __$$InitNumberCodeConfirmationStateCopyWithImpl<$Res>;
  $Res call({String? response});
}

/// @nodoc
class __$$InitNumberCodeConfirmationStateCopyWithImpl<$Res>
    extends _$NumberCodeConfirmationStateCopyWithImpl<$Res>
    implements _$$InitNumberCodeConfirmationStateCopyWith<$Res> {
  __$$InitNumberCodeConfirmationStateCopyWithImpl(
      _$InitNumberCodeConfirmationState _value,
      $Res Function(_$InitNumberCodeConfirmationState) _then)
      : super(_value, (v) => _then(v as _$InitNumberCodeConfirmationState));

  @override
  _$InitNumberCodeConfirmationState get _value =>
      super._value as _$InitNumberCodeConfirmationState;

  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$InitNumberCodeConfirmationState(
      response: response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitNumberCodeConfirmationState
    implements InitNumberCodeConfirmationState {
  const _$InitNumberCodeConfirmationState({this.response});

  @override
  final String? response;

  @override
  String toString() {
    return 'NumberCodeConfirmationState.init(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitNumberCodeConfirmationState &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  @JsonKey(ignore: true)
  @override
  _$$InitNumberCodeConfirmationStateCopyWith<_$InitNumberCodeConfirmationState>
      get copyWith => __$$InitNumberCodeConfirmationStateCopyWithImpl<
          _$InitNumberCodeConfirmationState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? response) init,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() resend,
    required TResult Function(ApiFailure e) codeError,
    required TResult Function(ApiFailure e) resendError,
  }) {
    return init(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? response)? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? resend,
    TResult Function(ApiFailure e)? codeError,
    TResult Function(ApiFailure e)? resendError,
  }) {
    return init?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? response)? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? resend,
    TResult Function(ApiFailure e)? codeError,
    TResult Function(ApiFailure e)? resendError,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitNumberCodeConfirmationState value) init,
    required TResult Function(LoadingNumberCodeConfirmationState value) loading,
    required TResult Function(SucessNumberCodeConfirmationState value) success,
    required TResult Function(ResendNumberCodeConfirmationState value) resend,
    required TResult Function(CodeErrorCodeConfirmationState value) codeError,
    required TResult Function(ResendErrorCodeConfirmationState value)
        resendError,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitNumberCodeConfirmationState value)? init,
    TResult Function(LoadingNumberCodeConfirmationState value)? loading,
    TResult Function(SucessNumberCodeConfirmationState value)? success,
    TResult Function(ResendNumberCodeConfirmationState value)? resend,
    TResult Function(CodeErrorCodeConfirmationState value)? codeError,
    TResult Function(ResendErrorCodeConfirmationState value)? resendError,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitNumberCodeConfirmationState value)? init,
    TResult Function(LoadingNumberCodeConfirmationState value)? loading,
    TResult Function(SucessNumberCodeConfirmationState value)? success,
    TResult Function(ResendNumberCodeConfirmationState value)? resend,
    TResult Function(CodeErrorCodeConfirmationState value)? codeError,
    TResult Function(ResendErrorCodeConfirmationState value)? resendError,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class InitNumberCodeConfirmationState
    implements NumberCodeConfirmationState {
  const factory InitNumberCodeConfirmationState({final String? response}) =
      _$InitNumberCodeConfirmationState;

  String? get response => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$InitNumberCodeConfirmationStateCopyWith<_$InitNumberCodeConfirmationState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingNumberCodeConfirmationStateCopyWith<$Res> {
  factory _$$LoadingNumberCodeConfirmationStateCopyWith(
          _$LoadingNumberCodeConfirmationState value,
          $Res Function(_$LoadingNumberCodeConfirmationState) then) =
      __$$LoadingNumberCodeConfirmationStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingNumberCodeConfirmationStateCopyWithImpl<$Res>
    extends _$NumberCodeConfirmationStateCopyWithImpl<$Res>
    implements _$$LoadingNumberCodeConfirmationStateCopyWith<$Res> {
  __$$LoadingNumberCodeConfirmationStateCopyWithImpl(
      _$LoadingNumberCodeConfirmationState _value,
      $Res Function(_$LoadingNumberCodeConfirmationState) _then)
      : super(_value, (v) => _then(v as _$LoadingNumberCodeConfirmationState));

  @override
  _$LoadingNumberCodeConfirmationState get _value =>
      super._value as _$LoadingNumberCodeConfirmationState;
}

/// @nodoc

class _$LoadingNumberCodeConfirmationState
    implements LoadingNumberCodeConfirmationState {
  const _$LoadingNumberCodeConfirmationState();

  @override
  String toString() {
    return 'NumberCodeConfirmationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingNumberCodeConfirmationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? response) init,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() resend,
    required TResult Function(ApiFailure e) codeError,
    required TResult Function(ApiFailure e) resendError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? response)? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? resend,
    TResult Function(ApiFailure e)? codeError,
    TResult Function(ApiFailure e)? resendError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? response)? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? resend,
    TResult Function(ApiFailure e)? codeError,
    TResult Function(ApiFailure e)? resendError,
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
    required TResult Function(InitNumberCodeConfirmationState value) init,
    required TResult Function(LoadingNumberCodeConfirmationState value) loading,
    required TResult Function(SucessNumberCodeConfirmationState value) success,
    required TResult Function(ResendNumberCodeConfirmationState value) resend,
    required TResult Function(CodeErrorCodeConfirmationState value) codeError,
    required TResult Function(ResendErrorCodeConfirmationState value)
        resendError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitNumberCodeConfirmationState value)? init,
    TResult Function(LoadingNumberCodeConfirmationState value)? loading,
    TResult Function(SucessNumberCodeConfirmationState value)? success,
    TResult Function(ResendNumberCodeConfirmationState value)? resend,
    TResult Function(CodeErrorCodeConfirmationState value)? codeError,
    TResult Function(ResendErrorCodeConfirmationState value)? resendError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitNumberCodeConfirmationState value)? init,
    TResult Function(LoadingNumberCodeConfirmationState value)? loading,
    TResult Function(SucessNumberCodeConfirmationState value)? success,
    TResult Function(ResendNumberCodeConfirmationState value)? resend,
    TResult Function(CodeErrorCodeConfirmationState value)? codeError,
    TResult Function(ResendErrorCodeConfirmationState value)? resendError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingNumberCodeConfirmationState
    implements NumberCodeConfirmationState {
  const factory LoadingNumberCodeConfirmationState() =
      _$LoadingNumberCodeConfirmationState;
}

/// @nodoc
abstract class _$$SucessNumberCodeConfirmationStateCopyWith<$Res> {
  factory _$$SucessNumberCodeConfirmationStateCopyWith(
          _$SucessNumberCodeConfirmationState value,
          $Res Function(_$SucessNumberCodeConfirmationState) then) =
      __$$SucessNumberCodeConfirmationStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SucessNumberCodeConfirmationStateCopyWithImpl<$Res>
    extends _$NumberCodeConfirmationStateCopyWithImpl<$Res>
    implements _$$SucessNumberCodeConfirmationStateCopyWith<$Res> {
  __$$SucessNumberCodeConfirmationStateCopyWithImpl(
      _$SucessNumberCodeConfirmationState _value,
      $Res Function(_$SucessNumberCodeConfirmationState) _then)
      : super(_value, (v) => _then(v as _$SucessNumberCodeConfirmationState));

  @override
  _$SucessNumberCodeConfirmationState get _value =>
      super._value as _$SucessNumberCodeConfirmationState;
}

/// @nodoc

class _$SucessNumberCodeConfirmationState
    implements SucessNumberCodeConfirmationState {
  const _$SucessNumberCodeConfirmationState();

  @override
  String toString() {
    return 'NumberCodeConfirmationState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SucessNumberCodeConfirmationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? response) init,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() resend,
    required TResult Function(ApiFailure e) codeError,
    required TResult Function(ApiFailure e) resendError,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? response)? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? resend,
    TResult Function(ApiFailure e)? codeError,
    TResult Function(ApiFailure e)? resendError,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? response)? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? resend,
    TResult Function(ApiFailure e)? codeError,
    TResult Function(ApiFailure e)? resendError,
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
    required TResult Function(InitNumberCodeConfirmationState value) init,
    required TResult Function(LoadingNumberCodeConfirmationState value) loading,
    required TResult Function(SucessNumberCodeConfirmationState value) success,
    required TResult Function(ResendNumberCodeConfirmationState value) resend,
    required TResult Function(CodeErrorCodeConfirmationState value) codeError,
    required TResult Function(ResendErrorCodeConfirmationState value)
        resendError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitNumberCodeConfirmationState value)? init,
    TResult Function(LoadingNumberCodeConfirmationState value)? loading,
    TResult Function(SucessNumberCodeConfirmationState value)? success,
    TResult Function(ResendNumberCodeConfirmationState value)? resend,
    TResult Function(CodeErrorCodeConfirmationState value)? codeError,
    TResult Function(ResendErrorCodeConfirmationState value)? resendError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitNumberCodeConfirmationState value)? init,
    TResult Function(LoadingNumberCodeConfirmationState value)? loading,
    TResult Function(SucessNumberCodeConfirmationState value)? success,
    TResult Function(ResendNumberCodeConfirmationState value)? resend,
    TResult Function(CodeErrorCodeConfirmationState value)? codeError,
    TResult Function(ResendErrorCodeConfirmationState value)? resendError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SucessNumberCodeConfirmationState
    implements NumberCodeConfirmationState {
  const factory SucessNumberCodeConfirmationState() =
      _$SucessNumberCodeConfirmationState;
}

/// @nodoc
abstract class _$$ResendNumberCodeConfirmationStateCopyWith<$Res> {
  factory _$$ResendNumberCodeConfirmationStateCopyWith(
          _$ResendNumberCodeConfirmationState value,
          $Res Function(_$ResendNumberCodeConfirmationState) then) =
      __$$ResendNumberCodeConfirmationStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResendNumberCodeConfirmationStateCopyWithImpl<$Res>
    extends _$NumberCodeConfirmationStateCopyWithImpl<$Res>
    implements _$$ResendNumberCodeConfirmationStateCopyWith<$Res> {
  __$$ResendNumberCodeConfirmationStateCopyWithImpl(
      _$ResendNumberCodeConfirmationState _value,
      $Res Function(_$ResendNumberCodeConfirmationState) _then)
      : super(_value, (v) => _then(v as _$ResendNumberCodeConfirmationState));

  @override
  _$ResendNumberCodeConfirmationState get _value =>
      super._value as _$ResendNumberCodeConfirmationState;
}

/// @nodoc

class _$ResendNumberCodeConfirmationState
    implements ResendNumberCodeConfirmationState {
  const _$ResendNumberCodeConfirmationState();

  @override
  String toString() {
    return 'NumberCodeConfirmationState.resend()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendNumberCodeConfirmationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? response) init,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() resend,
    required TResult Function(ApiFailure e) codeError,
    required TResult Function(ApiFailure e) resendError,
  }) {
    return resend();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? response)? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? resend,
    TResult Function(ApiFailure e)? codeError,
    TResult Function(ApiFailure e)? resendError,
  }) {
    return resend?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? response)? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? resend,
    TResult Function(ApiFailure e)? codeError,
    TResult Function(ApiFailure e)? resendError,
    required TResult orElse(),
  }) {
    if (resend != null) {
      return resend();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitNumberCodeConfirmationState value) init,
    required TResult Function(LoadingNumberCodeConfirmationState value) loading,
    required TResult Function(SucessNumberCodeConfirmationState value) success,
    required TResult Function(ResendNumberCodeConfirmationState value) resend,
    required TResult Function(CodeErrorCodeConfirmationState value) codeError,
    required TResult Function(ResendErrorCodeConfirmationState value)
        resendError,
  }) {
    return resend(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitNumberCodeConfirmationState value)? init,
    TResult Function(LoadingNumberCodeConfirmationState value)? loading,
    TResult Function(SucessNumberCodeConfirmationState value)? success,
    TResult Function(ResendNumberCodeConfirmationState value)? resend,
    TResult Function(CodeErrorCodeConfirmationState value)? codeError,
    TResult Function(ResendErrorCodeConfirmationState value)? resendError,
  }) {
    return resend?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitNumberCodeConfirmationState value)? init,
    TResult Function(LoadingNumberCodeConfirmationState value)? loading,
    TResult Function(SucessNumberCodeConfirmationState value)? success,
    TResult Function(ResendNumberCodeConfirmationState value)? resend,
    TResult Function(CodeErrorCodeConfirmationState value)? codeError,
    TResult Function(ResendErrorCodeConfirmationState value)? resendError,
    required TResult orElse(),
  }) {
    if (resend != null) {
      return resend(this);
    }
    return orElse();
  }
}

abstract class ResendNumberCodeConfirmationState
    implements NumberCodeConfirmationState {
  const factory ResendNumberCodeConfirmationState() =
      _$ResendNumberCodeConfirmationState;
}

/// @nodoc
abstract class _$$CodeErrorCodeConfirmationStateCopyWith<$Res> {
  factory _$$CodeErrorCodeConfirmationStateCopyWith(
          _$CodeErrorCodeConfirmationState value,
          $Res Function(_$CodeErrorCodeConfirmationState) then) =
      __$$CodeErrorCodeConfirmationStateCopyWithImpl<$Res>;
  $Res call({ApiFailure e});
}

/// @nodoc
class __$$CodeErrorCodeConfirmationStateCopyWithImpl<$Res>
    extends _$NumberCodeConfirmationStateCopyWithImpl<$Res>
    implements _$$CodeErrorCodeConfirmationStateCopyWith<$Res> {
  __$$CodeErrorCodeConfirmationStateCopyWithImpl(
      _$CodeErrorCodeConfirmationState _value,
      $Res Function(_$CodeErrorCodeConfirmationState) _then)
      : super(_value, (v) => _then(v as _$CodeErrorCodeConfirmationState));

  @override
  _$CodeErrorCodeConfirmationState get _value =>
      super._value as _$CodeErrorCodeConfirmationState;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_$CodeErrorCodeConfirmationState(
      e: e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as ApiFailure,
    ));
  }
}

/// @nodoc

class _$CodeErrorCodeConfirmationState
    implements CodeErrorCodeConfirmationState {
  const _$CodeErrorCodeConfirmationState({required this.e});

  @override
  final ApiFailure e;

  @override
  String toString() {
    return 'NumberCodeConfirmationState.codeError(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CodeErrorCodeConfirmationState &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  _$$CodeErrorCodeConfirmationStateCopyWith<_$CodeErrorCodeConfirmationState>
      get copyWith => __$$CodeErrorCodeConfirmationStateCopyWithImpl<
          _$CodeErrorCodeConfirmationState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? response) init,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() resend,
    required TResult Function(ApiFailure e) codeError,
    required TResult Function(ApiFailure e) resendError,
  }) {
    return codeError(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? response)? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? resend,
    TResult Function(ApiFailure e)? codeError,
    TResult Function(ApiFailure e)? resendError,
  }) {
    return codeError?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? response)? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? resend,
    TResult Function(ApiFailure e)? codeError,
    TResult Function(ApiFailure e)? resendError,
    required TResult orElse(),
  }) {
    if (codeError != null) {
      return codeError(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitNumberCodeConfirmationState value) init,
    required TResult Function(LoadingNumberCodeConfirmationState value) loading,
    required TResult Function(SucessNumberCodeConfirmationState value) success,
    required TResult Function(ResendNumberCodeConfirmationState value) resend,
    required TResult Function(CodeErrorCodeConfirmationState value) codeError,
    required TResult Function(ResendErrorCodeConfirmationState value)
        resendError,
  }) {
    return codeError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitNumberCodeConfirmationState value)? init,
    TResult Function(LoadingNumberCodeConfirmationState value)? loading,
    TResult Function(SucessNumberCodeConfirmationState value)? success,
    TResult Function(ResendNumberCodeConfirmationState value)? resend,
    TResult Function(CodeErrorCodeConfirmationState value)? codeError,
    TResult Function(ResendErrorCodeConfirmationState value)? resendError,
  }) {
    return codeError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitNumberCodeConfirmationState value)? init,
    TResult Function(LoadingNumberCodeConfirmationState value)? loading,
    TResult Function(SucessNumberCodeConfirmationState value)? success,
    TResult Function(ResendNumberCodeConfirmationState value)? resend,
    TResult Function(CodeErrorCodeConfirmationState value)? codeError,
    TResult Function(ResendErrorCodeConfirmationState value)? resendError,
    required TResult orElse(),
  }) {
    if (codeError != null) {
      return codeError(this);
    }
    return orElse();
  }
}

abstract class CodeErrorCodeConfirmationState
    implements NumberCodeConfirmationState {
  const factory CodeErrorCodeConfirmationState({required final ApiFailure e}) =
      _$CodeErrorCodeConfirmationState;

  ApiFailure get e => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$CodeErrorCodeConfirmationStateCopyWith<_$CodeErrorCodeConfirmationState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResendErrorCodeConfirmationStateCopyWith<$Res> {
  factory _$$ResendErrorCodeConfirmationStateCopyWith(
          _$ResendErrorCodeConfirmationState value,
          $Res Function(_$ResendErrorCodeConfirmationState) then) =
      __$$ResendErrorCodeConfirmationStateCopyWithImpl<$Res>;
  $Res call({ApiFailure e});
}

/// @nodoc
class __$$ResendErrorCodeConfirmationStateCopyWithImpl<$Res>
    extends _$NumberCodeConfirmationStateCopyWithImpl<$Res>
    implements _$$ResendErrorCodeConfirmationStateCopyWith<$Res> {
  __$$ResendErrorCodeConfirmationStateCopyWithImpl(
      _$ResendErrorCodeConfirmationState _value,
      $Res Function(_$ResendErrorCodeConfirmationState) _then)
      : super(_value, (v) => _then(v as _$ResendErrorCodeConfirmationState));

  @override
  _$ResendErrorCodeConfirmationState get _value =>
      super._value as _$ResendErrorCodeConfirmationState;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_$ResendErrorCodeConfirmationState(
      e: e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as ApiFailure,
    ));
  }
}

/// @nodoc

class _$ResendErrorCodeConfirmationState
    implements ResendErrorCodeConfirmationState {
  const _$ResendErrorCodeConfirmationState({required this.e});

  @override
  final ApiFailure e;

  @override
  String toString() {
    return 'NumberCodeConfirmationState.resendError(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendErrorCodeConfirmationState &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  _$$ResendErrorCodeConfirmationStateCopyWith<
          _$ResendErrorCodeConfirmationState>
      get copyWith => __$$ResendErrorCodeConfirmationStateCopyWithImpl<
          _$ResendErrorCodeConfirmationState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? response) init,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() resend,
    required TResult Function(ApiFailure e) codeError,
    required TResult Function(ApiFailure e) resendError,
  }) {
    return resendError(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? response)? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? resend,
    TResult Function(ApiFailure e)? codeError,
    TResult Function(ApiFailure e)? resendError,
  }) {
    return resendError?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? response)? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? resend,
    TResult Function(ApiFailure e)? codeError,
    TResult Function(ApiFailure e)? resendError,
    required TResult orElse(),
  }) {
    if (resendError != null) {
      return resendError(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitNumberCodeConfirmationState value) init,
    required TResult Function(LoadingNumberCodeConfirmationState value) loading,
    required TResult Function(SucessNumberCodeConfirmationState value) success,
    required TResult Function(ResendNumberCodeConfirmationState value) resend,
    required TResult Function(CodeErrorCodeConfirmationState value) codeError,
    required TResult Function(ResendErrorCodeConfirmationState value)
        resendError,
  }) {
    return resendError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitNumberCodeConfirmationState value)? init,
    TResult Function(LoadingNumberCodeConfirmationState value)? loading,
    TResult Function(SucessNumberCodeConfirmationState value)? success,
    TResult Function(ResendNumberCodeConfirmationState value)? resend,
    TResult Function(CodeErrorCodeConfirmationState value)? codeError,
    TResult Function(ResendErrorCodeConfirmationState value)? resendError,
  }) {
    return resendError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitNumberCodeConfirmationState value)? init,
    TResult Function(LoadingNumberCodeConfirmationState value)? loading,
    TResult Function(SucessNumberCodeConfirmationState value)? success,
    TResult Function(ResendNumberCodeConfirmationState value)? resend,
    TResult Function(CodeErrorCodeConfirmationState value)? codeError,
    TResult Function(ResendErrorCodeConfirmationState value)? resendError,
    required TResult orElse(),
  }) {
    if (resendError != null) {
      return resendError(this);
    }
    return orElse();
  }
}

abstract class ResendErrorCodeConfirmationState
    implements NumberCodeConfirmationState {
  const factory ResendErrorCodeConfirmationState(
      {required final ApiFailure e}) = _$ResendErrorCodeConfirmationState;

  ApiFailure get e => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ResendErrorCodeConfirmationStateCopyWith<
          _$ResendErrorCodeConfirmationState>
      get copyWith => throw _privateConstructorUsedError;
}
