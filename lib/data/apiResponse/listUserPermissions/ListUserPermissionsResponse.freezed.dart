// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ListUserPermissionsResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListUserPermissionsResponse {
  @JsonKey(name: 'result')
  int get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Map<String, Map<String, PermissionInfo>> get data =>
      throw _privateConstructorUsedError;

  /// Create a copy of ListUserPermissionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListUserPermissionsResponseCopyWith<ListUserPermissionsResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListUserPermissionsResponseCopyWith<$Res> {
  factory $ListUserPermissionsResponseCopyWith(
          ListUserPermissionsResponse value,
          $Res Function(ListUserPermissionsResponse) then) =
      _$ListUserPermissionsResponseCopyWithImpl<$Res,
          ListUserPermissionsResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'data') Map<String, Map<String, PermissionInfo>> data});
}

/// @nodoc
class _$ListUserPermissionsResponseCopyWithImpl<$Res,
        $Val extends ListUserPermissionsResponse>
    implements $ListUserPermissionsResponseCopyWith<$Res> {
  _$ListUserPermissionsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListUserPermissionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, PermissionInfo>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListUserPermissionsResponseImplCopyWith<$Res>
    implements $ListUserPermissionsResponseCopyWith<$Res> {
  factory _$$ListUserPermissionsResponseImplCopyWith(
          _$ListUserPermissionsResponseImpl value,
          $Res Function(_$ListUserPermissionsResponseImpl) then) =
      __$$ListUserPermissionsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'data') Map<String, Map<String, PermissionInfo>> data});
}

/// @nodoc
class __$$ListUserPermissionsResponseImplCopyWithImpl<$Res>
    extends _$ListUserPermissionsResponseCopyWithImpl<$Res,
        _$ListUserPermissionsResponseImpl>
    implements _$$ListUserPermissionsResponseImplCopyWith<$Res> {
  __$$ListUserPermissionsResponseImplCopyWithImpl(
      _$ListUserPermissionsResponseImpl _value,
      $Res Function(_$ListUserPermissionsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListUserPermissionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? data = null,
  }) {
    return _then(_$ListUserPermissionsResponseImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, PermissionInfo>>,
    ));
  }
}

/// @nodoc

class _$ListUserPermissionsResponseImpl
    implements _ListUserPermissionsResponse {
  const _$ListUserPermissionsResponseImpl(
      {@JsonKey(name: 'result') required this.result,
      @JsonKey(name: 'data')
      required final Map<String, Map<String, PermissionInfo>> data})
      : _data = data;

  @override
  @JsonKey(name: 'result')
  final int result;
  final Map<String, Map<String, PermissionInfo>> _data;
  @override
  @JsonKey(name: 'data')
  Map<String, Map<String, PermissionInfo>> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'ListUserPermissionsResponse(result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListUserPermissionsResponseImpl &&
            (identical(other.result, result) || other.result == result) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, result, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ListUserPermissionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListUserPermissionsResponseImplCopyWith<_$ListUserPermissionsResponseImpl>
      get copyWith => __$$ListUserPermissionsResponseImplCopyWithImpl<
          _$ListUserPermissionsResponseImpl>(this, _$identity);
}

abstract class _ListUserPermissionsResponse
    implements ListUserPermissionsResponse {
  const factory _ListUserPermissionsResponse(
          {@JsonKey(name: 'result') required final int result,
          @JsonKey(name: 'data')
          required final Map<String, Map<String, PermissionInfo>> data}) =
      _$ListUserPermissionsResponseImpl;

  @override
  @JsonKey(name: 'result')
  int get result;
  @override
  @JsonKey(name: 'data')
  Map<String, Map<String, PermissionInfo>> get data;

  /// Create a copy of ListUserPermissionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListUserPermissionsResponseImplCopyWith<_$ListUserPermissionsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PermissionInfo _$PermissionInfoFromJson(Map<String, dynamic> json) {
  return _PermissionInfo.fromJson(json);
}

/// @nodoc
mixin _$PermissionInfo {
  @JsonKey(name: 'permission')
  int get permission => throw _privateConstructorUsedError;
  @JsonKey(name: 'ruleFlag')
  int get ruleFlag => throw _privateConstructorUsedError;

  /// Serializes this PermissionInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PermissionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PermissionInfoCopyWith<PermissionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionInfoCopyWith<$Res> {
  factory $PermissionInfoCopyWith(
          PermissionInfo value, $Res Function(PermissionInfo) then) =
      _$PermissionInfoCopyWithImpl<$Res, PermissionInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'permission') int permission,
      @JsonKey(name: 'ruleFlag') int ruleFlag});
}

/// @nodoc
class _$PermissionInfoCopyWithImpl<$Res, $Val extends PermissionInfo>
    implements $PermissionInfoCopyWith<$Res> {
  _$PermissionInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PermissionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = null,
    Object? ruleFlag = null,
  }) {
    return _then(_value.copyWith(
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as int,
      ruleFlag: null == ruleFlag
          ? _value.ruleFlag
          : ruleFlag // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionInfoImplCopyWith<$Res>
    implements $PermissionInfoCopyWith<$Res> {
  factory _$$PermissionInfoImplCopyWith(_$PermissionInfoImpl value,
          $Res Function(_$PermissionInfoImpl) then) =
      __$$PermissionInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'permission') int permission,
      @JsonKey(name: 'ruleFlag') int ruleFlag});
}

/// @nodoc
class __$$PermissionInfoImplCopyWithImpl<$Res>
    extends _$PermissionInfoCopyWithImpl<$Res, _$PermissionInfoImpl>
    implements _$$PermissionInfoImplCopyWith<$Res> {
  __$$PermissionInfoImplCopyWithImpl(
      _$PermissionInfoImpl _value, $Res Function(_$PermissionInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PermissionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = null,
    Object? ruleFlag = null,
  }) {
    return _then(_$PermissionInfoImpl(
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as int,
      ruleFlag: null == ruleFlag
          ? _value.ruleFlag
          : ruleFlag // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionInfoImpl implements _PermissionInfo {
  const _$PermissionInfoImpl(
      {@JsonKey(name: 'permission') required this.permission,
      @JsonKey(name: 'ruleFlag') required this.ruleFlag});

  factory _$PermissionInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionInfoImplFromJson(json);

  @override
  @JsonKey(name: 'permission')
  final int permission;
  @override
  @JsonKey(name: 'ruleFlag')
  final int ruleFlag;

  @override
  String toString() {
    return 'PermissionInfo(permission: $permission, ruleFlag: $ruleFlag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionInfoImpl &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.ruleFlag, ruleFlag) ||
                other.ruleFlag == ruleFlag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, permission, ruleFlag);

  /// Create a copy of PermissionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionInfoImplCopyWith<_$PermissionInfoImpl> get copyWith =>
      __$$PermissionInfoImplCopyWithImpl<_$PermissionInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionInfoImplToJson(
      this,
    );
  }
}

abstract class _PermissionInfo implements PermissionInfo {
  const factory _PermissionInfo(
          {@JsonKey(name: 'permission') required final int permission,
          @JsonKey(name: 'ruleFlag') required final int ruleFlag}) =
      _$PermissionInfoImpl;

  factory _PermissionInfo.fromJson(Map<String, dynamic> json) =
      _$PermissionInfoImpl.fromJson;

  @override
  @JsonKey(name: 'permission')
  int get permission;
  @override
  @JsonKey(name: 'ruleFlag')
  int get ruleFlag;

  /// Create a copy of PermissionInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionInfoImplCopyWith<_$PermissionInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
