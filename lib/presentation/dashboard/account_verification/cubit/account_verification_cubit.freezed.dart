// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_verification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VerifyAccountState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool? isAcceptedDataIsCorrect,
            bool? isFullyCompleted,
            int? progressUserAccount,
            int? progressCompanyProfile,
            int? progressBranchProfile)
        initial,
    required TResult Function(ApiFailure error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            bool? isAcceptedDataIsCorrect,
            bool? isFullyCompleted,
            int? progressUserAccount,
            int? progressCompanyProfile,
            int? progressBranchProfile)?
        initial,
    TResult Function(ApiFailure error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool? isAcceptedDataIsCorrect,
            bool? isFullyCompleted,
            int? progressUserAccount,
            int? progressCompanyProfile,
            int? progressBranchProfile)?
        initial,
    TResult Function(ApiFailure error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAccountVerificationState value) initial,
    required TResult Function(ErrorAccountVerificationState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialAccountVerificationState value)? initial,
    TResult Function(ErrorAccountVerificationState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAccountVerificationState value)? initial,
    TResult Function(ErrorAccountVerificationState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyAccountStateCopyWith<$Res> {
  factory $VerifyAccountStateCopyWith(
          VerifyAccountState value, $Res Function(VerifyAccountState) then) =
      _$VerifyAccountStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$VerifyAccountStateCopyWithImpl<$Res>
    implements $VerifyAccountStateCopyWith<$Res> {
  _$VerifyAccountStateCopyWithImpl(this._value, this._then);

  final VerifyAccountState _value;
  // ignore: unused_field
  final $Res Function(VerifyAccountState) _then;
}

/// @nodoc
abstract class _$$InitialAccountVerificationStateCopyWith<$Res> {
  factory _$$InitialAccountVerificationStateCopyWith(
          _$InitialAccountVerificationState value,
          $Res Function(_$InitialAccountVerificationState) then) =
      __$$InitialAccountVerificationStateCopyWithImpl<$Res>;
  $Res call(
      {bool? isAcceptedDataIsCorrect,
      bool? isFullyCompleted,
      int? progressUserAccount,
      int? progressCompanyProfile,
      int? progressBranchProfile});
}

/// @nodoc
class __$$InitialAccountVerificationStateCopyWithImpl<$Res>
    extends _$VerifyAccountStateCopyWithImpl<$Res>
    implements _$$InitialAccountVerificationStateCopyWith<$Res> {
  __$$InitialAccountVerificationStateCopyWithImpl(
      _$InitialAccountVerificationState _value,
      $Res Function(_$InitialAccountVerificationState) _then)
      : super(_value, (v) => _then(v as _$InitialAccountVerificationState));

  @override
  _$InitialAccountVerificationState get _value =>
      super._value as _$InitialAccountVerificationState;

  @override
  $Res call({
    Object? isAcceptedDataIsCorrect = freezed,
    Object? isFullyCompleted = freezed,
    Object? progressUserAccount = freezed,
    Object? progressCompanyProfile = freezed,
    Object? progressBranchProfile = freezed,
  }) {
    return _then(_$InitialAccountVerificationState(
      isAcceptedDataIsCorrect: isAcceptedDataIsCorrect == freezed
          ? _value.isAcceptedDataIsCorrect
          : isAcceptedDataIsCorrect // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFullyCompleted: isFullyCompleted == freezed
          ? _value.isFullyCompleted
          : isFullyCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      progressUserAccount: progressUserAccount == freezed
          ? _value.progressUserAccount
          : progressUserAccount // ignore: cast_nullable_to_non_nullable
              as int?,
      progressCompanyProfile: progressCompanyProfile == freezed
          ? _value.progressCompanyProfile
          : progressCompanyProfile // ignore: cast_nullable_to_non_nullable
              as int?,
      progressBranchProfile: progressBranchProfile == freezed
          ? _value.progressBranchProfile
          : progressBranchProfile // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$InitialAccountVerificationState
    implements InitialAccountVerificationState {
  const _$InitialAccountVerificationState(
      {this.isAcceptedDataIsCorrect,
      this.isFullyCompleted,
      this.progressUserAccount,
      this.progressCompanyProfile,
      this.progressBranchProfile});

  @override
  final bool? isAcceptedDataIsCorrect;
  @override
  final bool? isFullyCompleted;
  @override
  final int? progressUserAccount;
  @override
  final int? progressCompanyProfile;
  @override
  final int? progressBranchProfile;

  @override
  String toString() {
    return 'VerifyAccountState.initial(isAcceptedDataIsCorrect: $isAcceptedDataIsCorrect, isFullyCompleted: $isFullyCompleted, progressUserAccount: $progressUserAccount, progressCompanyProfile: $progressCompanyProfile, progressBranchProfile: $progressBranchProfile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialAccountVerificationState &&
            const DeepCollectionEquality().equals(
                other.isAcceptedDataIsCorrect, isAcceptedDataIsCorrect) &&
            const DeepCollectionEquality()
                .equals(other.isFullyCompleted, isFullyCompleted) &&
            const DeepCollectionEquality()
                .equals(other.progressUserAccount, progressUserAccount) &&
            const DeepCollectionEquality()
                .equals(other.progressCompanyProfile, progressCompanyProfile) &&
            const DeepCollectionEquality()
                .equals(other.progressBranchProfile, progressBranchProfile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isAcceptedDataIsCorrect),
      const DeepCollectionEquality().hash(isFullyCompleted),
      const DeepCollectionEquality().hash(progressUserAccount),
      const DeepCollectionEquality().hash(progressCompanyProfile),
      const DeepCollectionEquality().hash(progressBranchProfile));

  @JsonKey(ignore: true)
  @override
  _$$InitialAccountVerificationStateCopyWith<_$InitialAccountVerificationState>
      get copyWith => __$$InitialAccountVerificationStateCopyWithImpl<
          _$InitialAccountVerificationState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool? isAcceptedDataIsCorrect,
            bool? isFullyCompleted,
            int? progressUserAccount,
            int? progressCompanyProfile,
            int? progressBranchProfile)
        initial,
    required TResult Function(ApiFailure error) error,
  }) {
    return initial(isAcceptedDataIsCorrect, isFullyCompleted,
        progressUserAccount, progressCompanyProfile, progressBranchProfile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            bool? isAcceptedDataIsCorrect,
            bool? isFullyCompleted,
            int? progressUserAccount,
            int? progressCompanyProfile,
            int? progressBranchProfile)?
        initial,
    TResult Function(ApiFailure error)? error,
  }) {
    return initial?.call(isAcceptedDataIsCorrect, isFullyCompleted,
        progressUserAccount, progressCompanyProfile, progressBranchProfile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool? isAcceptedDataIsCorrect,
            bool? isFullyCompleted,
            int? progressUserAccount,
            int? progressCompanyProfile,
            int? progressBranchProfile)?
        initial,
    TResult Function(ApiFailure error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isAcceptedDataIsCorrect, isFullyCompleted,
          progressUserAccount, progressCompanyProfile, progressBranchProfile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAccountVerificationState value) initial,
    required TResult Function(ErrorAccountVerificationState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialAccountVerificationState value)? initial,
    TResult Function(ErrorAccountVerificationState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAccountVerificationState value)? initial,
    TResult Function(ErrorAccountVerificationState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialAccountVerificationState implements VerifyAccountState {
  const factory InitialAccountVerificationState(
      {final bool? isAcceptedDataIsCorrect,
      final bool? isFullyCompleted,
      final int? progressUserAccount,
      final int? progressCompanyProfile,
      final int? progressBranchProfile}) = _$InitialAccountVerificationState;

  bool? get isAcceptedDataIsCorrect => throw _privateConstructorUsedError;
  bool? get isFullyCompleted => throw _privateConstructorUsedError;
  int? get progressUserAccount => throw _privateConstructorUsedError;
  int? get progressCompanyProfile => throw _privateConstructorUsedError;
  int? get progressBranchProfile => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$InitialAccountVerificationStateCopyWith<_$InitialAccountVerificationState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorAccountVerificationStateCopyWith<$Res> {
  factory _$$ErrorAccountVerificationStateCopyWith(
          _$ErrorAccountVerificationState value,
          $Res Function(_$ErrorAccountVerificationState) then) =
      __$$ErrorAccountVerificationStateCopyWithImpl<$Res>;
  $Res call({ApiFailure error});
}

/// @nodoc
class __$$ErrorAccountVerificationStateCopyWithImpl<$Res>
    extends _$VerifyAccountStateCopyWithImpl<$Res>
    implements _$$ErrorAccountVerificationStateCopyWith<$Res> {
  __$$ErrorAccountVerificationStateCopyWithImpl(
      _$ErrorAccountVerificationState _value,
      $Res Function(_$ErrorAccountVerificationState) _then)
      : super(_value, (v) => _then(v as _$ErrorAccountVerificationState));

  @override
  _$ErrorAccountVerificationState get _value =>
      super._value as _$ErrorAccountVerificationState;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ErrorAccountVerificationState(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiFailure,
    ));
  }
}

/// @nodoc

class _$ErrorAccountVerificationState implements ErrorAccountVerificationState {
  const _$ErrorAccountVerificationState({required this.error});

  @override
  final ApiFailure error;

  @override
  String toString() {
    return 'VerifyAccountState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorAccountVerificationState &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$ErrorAccountVerificationStateCopyWith<_$ErrorAccountVerificationState>
      get copyWith => __$$ErrorAccountVerificationStateCopyWithImpl<
          _$ErrorAccountVerificationState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool? isAcceptedDataIsCorrect,
            bool? isFullyCompleted,
            int? progressUserAccount,
            int? progressCompanyProfile,
            int? progressBranchProfile)
        initial,
    required TResult Function(ApiFailure error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            bool? isAcceptedDataIsCorrect,
            bool? isFullyCompleted,
            int? progressUserAccount,
            int? progressCompanyProfile,
            int? progressBranchProfile)?
        initial,
    TResult Function(ApiFailure error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool? isAcceptedDataIsCorrect,
            bool? isFullyCompleted,
            int? progressUserAccount,
            int? progressCompanyProfile,
            int? progressBranchProfile)?
        initial,
    TResult Function(ApiFailure error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAccountVerificationState value) initial,
    required TResult Function(ErrorAccountVerificationState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialAccountVerificationState value)? initial,
    TResult Function(ErrorAccountVerificationState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAccountVerificationState value)? initial,
    TResult Function(ErrorAccountVerificationState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorAccountVerificationState implements VerifyAccountState {
  const factory ErrorAccountVerificationState(
      {required final ApiFailure error}) = _$ErrorAccountVerificationState;

  ApiFailure get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ErrorAccountVerificationStateCopyWith<_$ErrorAccountVerificationState>
      get copyWith => throw _privateConstructorUsedError;
}
