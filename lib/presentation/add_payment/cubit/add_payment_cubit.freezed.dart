// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_payment_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddPaymentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginResponse response) success,
    required TResult Function() wrongAccountOwner,
    required TResult Function() wrongIbanNumber,
    required TResult Function(ApiFailure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? success,
    TResult Function()? wrongAccountOwner,
    TResult Function()? wrongIbanNumber,
    TResult Function(ApiFailure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? success,
    TResult Function()? wrongAccountOwner,
    TResult Function()? wrongIbanNumber,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAddPayment value) initial,
    required TResult Function(LoadingAddPayment value) loading,
    required TResult Function(SuccessAddPayment value) success,
    required TResult Function(WrongAccountOwnerAddPayment value)
        wrongAccountOwner,
    required TResult Function(WrongIbanNumberAddPayment value) wrongIbanNumber,
    required TResult Function(ErrorAddPayment value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialAddPayment value)? initial,
    TResult Function(LoadingAddPayment value)? loading,
    TResult Function(SuccessAddPayment value)? success,
    TResult Function(WrongAccountOwnerAddPayment value)? wrongAccountOwner,
    TResult Function(WrongIbanNumberAddPayment value)? wrongIbanNumber,
    TResult Function(ErrorAddPayment value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAddPayment value)? initial,
    TResult Function(LoadingAddPayment value)? loading,
    TResult Function(SuccessAddPayment value)? success,
    TResult Function(WrongAccountOwnerAddPayment value)? wrongAccountOwner,
    TResult Function(WrongIbanNumberAddPayment value)? wrongIbanNumber,
    TResult Function(ErrorAddPayment value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPaymentStateCopyWith<$Res> {
  factory $AddPaymentStateCopyWith(
          AddPaymentState value, $Res Function(AddPaymentState) then) =
      _$AddPaymentStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AddPaymentStateCopyWithImpl<$Res>
    implements $AddPaymentStateCopyWith<$Res> {
  _$AddPaymentStateCopyWithImpl(this._value, this._then);

  final AddPaymentState _value;
  // ignore: unused_field
  final $Res Function(AddPaymentState) _then;
}

/// @nodoc
abstract class _$$InitialAddPaymentCopyWith<$Res> {
  factory _$$InitialAddPaymentCopyWith(
          _$InitialAddPayment value, $Res Function(_$InitialAddPayment) then) =
      __$$InitialAddPaymentCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialAddPaymentCopyWithImpl<$Res>
    extends _$AddPaymentStateCopyWithImpl<$Res>
    implements _$$InitialAddPaymentCopyWith<$Res> {
  __$$InitialAddPaymentCopyWithImpl(
      _$InitialAddPayment _value, $Res Function(_$InitialAddPayment) _then)
      : super(_value, (v) => _then(v as _$InitialAddPayment));

  @override
  _$InitialAddPayment get _value => super._value as _$InitialAddPayment;
}

/// @nodoc

class _$InitialAddPayment implements InitialAddPayment {
  const _$InitialAddPayment();

  @override
  String toString() {
    return 'AddPaymentState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialAddPayment);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginResponse response) success,
    required TResult Function() wrongAccountOwner,
    required TResult Function() wrongIbanNumber,
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
    TResult Function()? wrongAccountOwner,
    TResult Function()? wrongIbanNumber,
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
    TResult Function()? wrongAccountOwner,
    TResult Function()? wrongIbanNumber,
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
    required TResult Function(InitialAddPayment value) initial,
    required TResult Function(LoadingAddPayment value) loading,
    required TResult Function(SuccessAddPayment value) success,
    required TResult Function(WrongAccountOwnerAddPayment value)
        wrongAccountOwner,
    required TResult Function(WrongIbanNumberAddPayment value) wrongIbanNumber,
    required TResult Function(ErrorAddPayment value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialAddPayment value)? initial,
    TResult Function(LoadingAddPayment value)? loading,
    TResult Function(SuccessAddPayment value)? success,
    TResult Function(WrongAccountOwnerAddPayment value)? wrongAccountOwner,
    TResult Function(WrongIbanNumberAddPayment value)? wrongIbanNumber,
    TResult Function(ErrorAddPayment value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAddPayment value)? initial,
    TResult Function(LoadingAddPayment value)? loading,
    TResult Function(SuccessAddPayment value)? success,
    TResult Function(WrongAccountOwnerAddPayment value)? wrongAccountOwner,
    TResult Function(WrongIbanNumberAddPayment value)? wrongIbanNumber,
    TResult Function(ErrorAddPayment value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialAddPayment implements AddPaymentState {
  const factory InitialAddPayment() = _$InitialAddPayment;
}

/// @nodoc
abstract class _$$LoadingAddPaymentCopyWith<$Res> {
  factory _$$LoadingAddPaymentCopyWith(
          _$LoadingAddPayment value, $Res Function(_$LoadingAddPayment) then) =
      __$$LoadingAddPaymentCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingAddPaymentCopyWithImpl<$Res>
    extends _$AddPaymentStateCopyWithImpl<$Res>
    implements _$$LoadingAddPaymentCopyWith<$Res> {
  __$$LoadingAddPaymentCopyWithImpl(
      _$LoadingAddPayment _value, $Res Function(_$LoadingAddPayment) _then)
      : super(_value, (v) => _then(v as _$LoadingAddPayment));

  @override
  _$LoadingAddPayment get _value => super._value as _$LoadingAddPayment;
}

/// @nodoc

class _$LoadingAddPayment implements LoadingAddPayment {
  const _$LoadingAddPayment();

  @override
  String toString() {
    return 'AddPaymentState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingAddPayment);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginResponse response) success,
    required TResult Function() wrongAccountOwner,
    required TResult Function() wrongIbanNumber,
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
    TResult Function()? wrongAccountOwner,
    TResult Function()? wrongIbanNumber,
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
    TResult Function()? wrongAccountOwner,
    TResult Function()? wrongIbanNumber,
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
    required TResult Function(InitialAddPayment value) initial,
    required TResult Function(LoadingAddPayment value) loading,
    required TResult Function(SuccessAddPayment value) success,
    required TResult Function(WrongAccountOwnerAddPayment value)
        wrongAccountOwner,
    required TResult Function(WrongIbanNumberAddPayment value) wrongIbanNumber,
    required TResult Function(ErrorAddPayment value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialAddPayment value)? initial,
    TResult Function(LoadingAddPayment value)? loading,
    TResult Function(SuccessAddPayment value)? success,
    TResult Function(WrongAccountOwnerAddPayment value)? wrongAccountOwner,
    TResult Function(WrongIbanNumberAddPayment value)? wrongIbanNumber,
    TResult Function(ErrorAddPayment value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAddPayment value)? initial,
    TResult Function(LoadingAddPayment value)? loading,
    TResult Function(SuccessAddPayment value)? success,
    TResult Function(WrongAccountOwnerAddPayment value)? wrongAccountOwner,
    TResult Function(WrongIbanNumberAddPayment value)? wrongIbanNumber,
    TResult Function(ErrorAddPayment value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingAddPayment implements AddPaymentState {
  const factory LoadingAddPayment() = _$LoadingAddPayment;
}

/// @nodoc
abstract class _$$SuccessAddPaymentCopyWith<$Res> {
  factory _$$SuccessAddPaymentCopyWith(
          _$SuccessAddPayment value, $Res Function(_$SuccessAddPayment) then) =
      __$$SuccessAddPaymentCopyWithImpl<$Res>;
  $Res call({LoginResponse response});
}

/// @nodoc
class __$$SuccessAddPaymentCopyWithImpl<$Res>
    extends _$AddPaymentStateCopyWithImpl<$Res>
    implements _$$SuccessAddPaymentCopyWith<$Res> {
  __$$SuccessAddPaymentCopyWithImpl(
      _$SuccessAddPayment _value, $Res Function(_$SuccessAddPayment) _then)
      : super(_value, (v) => _then(v as _$SuccessAddPayment));

  @override
  _$SuccessAddPayment get _value => super._value as _$SuccessAddPayment;

  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$SuccessAddPayment(
      response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as LoginResponse,
    ));
  }
}

/// @nodoc

class _$SuccessAddPayment implements SuccessAddPayment {
  const _$SuccessAddPayment(this.response);

  @override
  final LoginResponse response;

  @override
  String toString() {
    return 'AddPaymentState.success(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessAddPayment &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  @JsonKey(ignore: true)
  @override
  _$$SuccessAddPaymentCopyWith<_$SuccessAddPayment> get copyWith =>
      __$$SuccessAddPaymentCopyWithImpl<_$SuccessAddPayment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginResponse response) success,
    required TResult Function() wrongAccountOwner,
    required TResult Function() wrongIbanNumber,
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
    TResult Function()? wrongAccountOwner,
    TResult Function()? wrongIbanNumber,
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
    TResult Function()? wrongAccountOwner,
    TResult Function()? wrongIbanNumber,
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
    required TResult Function(InitialAddPayment value) initial,
    required TResult Function(LoadingAddPayment value) loading,
    required TResult Function(SuccessAddPayment value) success,
    required TResult Function(WrongAccountOwnerAddPayment value)
        wrongAccountOwner,
    required TResult Function(WrongIbanNumberAddPayment value) wrongIbanNumber,
    required TResult Function(ErrorAddPayment value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialAddPayment value)? initial,
    TResult Function(LoadingAddPayment value)? loading,
    TResult Function(SuccessAddPayment value)? success,
    TResult Function(WrongAccountOwnerAddPayment value)? wrongAccountOwner,
    TResult Function(WrongIbanNumberAddPayment value)? wrongIbanNumber,
    TResult Function(ErrorAddPayment value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAddPayment value)? initial,
    TResult Function(LoadingAddPayment value)? loading,
    TResult Function(SuccessAddPayment value)? success,
    TResult Function(WrongAccountOwnerAddPayment value)? wrongAccountOwner,
    TResult Function(WrongIbanNumberAddPayment value)? wrongIbanNumber,
    TResult Function(ErrorAddPayment value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessAddPayment implements AddPaymentState {
  const factory SuccessAddPayment(final LoginResponse response) =
      _$SuccessAddPayment;

  LoginResponse get response => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SuccessAddPaymentCopyWith<_$SuccessAddPayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WrongAccountOwnerAddPaymentCopyWith<$Res> {
  factory _$$WrongAccountOwnerAddPaymentCopyWith(
          _$WrongAccountOwnerAddPayment value,
          $Res Function(_$WrongAccountOwnerAddPayment) then) =
      __$$WrongAccountOwnerAddPaymentCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WrongAccountOwnerAddPaymentCopyWithImpl<$Res>
    extends _$AddPaymentStateCopyWithImpl<$Res>
    implements _$$WrongAccountOwnerAddPaymentCopyWith<$Res> {
  __$$WrongAccountOwnerAddPaymentCopyWithImpl(
      _$WrongAccountOwnerAddPayment _value,
      $Res Function(_$WrongAccountOwnerAddPayment) _then)
      : super(_value, (v) => _then(v as _$WrongAccountOwnerAddPayment));

  @override
  _$WrongAccountOwnerAddPayment get _value =>
      super._value as _$WrongAccountOwnerAddPayment;
}

/// @nodoc

class _$WrongAccountOwnerAddPayment implements WrongAccountOwnerAddPayment {
  const _$WrongAccountOwnerAddPayment();

  @override
  String toString() {
    return 'AddPaymentState.wrongAccountOwner()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WrongAccountOwnerAddPayment);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginResponse response) success,
    required TResult Function() wrongAccountOwner,
    required TResult Function() wrongIbanNumber,
    required TResult Function(ApiFailure failure) error,
  }) {
    return wrongAccountOwner();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? success,
    TResult Function()? wrongAccountOwner,
    TResult Function()? wrongIbanNumber,
    TResult Function(ApiFailure failure)? error,
  }) {
    return wrongAccountOwner?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? success,
    TResult Function()? wrongAccountOwner,
    TResult Function()? wrongIbanNumber,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) {
    if (wrongAccountOwner != null) {
      return wrongAccountOwner();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAddPayment value) initial,
    required TResult Function(LoadingAddPayment value) loading,
    required TResult Function(SuccessAddPayment value) success,
    required TResult Function(WrongAccountOwnerAddPayment value)
        wrongAccountOwner,
    required TResult Function(WrongIbanNumberAddPayment value) wrongIbanNumber,
    required TResult Function(ErrorAddPayment value) error,
  }) {
    return wrongAccountOwner(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialAddPayment value)? initial,
    TResult Function(LoadingAddPayment value)? loading,
    TResult Function(SuccessAddPayment value)? success,
    TResult Function(WrongAccountOwnerAddPayment value)? wrongAccountOwner,
    TResult Function(WrongIbanNumberAddPayment value)? wrongIbanNumber,
    TResult Function(ErrorAddPayment value)? error,
  }) {
    return wrongAccountOwner?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAddPayment value)? initial,
    TResult Function(LoadingAddPayment value)? loading,
    TResult Function(SuccessAddPayment value)? success,
    TResult Function(WrongAccountOwnerAddPayment value)? wrongAccountOwner,
    TResult Function(WrongIbanNumberAddPayment value)? wrongIbanNumber,
    TResult Function(ErrorAddPayment value)? error,
    required TResult orElse(),
  }) {
    if (wrongAccountOwner != null) {
      return wrongAccountOwner(this);
    }
    return orElse();
  }
}

abstract class WrongAccountOwnerAddPayment implements AddPaymentState {
  const factory WrongAccountOwnerAddPayment() = _$WrongAccountOwnerAddPayment;
}

/// @nodoc
abstract class _$$WrongIbanNumberAddPaymentCopyWith<$Res> {
  factory _$$WrongIbanNumberAddPaymentCopyWith(
          _$WrongIbanNumberAddPayment value,
          $Res Function(_$WrongIbanNumberAddPayment) then) =
      __$$WrongIbanNumberAddPaymentCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WrongIbanNumberAddPaymentCopyWithImpl<$Res>
    extends _$AddPaymentStateCopyWithImpl<$Res>
    implements _$$WrongIbanNumberAddPaymentCopyWith<$Res> {
  __$$WrongIbanNumberAddPaymentCopyWithImpl(_$WrongIbanNumberAddPayment _value,
      $Res Function(_$WrongIbanNumberAddPayment) _then)
      : super(_value, (v) => _then(v as _$WrongIbanNumberAddPayment));

  @override
  _$WrongIbanNumberAddPayment get _value =>
      super._value as _$WrongIbanNumberAddPayment;
}

/// @nodoc

class _$WrongIbanNumberAddPayment implements WrongIbanNumberAddPayment {
  const _$WrongIbanNumberAddPayment();

  @override
  String toString() {
    return 'AddPaymentState.wrongIbanNumber()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WrongIbanNumberAddPayment);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginResponse response) success,
    required TResult Function() wrongAccountOwner,
    required TResult Function() wrongIbanNumber,
    required TResult Function(ApiFailure failure) error,
  }) {
    return wrongIbanNumber();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? success,
    TResult Function()? wrongAccountOwner,
    TResult Function()? wrongIbanNumber,
    TResult Function(ApiFailure failure)? error,
  }) {
    return wrongIbanNumber?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginResponse response)? success,
    TResult Function()? wrongAccountOwner,
    TResult Function()? wrongIbanNumber,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) {
    if (wrongIbanNumber != null) {
      return wrongIbanNumber();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAddPayment value) initial,
    required TResult Function(LoadingAddPayment value) loading,
    required TResult Function(SuccessAddPayment value) success,
    required TResult Function(WrongAccountOwnerAddPayment value)
        wrongAccountOwner,
    required TResult Function(WrongIbanNumberAddPayment value) wrongIbanNumber,
    required TResult Function(ErrorAddPayment value) error,
  }) {
    return wrongIbanNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialAddPayment value)? initial,
    TResult Function(LoadingAddPayment value)? loading,
    TResult Function(SuccessAddPayment value)? success,
    TResult Function(WrongAccountOwnerAddPayment value)? wrongAccountOwner,
    TResult Function(WrongIbanNumberAddPayment value)? wrongIbanNumber,
    TResult Function(ErrorAddPayment value)? error,
  }) {
    return wrongIbanNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAddPayment value)? initial,
    TResult Function(LoadingAddPayment value)? loading,
    TResult Function(SuccessAddPayment value)? success,
    TResult Function(WrongAccountOwnerAddPayment value)? wrongAccountOwner,
    TResult Function(WrongIbanNumberAddPayment value)? wrongIbanNumber,
    TResult Function(ErrorAddPayment value)? error,
    required TResult orElse(),
  }) {
    if (wrongIbanNumber != null) {
      return wrongIbanNumber(this);
    }
    return orElse();
  }
}

