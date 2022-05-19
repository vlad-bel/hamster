// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'email_verification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EmailVerificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() wrongOTPcode,
    required TResult Function() mailSent,
    required TResult Function(String response, String email) success,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? wrongOTPcode,
    TResult Function()? mailSent,
    TResult Function(String response, String email)? success,
    TResult Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? wrongOTPcode,
    TResult Function()? mailSent,
    TResult Function(String response, String email)? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEmailVerification value) initial,
    required TResult Function(LoadingEmailVerification value) loading,
    required TResult Function(WrongOTPEmailVerification value) wrongOTPcode,
    required TResult Function(MailSent_EmailVerification value) mailSent,
    required TResult Function(SuccessEmailVerification value) success,
    required TResult Function(ErrorEmailVerification value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEmailVerification value)? initial,
    TResult Function(LoadingEmailVerification value)? loading,
    TResult Function(WrongOTPEmailVerification value)? wrongOTPcode,
    TResult Function(MailSent_EmailVerification value)? mailSent,
    TResult Function(SuccessEmailVerification value)? success,
    TResult Function(ErrorEmailVerification value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEmailVerification value)? initial,
    TResult Function(LoadingEmailVerification value)? loading,
    TResult Function(WrongOTPEmailVerification value)? wrongOTPcode,
    TResult Function(MailSent_EmailVerification value)? mailSent,
    TResult Function(SuccessEmailVerification value)? success,
    TResult Function(ErrorEmailVerification value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailVerificationStateCopyWith<$Res> {
  factory $EmailVerificationStateCopyWith(EmailVerificationState value,
          $Res Function(EmailVerificationState) then) =
      _$EmailVerificationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmailVerificationStateCopyWithImpl<$Res>
    implements $EmailVerificationStateCopyWith<$Res> {
  _$EmailVerificationStateCopyWithImpl(this._value, this._then);

  final EmailVerificationState _value;
  // ignore: unused_field
  final $Res Function(EmailVerificationState) _then;
}

/// @nodoc
abstract class _$$InitialEmailVerificationCopyWith<$Res> {
  factory _$$InitialEmailVerificationCopyWith(_$InitialEmailVerification value,
          $Res Function(_$InitialEmailVerification) then) =
      __$$InitialEmailVerificationCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialEmailVerificationCopyWithImpl<$Res>
    extends _$EmailVerificationStateCopyWithImpl<$Res>
    implements _$$InitialEmailVerificationCopyWith<$Res> {
  __$$InitialEmailVerificationCopyWithImpl(_$InitialEmailVerification _value,
      $Res Function(_$InitialEmailVerification) _then)
      : super(_value, (v) => _then(v as _$InitialEmailVerification));

  @override
  _$InitialEmailVerification get _value =>
      super._value as _$InitialEmailVerification;
}

/// @nodoc

class _$InitialEmailVerification implements InitialEmailVerification {
  const _$InitialEmailVerification();

  @override
  String toString() {
    return 'EmailVerificationState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialEmailVerification);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() wrongOTPcode,
    required TResult Function() mailSent,
    required TResult Function(String response, String email) success,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? wrongOTPcode,
    TResult Function()? mailSent,
    TResult Function(String response, String email)? success,
    TResult Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? wrongOTPcode,
    TResult Function()? mailSent,
    TResult Function(String response, String email)? success,
    TResult Function(Failure failure)? error,
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
    required TResult Function(InitialEmailVerification value) initial,
    required TResult Function(LoadingEmailVerification value) loading,
    required TResult Function(WrongOTPEmailVerification value) wrongOTPcode,
    required TResult Function(MailSent_EmailVerification value) mailSent,
    required TResult Function(SuccessEmailVerification value) success,
    required TResult Function(ErrorEmailVerification value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEmailVerification value)? initial,
    TResult Function(LoadingEmailVerification value)? loading,
    TResult Function(WrongOTPEmailVerification value)? wrongOTPcode,
    TResult Function(MailSent_EmailVerification value)? mailSent,
    TResult Function(SuccessEmailVerification value)? success,
    TResult Function(ErrorEmailVerification value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEmailVerification value)? initial,
    TResult Function(LoadingEmailVerification value)? loading,
    TResult Function(WrongOTPEmailVerification value)? wrongOTPcode,
    TResult Function(MailSent_EmailVerification value)? mailSent,
    TResult Function(SuccessEmailVerification value)? success,
    TResult Function(ErrorEmailVerification value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialEmailVerification implements EmailVerificationState {
  const factory InitialEmailVerification() = _$InitialEmailVerification;
}

/// @nodoc
abstract class _$$LoadingEmailVerificationCopyWith<$Res> {
  factory _$$LoadingEmailVerificationCopyWith(_$LoadingEmailVerification value,
          $Res Function(_$LoadingEmailVerification) then) =
      __$$LoadingEmailVerificationCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingEmailVerificationCopyWithImpl<$Res>
    extends _$EmailVerificationStateCopyWithImpl<$Res>
    implements _$$LoadingEmailVerificationCopyWith<$Res> {
  __$$LoadingEmailVerificationCopyWithImpl(_$LoadingEmailVerification _value,
      $Res Function(_$LoadingEmailVerification) _then)
      : super(_value, (v) => _then(v as _$LoadingEmailVerification));

  @override
  _$LoadingEmailVerification get _value =>
      super._value as _$LoadingEmailVerification;
}

/// @nodoc

class _$LoadingEmailVerification implements LoadingEmailVerification {
  const _$LoadingEmailVerification();

  @override
  String toString() {
    return 'EmailVerificationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingEmailVerification);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() wrongOTPcode,
    required TResult Function() mailSent,
    required TResult Function(String response, String email) success,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? wrongOTPcode,
    TResult Function()? mailSent,
    TResult Function(String response, String email)? success,
    TResult Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? wrongOTPcode,
    TResult Function()? mailSent,
    TResult Function(String response, String email)? success,
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
    required TResult Function(InitialEmailVerification value) initial,
    required TResult Function(LoadingEmailVerification value) loading,
    required TResult Function(WrongOTPEmailVerification value) wrongOTPcode,
    required TResult Function(MailSent_EmailVerification value) mailSent,
    required TResult Function(SuccessEmailVerification value) success,
    required TResult Function(ErrorEmailVerification value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEmailVerification value)? initial,
    TResult Function(LoadingEmailVerification value)? loading,
    TResult Function(WrongOTPEmailVerification value)? wrongOTPcode,
    TResult Function(MailSent_EmailVerification value)? mailSent,
    TResult Function(SuccessEmailVerification value)? success,
    TResult Function(ErrorEmailVerification value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEmailVerification value)? initial,
    TResult Function(LoadingEmailVerification value)? loading,
    TResult Function(WrongOTPEmailVerification value)? wrongOTPcode,
    TResult Function(MailSent_EmailVerification value)? mailSent,
    TResult Function(SuccessEmailVerification value)? success,
    TResult Function(ErrorEmailVerification value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingEmailVerification implements EmailVerificationState {
  const factory LoadingEmailVerification() = _$LoadingEmailVerification;
}

/// @nodoc
abstract class _$$WrongOTPEmailVerificationCopyWith<$Res> {
  factory _$$WrongOTPEmailVerificationCopyWith(
          _$WrongOTPEmailVerification value,
          $Res Function(_$WrongOTPEmailVerification) then) =
      __$$WrongOTPEmailVerificationCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WrongOTPEmailVerificationCopyWithImpl<$Res>
    extends _$EmailVerificationStateCopyWithImpl<$Res>
    implements _$$WrongOTPEmailVerificationCopyWith<$Res> {
  __$$WrongOTPEmailVerificationCopyWithImpl(_$WrongOTPEmailVerification _value,
      $Res Function(_$WrongOTPEmailVerification) _then)
      : super(_value, (v) => _then(v as _$WrongOTPEmailVerification));

  @override
  _$WrongOTPEmailVerification get _value =>
      super._value as _$WrongOTPEmailVerification;
}

/// @nodoc

class _$WrongOTPEmailVerification implements WrongOTPEmailVerification {
  const _$WrongOTPEmailVerification();

  @override
  String toString() {
    return 'EmailVerificationState.wrongOTPcode()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WrongOTPEmailVerification);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() wrongOTPcode,
    required TResult Function() mailSent,
    required TResult Function(String response, String email) success,
    required TResult Function(Failure failure) error,
  }) {
    return wrongOTPcode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? wrongOTPcode,
    TResult Function()? mailSent,
    TResult Function(String response, String email)? success,
    TResult Function(Failure failure)? error,
  }) {
    return wrongOTPcode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? wrongOTPcode,
    TResult Function()? mailSent,
    TResult Function(String response, String email)? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (wrongOTPcode != null) {
      return wrongOTPcode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEmailVerification value) initial,
    required TResult Function(LoadingEmailVerification value) loading,
    required TResult Function(WrongOTPEmailVerification value) wrongOTPcode,
    required TResult Function(MailSent_EmailVerification value) mailSent,
    required TResult Function(SuccessEmailVerification value) success,
    required TResult Function(ErrorEmailVerification value) error,
  }) {
    return wrongOTPcode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEmailVerification value)? initial,
    TResult Function(LoadingEmailVerification value)? loading,
    TResult Function(WrongOTPEmailVerification value)? wrongOTPcode,
    TResult Function(MailSent_EmailVerification value)? mailSent,
    TResult Function(SuccessEmailVerification value)? success,
    TResult Function(ErrorEmailVerification value)? error,
  }) {
    return wrongOTPcode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEmailVerification value)? initial,
    TResult Function(LoadingEmailVerification value)? loading,
    TResult Function(WrongOTPEmailVerification value)? wrongOTPcode,
    TResult Function(MailSent_EmailVerification value)? mailSent,
    TResult Function(SuccessEmailVerification value)? success,
    TResult Function(ErrorEmailVerification value)? error,
    required TResult orElse(),
  }) {
    if (wrongOTPcode != null) {
      return wrongOTPcode(this);
    }
    return orElse();
  }
}

abstract class WrongOTPEmailVerification implements EmailVerificationState {
  const factory WrongOTPEmailVerification() = _$WrongOTPEmailVerification;
}

/// @nodoc
abstract class _$$MailSent_EmailVerificationCopyWith<$Res> {
  factory _$$MailSent_EmailVerificationCopyWith(
          _$MailSent_EmailVerification value,
          $Res Function(_$MailSent_EmailVerification) then) =
      __$$MailSent_EmailVerificationCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MailSent_EmailVerificationCopyWithImpl<$Res>
    extends _$EmailVerificationStateCopyWithImpl<$Res>
    implements _$$MailSent_EmailVerificationCopyWith<$Res> {
  __$$MailSent_EmailVerificationCopyWithImpl(
      _$MailSent_EmailVerification _value,
      $Res Function(_$MailSent_EmailVerification) _then)
      : super(_value, (v) => _then(v as _$MailSent_EmailVerification));

  @override
  _$MailSent_EmailVerification get _value =>
      super._value as _$MailSent_EmailVerification;
}

/// @nodoc

class _$MailSent_EmailVerification implements MailSent_EmailVerification {
  const _$MailSent_EmailVerification();

  @override
  String toString() {
    return 'EmailVerificationState.mailSent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MailSent_EmailVerification);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() wrongOTPcode,
    required TResult Function() mailSent,
    required TResult Function(String response, String email) success,
    required TResult Function(Failure failure) error,
  }) {
    return mailSent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? wrongOTPcode,
    TResult Function()? mailSent,
    TResult Function(String response, String email)? success,
    TResult Function(Failure failure)? error,
  }) {
    return mailSent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? wrongOTPcode,
    TResult Function()? mailSent,
    TResult Function(String response, String email)? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (mailSent != null) {
      return mailSent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEmailVerification value) initial,
    required TResult Function(LoadingEmailVerification value) loading,
    required TResult Function(WrongOTPEmailVerification value) wrongOTPcode,
    required TResult Function(MailSent_EmailVerification value) mailSent,
    required TResult Function(SuccessEmailVerification value) success,
    required TResult Function(ErrorEmailVerification value) error,
  }) {
    return mailSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEmailVerification value)? initial,
    TResult Function(LoadingEmailVerification value)? loading,
    TResult Function(WrongOTPEmailVerification value)? wrongOTPcode,
    TResult Function(MailSent_EmailVerification value)? mailSent,
    TResult Function(SuccessEmailVerification value)? success,
    TResult Function(ErrorEmailVerification value)? error,
  }) {
    return mailSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEmailVerification value)? initial,
    TResult Function(LoadingEmailVerification value)? loading,
    TResult Function(WrongOTPEmailVerification value)? wrongOTPcode,
    TResult Function(MailSent_EmailVerification value)? mailSent,
    TResult Function(SuccessEmailVerification value)? success,
    TResult Function(ErrorEmailVerification value)? error,
    required TResult orElse(),
  }) {
    if (mailSent != null) {
      return mailSent(this);
    }
    return orElse();
  }
}

