// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DashboardStateTearOff {
  const _$DashboardStateTearOff();

  InitDashboardState init({int? testCount}) {
    return InitDashboardState(
      testCount: testCount,
    );
  }
}

/// @nodoc
const $DashboardState = _$DashboardStateTearOff();

/// @nodoc
mixin _$DashboardState {
  int? get testCount => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? testCount) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? testCount)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? testCount)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitDashboardState value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitDashboardState value)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitDashboardState value)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res>;
  $Res call({int? testCount});
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  final DashboardState _value;
  // ignore: unused_field
  final $Res Function(DashboardState) _then;

  @override
  $Res call({
    Object? testCount = freezed,
  }) {
    return _then(_value.copyWith(
      testCount: testCount == freezed
          ? _value.testCount
          : testCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class $InitDashboardStateCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory $InitDashboardStateCopyWith(
          InitDashboardState value, $Res Function(InitDashboardState) then) =
      _$InitDashboardStateCopyWithImpl<$Res>;
  @override
  $Res call({int? testCount});
}

/// @nodoc
class _$InitDashboardStateCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res>
    implements $InitDashboardStateCopyWith<$Res> {
  _$InitDashboardStateCopyWithImpl(
      InitDashboardState _value, $Res Function(InitDashboardState) _then)
      : super(_value, (v) => _then(v as InitDashboardState));

  @override
  InitDashboardState get _value => super._value as InitDashboardState;

  @override
  $Res call({
    Object? testCount = freezed,
  }) {
    return _then(InitDashboardState(
      testCount: testCount == freezed
          ? _value.testCount
          : testCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$InitDashboardState implements InitDashboardState {
  const _$InitDashboardState({this.testCount});

  @override
  final int? testCount;

  @override
  String toString() {
    return 'DashboardState.init(testCount: $testCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InitDashboardState &&
            (identical(other.testCount, testCount) ||
                const DeepCollectionEquality()
                    .equals(other.testCount, testCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(testCount);

  @JsonKey(ignore: true)
  @override
  $InitDashboardStateCopyWith<InitDashboardState> get copyWith =>
      _$InitDashboardStateCopyWithImpl<InitDashboardState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? testCount) init,
  }) {
    return init(testCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? testCount)? init,
  }) {
    return init?.call(testCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? testCount)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(testCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitDashboardState value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitDashboardState value)? init,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitDashboardState value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class InitDashboardState implements DashboardState {
  const factory InitDashboardState({int? testCount}) = _$InitDashboardState;

  @override
  int? get testCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $InitDashboardStateCopyWith<InitDashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}
