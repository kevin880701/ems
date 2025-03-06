// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ListUserPermissionsParams.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListUserPermissionsParams _$ListUserPermissionsParamsFromJson(
    Map<String, dynamic> json) {
  return _ListUserPermissionsParams.fromJson(json);
}

/// @nodoc
mixin _$ListUserPermissionsParams {
  @JsonKey(name: 'accountids')
  String get accountids => throw _privateConstructorUsedError;

  /// Serializes this ListUserPermissionsParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListUserPermissionsParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListUserPermissionsParamsCopyWith<ListUserPermissionsParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListUserPermissionsParamsCopyWith<$Res> {
  factory $ListUserPermissionsParamsCopyWith(ListUserPermissionsParams value,
          $Res Function(ListUserPermissionsParams) then) =
      _$ListUserPermissionsParamsCopyWithImpl<$Res, ListUserPermissionsParams>;
  @useResult
  $Res call({@JsonKey(name: 'accountids') String accountids});
}

/// @nodoc
class _$ListUserPermissionsParamsCopyWithImpl<$Res,
        $Val extends ListUserPermissionsParams>
    implements $ListUserPermissionsParamsCopyWith<$Res> {
  _$ListUserPermissionsParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListUserPermissionsParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountids = null,
  }) {
    return _then(_value.copyWith(
      accountids: null == accountids
          ? _value.accountids
          : accountids // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListUserPermissionsParamsImplCopyWith<$Res>
    implements $ListUserPermissionsParamsCopyWith<$Res> {
  factory _$$ListUserPermissionsParamsImplCopyWith(
          _$ListUserPermissionsParamsImpl value,
          $Res Function(_$ListUserPermissionsParamsImpl) then) =
      __$$ListUserPermissionsParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'accountids') String accountids});
}

/// @nodoc
class __$$ListUserPermissionsParamsImplCopyWithImpl<$Res>
    extends _$ListUserPermissionsParamsCopyWithImpl<$Res,
        _$ListUserPermissionsParamsImpl>
    implements _$$ListUserPermissionsParamsImplCopyWith<$Res> {
  __$$ListUserPermissionsParamsImplCopyWithImpl(
      _$ListUserPermissionsParamsImpl _value,
      $Res Function(_$ListUserPermissionsParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListUserPermissionsParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountids = null,
  }) {
    return _then(_$ListUserPermissionsParamsImpl(
      accountids: null == accountids
          ? _value.accountids
          : accountids // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListUserPermissionsParamsImpl implements _ListUserPermissionsParams {
  const _$ListUserPermissionsParamsImpl(
      {@JsonKey(name: 'accountids') required this.accountids});

  factory _$ListUserPermissionsParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListUserPermissionsParamsImplFromJson(json);

  @override
  @JsonKey(name: 'accountids')
  final String accountids;

  @override
  String toString() {
    return 'ListUserPermissionsParams(accountids: $accountids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListUserPermissionsParamsImpl &&
            (identical(other.accountids, accountids) ||
                other.accountids == accountids));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accountids);

  /// Create a copy of ListUserPermissionsParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListUserPermissionsParamsImplCopyWith<_$ListUserPermissionsParamsImpl>
      get copyWith => __$$ListUserPermissionsParamsImplCopyWithImpl<
          _$ListUserPermissionsParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListUserPermissionsParamsImplToJson(
      this,
    );
  }
}

abstract class _ListUserPermissionsParams implements ListUserPermissionsParams {
  const factory _ListUserPermissionsParams(
          {@JsonKey(name: 'accountids') required final String accountids}) =
      _$ListUserPermissionsParamsImpl;

  factory _ListUserPermissionsParams.fromJson(Map<String, dynamic> json) =
      _$ListUserPermissionsParamsImpl.fromJson;

  @override
  @JsonKey(name: 'accountids')
  String get accountids;

  /// Create a copy of ListUserPermissionsParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListUserPermissionsParamsImplCopyWith<_$ListUserPermissionsParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