abstract class WrongIbanNumberAddPayment implements AddPaymentState {
  const factory WrongIbanNumberAddPayment() = _$WrongIbanNumberAddPayment;
}

/// @nodoc
abstract class _$$ErrorAddPaymentCopyWith<$Res> {
  factory _$$ErrorAddPaymentCopyWith(
          _$ErrorAddPayment value, $Res Function(_$ErrorAddPayment) then) =
      __$$ErrorAddPaymentCopyWithImpl<$Res>;
  $Res call({ApiFailure failure});
}

/// @nodoc
class __$$ErrorAddPaymentCopyWithImpl<$Res>
    extends _$AddPaymentStateCopyWithImpl<$Res>
    implements _$$ErrorAddPaymentCopyWith<$Res> {
  __$$ErrorAddPaymentCopyWithImpl(
      _$ErrorAddPayment _value, $Res Function(_$ErrorAddPayment) _then)
      : super(_value, (v) => _then(v as _$ErrorAddPayment));

  @override
  _$ErrorAddPayment get _value => super._value as _$ErrorAddPayment;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$ErrorAddPayment(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as ApiFailure,
    ));
  }
}

/// @nodoc

class _$ErrorAddPayment implements ErrorAddPayment {
  const _$ErrorAddPayment(this.failure);

