// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'number_code_confirmation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NumberCodeConfirmationStateTearOff {
  const _$NumberCodeConfirmationStateTearOff();

  InitNumberCodeConfirmationState init({String? response}) {
    return InitNumberCodeConfirmationState(
      response: response,
    );
  }

  LoadingNumberCodeConfirmationState loading() {
    return const LoadingNumberCodeConfirmationState();
  }

  SucessNumberCodeConfirmationState success() {
    return const SucessNumberCodeConfirmationState();
  }

  CodeErrorCodeConfirmationState codeError({required ApiFailure e}) {
    return CodeErrorCodeConfirmationState(
      e: e,
    );
  }

  ResendErrorCodeConfirmationState resendError({required ApiFailure e}) {
    return ResendErrorCodeConfirmationState(
      e: e,
    );
  }
}

/// @nodoc
const $NumberCodeConfirmationState = _$NumberCodeConfirmationStateTearOff();

/// @nodoc
mixin _$NumberCodeConfirmationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? response) init,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(ApiFailure e) codeError,
    required TResult Function(ApiFailure e) resendError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? response)? init,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(ApiFailure e)? codeError,
    TResult Function(ApiFailure e)? resendError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? response)? init,
    TResult Function()? loading,
    TResult Function()? success,
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
    TResult Function(CodeErrorCodeConfirmationState value)? codeError,
    TResult Function(ResendErrorCodeConfirmationState value)? resendError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitNumberCodeConfirmationState value)? init,
    TResult Function(LoadingNumberCodeConfirmationState value)? loading,
    TResult Function(SucessNumberCodeConfirmationState value)? success,
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
abstract class $InitNumberCodeConfirmationStateCopyWith<$Res> {
  factory $InitNumberCodeConfirmationStateCopyWith(
          InitNumberCodeConfirmationState value,
          $Res Function(InitNumberCodeConfirmationState) then) =
      _$InitNumberCodeConfirmationStateCopyWithImpl<$Res>;
  $Res call({String? response});
}

