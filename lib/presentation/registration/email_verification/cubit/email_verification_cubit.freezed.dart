// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'email_verification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EmailVerificationStateTearOff {
  const _$EmailVerificationStateTearOff();

  InitialEmailVerification initial() {
    return const InitialEmailVerification();
  }

  LoadingEmailVerification loading() {
    return const LoadingEmailVerification();
  }

  WrongOTPEmailVerification wrongOTPcode() {
    return const WrongOTPEmailVerification();
  }

  MailSent_EmailVerification mailSent() {
    return const MailSent_EmailVerification();
  }

  SuccessEmailVerification success(String response, String email) {
    return SuccessEmailVerification(
      response,
      email,
    );
  }

  ErrorEmailVerification error(Failure failure) {
    return ErrorEmailVerification(
      failure,
    );
  }
}

/// @nodoc
const $EmailVerificationState = _$EmailVerificationStateTearOff();

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
abstract class $InitialEmailVerificationCopyWith<$Res> {
  factory $InitialEmailVerificationCopyWith(InitialEmailVerification value,
          $Res Function(InitialEmailVerification) then) =
      _$InitialEmailVerificationCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialEmailVerificationCopyWithImpl<$Res>
    extends _$EmailVerificationStateCopyWithImpl<$Res>
    implements $InitialEmailVerificationCopyWith<$Res> {
  _$InitialEmailVerificationCopyWithImpl(InitialEmailVerification _value,
      $Res Function(InitialEmailVerification) _then)
      : super(_value, (v) => _then(v as InitialEmailVerification));

  @override
  InitialEmailVerification get _value =>
      super._value as InitialEmailVerification;
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
    return identical(this, other) || (other is InitialEmailVerification);
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
abstract class $LoadingEmailVerificationCopyWith<$Res> {
  factory $LoadingEmailVerificationCopyWith(LoadingEmailVerification value,
          $Res Function(LoadingEmailVerification) then) =
      _$LoadingEmailVerificationCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingEmailVerificationCopyWithImpl<$Res>
    extends _$EmailVerificationStateCopyWithImpl<$Res>
    implements $LoadingEmailVerificationCopyWith<$Res> {
  _$LoadingEmailVerificationCopyWithImpl(LoadingEmailVerification _value,
      $Res Function(LoadingEmailVerification) _then)
      : super(_value, (v) => _then(v as LoadingEmailVerification));

  @override
  LoadingEmailVerification get _value =>
      super._value as LoadingEmailVerification;
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
    return identical(this, other) || (other is LoadingEmailVerification);
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
abstract class $WrongOTPEmailVerificationCopyWith<$Res> {
  factory $WrongOTPEmailVerificationCopyWith(WrongOTPEmailVerification value,
          $Res Function(WrongOTPEmailVerification) then) =
      _$WrongOTPEmailVerificationCopyWithImpl<$Res>;
}

/// @nodoc
class _$WrongOTPEmailVerificationCopyWithImpl<$Res>
    extends _$EmailVerificationStateCopyWithImpl<$Res>
    implements $WrongOTPEmailVerificationCopyWith<$Res> {
  _$WrongOTPEmailVerificationCopyWithImpl(WrongOTPEmailVerification _value,
      $Res Function(WrongOTPEmailVerification) _then)
      : super(_value, (v) => _then(v as WrongOTPEmailVerification));

  @override
  WrongOTPEmailVerification get _value =>
      super._value as WrongOTPEmailVerification;
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
    return identical(this, other) || (other is WrongOTPEmailVerification);
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
abstract class $MailSent_EmailVerificationCopyWith<$Res> {
  factory $MailSent_EmailVerificationCopyWith(MailSent_EmailVerification value,
          $Res Function(MailSent_EmailVerification) then) =
      _$MailSent_EmailVerificationCopyWithImpl<$Res>;
}

/// @nodoc
class _$MailSent_EmailVerificationCopyWithImpl<$Res>
    extends _$EmailVerificationStateCopyWithImpl<$Res>
    implements $MailSent_EmailVerificationCopyWith<$Res> {
  _$MailSent_EmailVerificationCopyWithImpl(MailSent_EmailVerification _value,
      $Res Function(MailSent_EmailVerification) _then)
      : super(_value, (v) => _then(v as MailSent_EmailVerification));

  @override
  MailSent_EmailVerification get _value =>
      super._value as MailSent_EmailVerification;
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
    return identical(this, other) || (other is MailSent_EmailVerification);
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
abstract class $SuccessEmailVerificationCopyWith<$Res> {
  factory $SuccessEmailVerificationCopyWith(SuccessEmailVerification value,
          $Res Function(SuccessEmailVerification) then) =
      _$SuccessEmailVerificationCopyWithImpl<$Res>;
  $Res call({String response, String email});
}

/// @nodoc
class _$SuccessEmailVerificationCopyWithImpl<$Res>
    extends _$EmailVerificationStateCopyWithImpl<$Res>
    implements $SuccessEmailVerificationCopyWith<$Res> {
  _$SuccessEmailVerificationCopyWithImpl(SuccessEmailVerification _value,
      $Res Function(SuccessEmailVerification) _then)
      : super(_value, (v) => _then(v as SuccessEmailVerification));

  @override
  SuccessEmailVerification get _value =>
      super._value as SuccessEmailVerification;

  @override
  $Res call({
    Object? response = freezed,
    Object? email = freezed,
  }) {
    return _then(SuccessEmailVerification(
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
        (other is SuccessEmailVerification &&
            (identical(other.response, response) ||
                const DeepCollectionEquality()
                    .equals(other.response, response)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(response) ^
      const DeepCollectionEquality().hash(email);

  @JsonKey(ignore: true)
  @override
  $SuccessEmailVerificationCopyWith<SuccessEmailVerification> get copyWith =>
      _$SuccessEmailVerificationCopyWithImpl<SuccessEmailVerification>(
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
  const factory SuccessEmailVerification(String response, String email) =
      _$SuccessEmailVerification;

  String get response => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuccessEmailVerificationCopyWith<SuccessEmailVerification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorEmailVerificationCopyWith<$Res> {
  factory $ErrorEmailVerificationCopyWith(ErrorEmailVerification value,
          $Res Function(ErrorEmailVerification) then) =
      _$ErrorEmailVerificationCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class _$ErrorEmailVerificationCopyWithImpl<$Res>
    extends _$EmailVerificationStateCopyWithImpl<$Res>
    implements $ErrorEmailVerificationCopyWith<$Res> {
  _$ErrorEmailVerificationCopyWithImpl(ErrorEmailVerification _value,
      $Res Function(ErrorEmailVerification) _then)
      : super(_value, (v) => _then(v as ErrorEmailVerification));

  @override
  ErrorEmailVerification get _value => super._value as ErrorEmailVerification;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(ErrorEmailVerification(
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
        (other is ErrorEmailVerification &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  $ErrorEmailVerificationCopyWith<ErrorEmailVerification> get copyWith =>
      _$ErrorEmailVerificationCopyWithImpl<ErrorEmailVerification>(
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
  const factory ErrorEmailVerification(Failure failure) =
      _$ErrorEmailVerification;

  Failure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorEmailVerificationCopyWith<ErrorEmailVerification> get copyWith =>
      throw _privateConstructorUsedError;
}
