// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_payment_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddPaymentStateTearOff {
  const _$AddPaymentStateTearOff();

  InitialAddPayment initial() {
    return const InitialAddPayment();
  }

  LoadingAddPayment loading() {
    return const LoadingAddPayment();
  }

  SuccessAddPayment success(LoginResponse response) {
    return SuccessAddPayment(
      response,
    );
  }

  WrongAccountOwnerAddPayment wrongAccountOwner() {
    return const WrongAccountOwnerAddPayment();
  }

  WrongIbanNumberAddPayment wrongIbanNumber() {
    return const WrongIbanNumberAddPayment();
  }

  ErrorAddPayment error(ApiFailure failure) {
    return ErrorAddPayment(
      failure,
    );
  }
}

/// @nodoc
const $AddPaymentState = _$AddPaymentStateTearOff();

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
abstract class $InitialAddPaymentCopyWith<$Res> {
  factory $InitialAddPaymentCopyWith(
          InitialAddPayment value, $Res Function(InitialAddPayment) then) =
      _$InitialAddPaymentCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialAddPaymentCopyWithImpl<$Res>
    extends _$AddPaymentStateCopyWithImpl<$Res>
    implements $InitialAddPaymentCopyWith<$Res> {
  _$InitialAddPaymentCopyWithImpl(
      InitialAddPayment _value, $Res Function(InitialAddPayment) _then)
      : super(_value, (v) => _then(v as InitialAddPayment));

  @override
  InitialAddPayment get _value => super._value as InitialAddPayment;
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
    return identical(this, other) || (other is InitialAddPayment);
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
abstract class $LoadingAddPaymentCopyWith<$Res> {
  factory $LoadingAddPaymentCopyWith(
          LoadingAddPayment value, $Res Function(LoadingAddPayment) then) =
      _$LoadingAddPaymentCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingAddPaymentCopyWithImpl<$Res>
    extends _$AddPaymentStateCopyWithImpl<$Res>
    implements $LoadingAddPaymentCopyWith<$Res> {
  _$LoadingAddPaymentCopyWithImpl(
      LoadingAddPayment _value, $Res Function(LoadingAddPayment) _then)
      : super(_value, (v) => _then(v as LoadingAddPayment));

  @override
  LoadingAddPayment get _value => super._value as LoadingAddPayment;
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
    return identical(this, other) || (other is LoadingAddPayment);
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
abstract class $SuccessAddPaymentCopyWith<$Res> {
  factory $SuccessAddPaymentCopyWith(
          SuccessAddPayment value, $Res Function(SuccessAddPayment) then) =
      _$SuccessAddPaymentCopyWithImpl<$Res>;
  $Res call({LoginResponse response});
}

/// @nodoc
class _$SuccessAddPaymentCopyWithImpl<$Res>
    extends _$AddPaymentStateCopyWithImpl<$Res>
    implements $SuccessAddPaymentCopyWith<$Res> {
  _$SuccessAddPaymentCopyWithImpl(
      SuccessAddPayment _value, $Res Function(SuccessAddPayment) _then)
      : super(_value, (v) => _then(v as SuccessAddPayment));

  @override
  SuccessAddPayment get _value => super._value as SuccessAddPayment;

  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(SuccessAddPayment(
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
        (other is SuccessAddPayment &&
            (identical(other.response, response) ||
                const DeepCollectionEquality()
                    .equals(other.response, response)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(response);

  @JsonKey(ignore: true)
  @override
  $SuccessAddPaymentCopyWith<SuccessAddPayment> get copyWith =>
      _$SuccessAddPaymentCopyWithImpl<SuccessAddPayment>(this, _$identity);

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
  const factory SuccessAddPayment(LoginResponse response) = _$SuccessAddPayment;

  LoginResponse get response => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuccessAddPaymentCopyWith<SuccessAddPayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WrongAccountOwnerAddPaymentCopyWith<$Res> {
  factory $WrongAccountOwnerAddPaymentCopyWith(
          WrongAccountOwnerAddPayment value,
          $Res Function(WrongAccountOwnerAddPayment) then) =
      _$WrongAccountOwnerAddPaymentCopyWithImpl<$Res>;
}

/// @nodoc
class _$WrongAccountOwnerAddPaymentCopyWithImpl<$Res>
    extends _$AddPaymentStateCopyWithImpl<$Res>
    implements $WrongAccountOwnerAddPaymentCopyWith<$Res> {
  _$WrongAccountOwnerAddPaymentCopyWithImpl(WrongAccountOwnerAddPayment _value,
      $Res Function(WrongAccountOwnerAddPayment) _then)
      : super(_value, (v) => _then(v as WrongAccountOwnerAddPayment));

  @override
  WrongAccountOwnerAddPayment get _value =>
      super._value as WrongAccountOwnerAddPayment;
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
    return identical(this, other) || (other is WrongAccountOwnerAddPayment);
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
abstract class $WrongIbanNumberAddPaymentCopyWith<$Res> {
  factory $WrongIbanNumberAddPaymentCopyWith(WrongIbanNumberAddPayment value,
          $Res Function(WrongIbanNumberAddPayment) then) =
      _$WrongIbanNumberAddPaymentCopyWithImpl<$Res>;
}

/// @nodoc
class _$WrongIbanNumberAddPaymentCopyWithImpl<$Res>
    extends _$AddPaymentStateCopyWithImpl<$Res>
    implements $WrongIbanNumberAddPaymentCopyWith<$Res> {
  _$WrongIbanNumberAddPaymentCopyWithImpl(WrongIbanNumberAddPayment _value,
      $Res Function(WrongIbanNumberAddPayment) _then)
      : super(_value, (v) => _then(v as WrongIbanNumberAddPayment));

  @override
  WrongIbanNumberAddPayment get _value =>
      super._value as WrongIbanNumberAddPayment;
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
    return identical(this, other) || (other is WrongIbanNumberAddPayment);
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
abstract class $ErrorAddPaymentCopyWith<$Res> {
  factory $ErrorAddPaymentCopyWith(
          ErrorAddPayment value, $Res Function(ErrorAddPayment) then) =
      _$ErrorAddPaymentCopyWithImpl<$Res>;
  $Res call({ApiFailure failure});
}

/// @nodoc
class _$ErrorAddPaymentCopyWithImpl<$Res>
    extends _$AddPaymentStateCopyWithImpl<$Res>
    implements $ErrorAddPaymentCopyWith<$Res> {
  _$ErrorAddPaymentCopyWithImpl(
      ErrorAddPayment _value, $Res Function(ErrorAddPayment) _then)
      : super(_value, (v) => _then(v as ErrorAddPayment));

  @override
  ErrorAddPayment get _value => super._value as ErrorAddPayment;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(ErrorAddPayment(
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
        (other is ErrorAddPayment &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  $ErrorAddPaymentCopyWith<ErrorAddPayment> get copyWith =>
      _$ErrorAddPaymentCopyWithImpl<ErrorAddPayment>(this, _$identity);

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
  const factory ErrorAddPayment(ApiFailure failure) = _$ErrorAddPayment;

  ApiFailure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorAddPaymentCopyWith<ErrorAddPayment> get copyWith =>
      throw _privateConstructorUsedError;
}