/// @nodoc
class _$InitNumberCodeConfirmationStateCopyWithImpl<$Res>
    extends _$NumberCodeConfirmationStateCopyWithImpl<$Res>
    implements $InitNumberCodeConfirmationStateCopyWith<$Res> {
  _$InitNumberCodeConfirmationStateCopyWithImpl(
      InitNumberCodeConfirmationState _value,
      $Res Function(InitNumberCodeConfirmationState) _then)
      : super(_value, (v) => _then(v as InitNumberCodeConfirmationState));

  @override
  InitNumberCodeConfirmationState get _value =>
      super._value as InitNumberCodeConfirmationState;

  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(InitNumberCodeConfirmationState(
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
        (other is InitNumberCodeConfirmationState &&
            (identical(other.response, response) ||
                const DeepCollectionEquality()
                    .equals(other.response, response)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(response);

  @JsonKey(ignore: true)
  @override
  $InitNumberCodeConfirmationStateCopyWith<InitNumberCodeConfirmationState>
      get copyWith => _$InitNumberCodeConfirmationStateCopyWithImpl<
          InitNumberCodeConfirmationState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? response) init,
    required TResult Function() loading,
    required TResult Function() success,
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
  const factory InitNumberCodeConfirmationState({String? response}) =
      _$InitNumberCodeConfirmationState;

  String? get response => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InitNumberCodeConfirmationStateCopyWith<InitNumberCodeConfirmationState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingNumberCodeConfirmationStateCopyWith<$Res> {
  factory $LoadingNumberCodeConfirmationStateCopyWith(
          LoadingNumberCodeConfirmationState value,
          $Res Function(LoadingNumberCodeConfirmationState) then) =
      _$LoadingNumberCodeConfirmationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingNumberCodeConfirmationStateCopyWithImpl<$Res>
    extends _$NumberCodeConfirmationStateCopyWithImpl<$Res>
    implements $LoadingNumberCodeConfirmationStateCopyWith<$Res> {
  _$LoadingNumberCodeConfirmationStateCopyWithImpl(
      LoadingNumberCodeConfirmationState _value,
      $Res Function(LoadingNumberCodeConfirmationState) _then)
      : super(_value, (v) => _then(v as LoadingNumberCodeConfirmationState));

  @override
  LoadingNumberCodeConfirmationState get _value =>
      super._value as LoadingNumberCodeConfirmationState;
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
        (other is LoadingNumberCodeConfirmationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? response) init,
    required TResult Function() loading,
    required TResult Function() success,
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
abstract class $SucessNumberCodeConfirmationStateCopyWith<$Res> {
  factory $SucessNumberCodeConfirmationStateCopyWith(
          SucessNumberCodeConfirmationState value,
          $Res Function(SucessNumberCodeConfirmationState) then) =
      _$SucessNumberCodeConfirmationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SucessNumberCodeConfirmationStateCopyWithImpl<$Res>
    extends _$NumberCodeConfirmationStateCopyWithImpl<$Res>
    implements $SucessNumberCodeConfirmationStateCopyWith<$Res> {
  _$SucessNumberCodeConfirmationStateCopyWithImpl(
      SucessNumberCodeConfirmationState _value,
      $Res Function(SucessNumberCodeConfirmationState) _then)
      : super(_value, (v) => _then(v as SucessNumberCodeConfirmationState));

  @override
  SucessNumberCodeConfirmationState get _value =>
      super._value as SucessNumberCodeConfirmationState;
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
        (other is SucessNumberCodeConfirmationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? response) init,
    required TResult Function() loading,
    required TResult Function() success,
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
abstract class $CodeErrorCodeConfirmationStateCopyWith<$Res> {
  factory $CodeErrorCodeConfirmationStateCopyWith(
          CodeErrorCodeConfirmationState value,
          $Res Function(CodeErrorCodeConfirmationState) then) =
      _$CodeErrorCodeConfirmationStateCopyWithImpl<$Res>;
  $Res call({ApiFailure e});
}

/// @nodoc
class _$CodeErrorCodeConfirmationStateCopyWithImpl<$Res>
    extends _$NumberCodeConfirmationStateCopyWithImpl<$Res>
    implements $CodeErrorCodeConfirmationStateCopyWith<$Res> {
  _$CodeErrorCodeConfirmationStateCopyWithImpl(
      CodeErrorCodeConfirmationState _value,
      $Res Function(CodeErrorCodeConfirmationState) _then)
      : super(_value, (v) => _then(v as CodeErrorCodeConfirmationState));

  @override
  CodeErrorCodeConfirmationState get _value =>
      super._value as CodeErrorCodeConfirmationState;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(CodeErrorCodeConfirmationState(
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
        (other is CodeErrorCodeConfirmationState &&
            (identical(other.e, e) ||
                const DeepCollectionEquality().equals(other.e, e)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(e);

  @JsonKey(ignore: true)
  @override
  $CodeErrorCodeConfirmationStateCopyWith<CodeErrorCodeConfirmationState>
      get copyWith => _$CodeErrorCodeConfirmationStateCopyWithImpl<
          CodeErrorCodeConfirmationState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? response) init,
    required TResult Function() loading,
    required TResult Function() success,
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
  const factory CodeErrorCodeConfirmationState({required ApiFailure e}) =
      _$CodeErrorCodeConfirmationState;

  ApiFailure get e => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CodeErrorCodeConfirmationStateCopyWith<CodeErrorCodeConfirmationState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResendErrorCodeConfirmationStateCopyWith<$Res> {
  factory $ResendErrorCodeConfirmationStateCopyWith(
          ResendErrorCodeConfirmationState value,
          $Res Function(ResendErrorCodeConfirmationState) then) =
      _$ResendErrorCodeConfirmationStateCopyWithImpl<$Res>;
  $Res call({ApiFailure e});
}

/// @nodoc
class _$ResendErrorCodeConfirmationStateCopyWithImpl<$Res>
    extends _$NumberCodeConfirmationStateCopyWithImpl<$Res>
    implements $ResendErrorCodeConfirmationStateCopyWith<$Res> {
  _$ResendErrorCodeConfirmationStateCopyWithImpl(
      ResendErrorCodeConfirmationState _value,
      $Res Function(ResendErrorCodeConfirmationState) _then)
      : super(_value, (v) => _then(v as ResendErrorCodeConfirmationState));

  @override
  ResendErrorCodeConfirmationState get _value =>
      super._value as ResendErrorCodeConfirmationState;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(ResendErrorCodeConfirmationState(
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
        (other is ResendErrorCodeConfirmationState &&
            (identical(other.e, e) ||
                const DeepCollectionEquality().equals(other.e, e)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(e);

  @JsonKey(ignore: true)
  @override
  $ResendErrorCodeConfirmationStateCopyWith<ResendErrorCodeConfirmationState>
      get copyWith => _$ResendErrorCodeConfirmationStateCopyWithImpl<
          ResendErrorCodeConfirmationState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? response) init,
    required TResult Function() loading,
    required TResult Function() success,
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
  const factory ResendErrorCodeConfirmationState({required ApiFailure e}) =
      _$ResendErrorCodeConfirmationState;

  ApiFailure get e => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResendErrorCodeConfirmationStateCopyWith<ResendErrorCodeConfirmationState>
      get copyWith => throw _privateConstructorUsedError;
}