abstract class MailSent_EmailVerification implements EmailVerificationState {
  const factory MailSent_EmailVerification() = _$MailSent_EmailVerification;
}

/// @nodoc
abstract class _$$SuccessEmailVerificationCopyWith<$Res> {
  factory _$$SuccessEmailVerificationCopyWith(_$SuccessEmailVerification value,
          $Res Function(_$SuccessEmailVerification) then) =
      __$$SuccessEmailVerificationCopyWithImpl<$Res>;
  $Res call({String response, String email});
}

/// @nodoc
class __$$SuccessEmailVerificationCopyWithImpl<$Res>
    extends _$EmailVerificationStateCopyWithImpl<$Res>
    implements _$$SuccessEmailVerificationCopyWith<$Res> {
  __$$SuccessEmailVerificationCopyWithImpl(_$SuccessEmailVerification _value,
      $Res Function(_$SuccessEmailVerification) _then)
      : super(_value, (v) => _then(v as _$SuccessEmailVerification));

  @override
  _$SuccessEmailVerification get _value =>
      super._value as _$SuccessEmailVerification;

  @override
  $Res call({
    Object? response = freezed,
    Object? email = freezed,
  }) {
    return _then(_$SuccessEmailVerification(
      response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuccessEmailVerification implements SuccessEmailVerification {
  const _$SuccessEmailVerification(this.response, this.email);

  @override
  final String response;
  @override
  final String email;

  @override
  String toString() {
    return 'EmailVerificationState.success(response: $response, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessEmailVerification &&
            const DeepCollectionEquality().equals(other.response, response) &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(response),
      const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$$SuccessEmailVerificationCopyWith<_$SuccessEmailVerification>
      get copyWith =>
          __$$SuccessEmailVerificationCopyWithImpl<_$SuccessEmailVerification>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() wrongOTPcode,
    required TResult Function() mailSent,
    required TResult Function(String response, String email) success,
    required TResult Function(Failure failure) error,
  }) {
    return success(response, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? wrongOTPcode,
    TResult Function()? mailSent,
    TResult Function(String response, String email)? success,
    TResult Function(Failure failure)? error,
  }) {
    return success?.call(response, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? wrongOTPcode,
    TResult Function()? mailSent,
    TResult Function(String response, String email)? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(response, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEmailVerification value) initial,
    required TResult Function(LoadingEmailVerification value) loading,
    required TResult Function(WrongOTPEmailVerification value) wrongOTPcode,
    required TResult Function(MailSent_EmailVerification value) mailSent,
    required TResult Function(SuccessEmailVerification value) success,
    required TResult Function(ErrorEmailVerification value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEmailVerification value)? initial,
    TResult Function(LoadingEmailVerification value)? loading,
    TResult Function(WrongOTPEmailVerification value)? wrongOTPcode,
    TResult Function(MailSent_EmailVerification value)? mailSent,
    TResult Function(SuccessEmailVerification value)? success,
    TResult Function(ErrorEmailVerification value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEmailVerification value)? initial,
    TResult Function(LoadingEmailVerification value)? loading,
    TResult Function(WrongOTPEmailVerification value)? wrongOTPcode,
    TResult Function(MailSent_EmailVerification value)? mailSent,
    TResult Function(SuccessEmailVerification value)? success,
    TResult Function(ErrorEmailVerification value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessEmailVerification implements EmailVerificationState {
  const factory SuccessEmailVerification(
      final String response, final String email) = _$SuccessEmailVerification;

  String get response => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SuccessEmailVerificationCopyWith<_$SuccessEmailVerification>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorEmailVerificationCopyWith<$Res> {
  factory _$$ErrorEmailVerificationCopyWith(_$ErrorEmailVerification value,
          $Res Function(_$ErrorEmailVerification) then) =
      __$$ErrorEmailVerificationCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class __$$ErrorEmailVerificationCopyWithImpl<$Res>
    extends _$EmailVerificationStateCopyWithImpl<$Res>
    implements _$$ErrorEmailVerificationCopyWith<$Res> {
  __$$ErrorEmailVerificationCopyWithImpl(_$ErrorEmailVerification _value,
      $Res Function(_$ErrorEmailVerification) _then)
      : super(_value, (v) => _then(v as _$ErrorEmailVerification));

  @override
  _$ErrorEmailVerification get _value =>
      super._value as _$ErrorEmailVerification;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$ErrorEmailVerification(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$ErrorEmailVerification implements ErrorEmailVerification {
  const _$ErrorEmailVerification(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'EmailVerificationState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorEmailVerification &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$ErrorEmailVerificationCopyWith<_$ErrorEmailVerification> get copyWith =>
      __$$ErrorEmailVerificationCopyWithImpl<_$ErrorEmailVerification>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() wrongOTPcode,
    required TResult Function() mailSent,
    required TResult Function(String response, String email) success,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? wrongOTPcode,
    TResult Function()? mailSent,
    TResult Function(String response, String email)? success,
    TResult Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? wrongOTPcode,
    TResult Function()? mailSent,
    TResult Function(String response, String email)? success,
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
    required TResult Function(InitialEmailVerification value) initial,
    required TResult Function(LoadingEmailVerification value) loading,
    required TResult Function(WrongOTPEmailVerification value) wrongOTPcode,
    required TResult Function(MailSent_EmailVerification value) mailSent,
    required TResult Function(SuccessEmailVerification value) success,
    required TResult Function(ErrorEmailVerification value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEmailVerification value)? initial,
    TResult Function(LoadingEmailVerification value)? loading,
    TResult Function(WrongOTPEmailVerification value)? wrongOTPcode,
    TResult Function(MailSent_EmailVerification value)? mailSent,
    TResult Function(SuccessEmailVerification value)? success,
    TResult Function(ErrorEmailVerification value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEmailVerification value)? initial,
    TResult Function(LoadingEmailVerification value)? loading,
    TResult Function(WrongOTPEmailVerification value)? wrongOTPcode,
    TResult Function(MailSent_EmailVerification value)? mailSent,
    TResult Function(SuccessEmailVerification value)? success,
    TResult Function(ErrorEmailVerification value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorEmailVerification implements EmailVerificationState {
  const factory ErrorEmailVerification(final Failure failure) =
      _$ErrorEmailVerification;

  Failure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ErrorEmailVerificationCopyWith<_$ErrorEmailVerification> get copyWith =>
      throw _privateConstructorUsedError;
}