  @override
  final ApiFailure failure;

  @override
  String toString() {
    return 'AddPaymentState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorAddPayment &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$ErrorAddPaymentCopyWith<_$ErrorAddPayment> get copyWith =>
      __$$ErrorAddPaymentCopyWithImpl<_$ErrorAddPayment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginResponse response) success,
    required TResult Function() wrongAccountOwner,
    required TResult Function() wrongIbanNumber,
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
    TResult Function()? wrongAccountOwner,
    TResult Function()? wrongIbanNumber,
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
    TResult Function()? wrongAccountOwner,
    TResult Function()? wrongIbanNumber,
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
    required TResult Function(InitialAddPayment value) initial,
    required TResult Function(LoadingAddPayment value) loading,
    required TResult Function(SuccessAddPayment value) success,
    required TResult Function(WrongAccountOwnerAddPayment value)
        wrongAccountOwner,
    required TResult Function(WrongIbanNumberAddPayment value) wrongIbanNumber,
    required TResult Function(ErrorAddPayment value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialAddPayment value)? initial,
    TResult Function(LoadingAddPayment value)? loading,
    TResult Function(SuccessAddPayment value)? success,
    TResult Function(WrongAccountOwnerAddPayment value)? wrongAccountOwner,
    TResult Function(WrongIbanNumberAddPayment value)? wrongIbanNumber,
    TResult Function(ErrorAddPayment value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAddPayment value)? initial,
    TResult Function(LoadingAddPayment value)? loading,
    TResult Function(SuccessAddPayment value)? success,
    TResult Function(WrongAccountOwnerAddPayment value)? wrongAccountOwner,
    TResult Function(WrongIbanNumberAddPayment value)? wrongIbanNumber,
    TResult Function(ErrorAddPayment value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorAddPayment implements AddPaymentState {
  const factory ErrorAddPayment(final ApiFailure failure) = _$ErrorAddPayment;

  ApiFailure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ErrorAddPaymentCopyWith<_$ErrorAddPayment> get copyWith =>
      throw _privateConstructorUsedError;
}
