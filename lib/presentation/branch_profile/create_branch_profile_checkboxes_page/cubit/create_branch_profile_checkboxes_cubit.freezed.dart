// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_branch_profile_checkboxes_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateBranchProfileCheckboxesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<CompanyDataCommonFieldsWithBranchData, bool> data)
        initial,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Map<CompanyDataCommonFieldsWithBranchData, bool> data)?
        initial,
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<CompanyDataCommonFieldsWithBranchData, bool> data)?
        initial,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialBranchCheckboxes value) initial,
    required TResult Function(LoadingBranchCheckboxes value) loading,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialBranchCheckboxes value)? initial,
    TResult Function(LoadingBranchCheckboxes value)? loading,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialBranchCheckboxes value)? initial,
    TResult Function(LoadingBranchCheckboxes value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBranchProfileCheckboxesStateCopyWith<$Res> {
  factory $CreateBranchProfileCheckboxesStateCopyWith(
          CreateBranchProfileCheckboxesState value,
          $Res Function(CreateBranchProfileCheckboxesState) then) =
      _$CreateBranchProfileCheckboxesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CreateBranchProfileCheckboxesStateCopyWithImpl<$Res>
    implements $CreateBranchProfileCheckboxesStateCopyWith<$Res> {
  _$CreateBranchProfileCheckboxesStateCopyWithImpl(this._value, this._then);

  final CreateBranchProfileCheckboxesState _value;

  // ignore: unused_field
  final $Res Function(CreateBranchProfileCheckboxesState) _then;
}

/// @nodoc
abstract class _$$InitialBranchCheckboxesCopyWith<$Res> {
  factory _$$InitialBranchCheckboxesCopyWith(_$InitialBranchCheckboxes value,
          $Res Function(_$InitialBranchCheckboxes) then) =
      __$$InitialBranchCheckboxesCopyWithImpl<$Res>;

  $Res call({Map<CompanyDataCommonFieldsWithBranchData, bool> data});
}

/// @nodoc
class __$$InitialBranchCheckboxesCopyWithImpl<$Res>
    extends _$CreateBranchProfileCheckboxesStateCopyWithImpl<$Res>
    implements _$$InitialBranchCheckboxesCopyWith<$Res> {
  __$$InitialBranchCheckboxesCopyWithImpl(_$InitialBranchCheckboxes _value,
      $Res Function(_$InitialBranchCheckboxes) _then)
      : super(_value, (v) => _then(v as _$InitialBranchCheckboxes));

  @override
  _$InitialBranchCheckboxes get _value =>
      super._value as _$InitialBranchCheckboxes;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$InitialBranchCheckboxes(
      data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<CompanyDataCommonFieldsWithBranchData, bool>,
    ));
  }
}

/// @nodoc

class _$InitialBranchCheckboxes implements InitialBranchCheckboxes {
  const _$InitialBranchCheckboxes(
      final Map<CompanyDataCommonFieldsWithBranchData, bool> data)
      : _data = data;

  final Map<CompanyDataCommonFieldsWithBranchData, bool> _data;

  @override
  Map<CompanyDataCommonFieldsWithBranchData, bool> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'CreateBranchProfileCheckboxesState.initial(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialBranchCheckboxes &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$InitialBranchCheckboxesCopyWith<_$InitialBranchCheckboxes> get copyWith =>
      __$$InitialBranchCheckboxesCopyWithImpl<_$InitialBranchCheckboxes>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<CompanyDataCommonFieldsWithBranchData, bool> data)
        initial,
    required TResult Function() loading,
  }) {
    return initial(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Map<CompanyDataCommonFieldsWithBranchData, bool> data)?
        initial,
    TResult Function()? loading,
  }) {
    return initial?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<CompanyDataCommonFieldsWithBranchData, bool> data)?
        initial,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialBranchCheckboxes value) initial,
    required TResult Function(LoadingBranchCheckboxes value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialBranchCheckboxes value)? initial,
    TResult Function(LoadingBranchCheckboxes value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialBranchCheckboxes value)? initial,
    TResult Function(LoadingBranchCheckboxes value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialBranchCheckboxes
    implements CreateBranchProfileCheckboxesState {
  const factory InitialBranchCheckboxes(
          final Map<CompanyDataCommonFieldsWithBranchData, bool> data) =
      _$InitialBranchCheckboxes;

  Map<CompanyDataCommonFieldsWithBranchData, bool> get data =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  _$$InitialBranchCheckboxesCopyWith<_$InitialBranchCheckboxes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingBranchCheckboxesCopyWith<$Res> {
  factory _$$LoadingBranchCheckboxesCopyWith(_$LoadingBranchCheckboxes value,
          $Res Function(_$LoadingBranchCheckboxes) then) =
      __$$LoadingBranchCheckboxesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingBranchCheckboxesCopyWithImpl<$Res>
    extends _$CreateBranchProfileCheckboxesStateCopyWithImpl<$Res>
    implements _$$LoadingBranchCheckboxesCopyWith<$Res> {
  __$$LoadingBranchCheckboxesCopyWithImpl(_$LoadingBranchCheckboxes _value,
      $Res Function(_$LoadingBranchCheckboxes) _then)
      : super(_value, (v) => _then(v as _$LoadingBranchCheckboxes));

  @override
  _$LoadingBranchCheckboxes get _value =>
      super._value as _$LoadingBranchCheckboxes;
}

/// @nodoc

class _$LoadingBranchCheckboxes implements LoadingBranchCheckboxes {
  const _$LoadingBranchCheckboxes();

  @override
  String toString() {
    return 'CreateBranchProfileCheckboxesState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingBranchCheckboxes);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<CompanyDataCommonFieldsWithBranchData, bool> data)
        initial,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Map<CompanyDataCommonFieldsWithBranchData, bool> data)?
        initial,
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<CompanyDataCommonFieldsWithBranchData, bool> data)?
        initial,
    TResult Function()? loading,
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
    required TResult Function(InitialBranchCheckboxes value) initial,
    required TResult Function(LoadingBranchCheckboxes value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialBranchCheckboxes value)? initial,
    TResult Function(LoadingBranchCheckboxes value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialBranchCheckboxes value)? initial,
    TResult Function(LoadingBranchCheckboxes value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingBranchCheckboxes
    implements CreateBranchProfileCheckboxesState {
  const factory LoadingBranchCheckboxes() = _$LoadingBranchCheckboxes;
}
