// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'DeviceListResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceListResponse _$DeviceListResponseFromJson(Map<String, dynamic> json) {
  return _DeviceListResponse.fromJson(json);
}

/// @nodoc
mixin _$DeviceListResponse {
  @JsonKey(name: 'result')
  int get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<DeviceListData> get data => throw _privateConstructorUsedError;

  /// Serializes this DeviceListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeviceListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceListResponseCopyWith<DeviceListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceListResponseCopyWith<$Res> {
  factory $DeviceListResponseCopyWith(
          DeviceListResponse value, $Res Function(DeviceListResponse) then) =
      _$DeviceListResponseCopyWithImpl<$Res, DeviceListResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'data') List<DeviceListData> data});
}

/// @nodoc
class _$DeviceListResponseCopyWithImpl<$Res, $Val extends DeviceListResponse>
    implements $DeviceListResponseCopyWith<$Res> {
  _$DeviceListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceListResponse
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
              as List<DeviceListData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceListResponseImplCopyWith<$Res>
    implements $DeviceListResponseCopyWith<$Res> {
  factory _$$DeviceListResponseImplCopyWith(_$DeviceListResponseImpl value,
          $Res Function(_$DeviceListResponseImpl) then) =
      __$$DeviceListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'data') List<DeviceListData> data});
}

/// @nodoc
class __$$DeviceListResponseImplCopyWithImpl<$Res>
    extends _$DeviceListResponseCopyWithImpl<$Res, _$DeviceListResponseImpl>
    implements _$$DeviceListResponseImplCopyWith<$Res> {
  __$$DeviceListResponseImplCopyWithImpl(_$DeviceListResponseImpl _value,
      $Res Function(_$DeviceListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? data = null,
  }) {
    return _then(_$DeviceListResponseImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DeviceListData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceListResponseImpl implements _DeviceListResponse {
  const _$DeviceListResponseImpl(
      {@JsonKey(name: 'result') required this.result,
      @JsonKey(name: 'data') required final List<DeviceListData> data})
      : _data = data;

  factory _$DeviceListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceListResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result')
  final int result;
  final List<DeviceListData> _data;
  @override
  @JsonKey(name: 'data')
  List<DeviceListData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'DeviceListResponse(result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceListResponseImpl &&
            (identical(other.result, result) || other.result == result) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, result, const DeepCollectionEquality().hash(_data));

  /// Create a copy of DeviceListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceListResponseImplCopyWith<_$DeviceListResponseImpl> get copyWith =>
      __$$DeviceListResponseImplCopyWithImpl<_$DeviceListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceListResponseImplToJson(
      this,
    );
  }
}

abstract class _DeviceListResponse implements DeviceListResponse {
  const factory _DeviceListResponse(
          {@JsonKey(name: 'result') required final int result,
          @JsonKey(name: 'data') required final List<DeviceListData> data}) =
      _$DeviceListResponseImpl;

  factory _DeviceListResponse.fromJson(Map<String, dynamic> json) =
      _$DeviceListResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result')
  int get result;
  @override
  @JsonKey(name: 'data')
  List<DeviceListData> get data;

  /// Create a copy of DeviceListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceListResponseImplCopyWith<_$DeviceListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeviceListData _$DeviceListDataFromJson(Map<String, dynamic> json) {
  return _DeviceListData.fromJson(json);
}

/// @nodoc
mixin _$DeviceListData {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent')
  String? get parent => throw _privateConstructorUsedError;
  @JsonKey(name: 'devId')
  String get devId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'modelId')
  int get modelId => throw _privateConstructorUsedError;
  @JsonKey(name: 'modelName')
  String get modelName => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner')
  String? get owner => throw _privateConstructorUsedError;
  @JsonKey(name: 'activeappid')
  int get activeappid => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'profiles')
  List<dynamic> get profiles => throw _privateConstructorUsedError;
  @JsonKey(name: 'attrs')
  Attrs? get attrs => throw _privateConstructorUsedError;
  @JsonKey(name: 'vals', fromJson: valsFromJson)
  Vals? get vals => throw _privateConstructorUsedError;

  /// Serializes this DeviceListData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeviceListData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceListDataCopyWith<DeviceListData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceListDataCopyWith<$Res> {
  factory $DeviceListDataCopyWith(
          DeviceListData value, $Res Function(DeviceListData) then) =
      _$DeviceListDataCopyWithImpl<$Res, DeviceListData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'parent') String? parent,
      @JsonKey(name: 'devId') String devId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'modelId') int modelId,
      @JsonKey(name: 'modelName') String modelName,
      @JsonKey(name: 'owner') String? owner,
      @JsonKey(name: 'activeappid') int activeappid,
      @JsonKey(name: 'status') int status,
      @JsonKey(name: 'profiles') List<dynamic> profiles,
      @JsonKey(name: 'attrs') Attrs? attrs,
      @JsonKey(name: 'vals', fromJson: valsFromJson) Vals? vals});

  $AttrsCopyWith<$Res>? get attrs;
  $ValsCopyWith<$Res>? get vals;
}

/// @nodoc
class _$DeviceListDataCopyWithImpl<$Res, $Val extends DeviceListData>
    implements $DeviceListDataCopyWith<$Res> {
  _$DeviceListDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceListData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parent = freezed,
    Object? devId = null,
    Object? name = null,
    Object? modelId = null,
    Object? modelName = null,
    Object? owner = freezed,
    Object? activeappid = null,
    Object? status = null,
    Object? profiles = null,
    Object? attrs = freezed,
    Object? vals = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      devId: null == devId
          ? _value.devId
          : devId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      modelId: null == modelId
          ? _value.modelId
          : modelId // ignore: cast_nullable_to_non_nullable
              as int,
      modelName: null == modelName
          ? _value.modelName
          : modelName // ignore: cast_nullable_to_non_nullable
              as String,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      activeappid: null == activeappid
          ? _value.activeappid
          : activeappid // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      profiles: null == profiles
          ? _value.profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      attrs: freezed == attrs
          ? _value.attrs
          : attrs // ignore: cast_nullable_to_non_nullable
              as Attrs?,
      vals: freezed == vals
          ? _value.vals
          : vals // ignore: cast_nullable_to_non_nullable
              as Vals?,
    ) as $Val);
  }

  /// Create a copy of DeviceListData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttrsCopyWith<$Res>? get attrs {
    if (_value.attrs == null) {
      return null;
    }

    return $AttrsCopyWith<$Res>(_value.attrs!, (value) {
      return _then(_value.copyWith(attrs: value) as $Val);
    });
  }

  /// Create a copy of DeviceListData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ValsCopyWith<$Res>? get vals {
    if (_value.vals == null) {
      return null;
    }

    return $ValsCopyWith<$Res>(_value.vals!, (value) {
      return _then(_value.copyWith(vals: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeviceListDataImplCopyWith<$Res>
    implements $DeviceListDataCopyWith<$Res> {
  factory _$$DeviceListDataImplCopyWith(_$DeviceListDataImpl value,
          $Res Function(_$DeviceListDataImpl) then) =
      __$$DeviceListDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'parent') String? parent,
      @JsonKey(name: 'devId') String devId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'modelId') int modelId,
      @JsonKey(name: 'modelName') String modelName,
      @JsonKey(name: 'owner') String? owner,
      @JsonKey(name: 'activeappid') int activeappid,
      @JsonKey(name: 'status') int status,
      @JsonKey(name: 'profiles') List<dynamic> profiles,
      @JsonKey(name: 'attrs') Attrs? attrs,
      @JsonKey(name: 'vals', fromJson: valsFromJson) Vals? vals});

  @override
  $AttrsCopyWith<$Res>? get attrs;
  @override
  $ValsCopyWith<$Res>? get vals;
}

/// @nodoc
class __$$DeviceListDataImplCopyWithImpl<$Res>
    extends _$DeviceListDataCopyWithImpl<$Res, _$DeviceListDataImpl>
    implements _$$DeviceListDataImplCopyWith<$Res> {
  __$$DeviceListDataImplCopyWithImpl(
      _$DeviceListDataImpl _value, $Res Function(_$DeviceListDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceListData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parent = freezed,
    Object? devId = null,
    Object? name = null,
    Object? modelId = null,
    Object? modelName = null,
    Object? owner = freezed,
    Object? activeappid = null,
    Object? status = null,
    Object? profiles = null,
    Object? attrs = freezed,
    Object? vals = freezed,
  }) {
    return _then(_$DeviceListDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      devId: null == devId
          ? _value.devId
          : devId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      modelId: null == modelId
          ? _value.modelId
          : modelId // ignore: cast_nullable_to_non_nullable
              as int,
      modelName: null == modelName
          ? _value.modelName
          : modelName // ignore: cast_nullable_to_non_nullable
              as String,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      activeappid: null == activeappid
          ? _value.activeappid
          : activeappid // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      profiles: null == profiles
          ? _value._profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      attrs: freezed == attrs
          ? _value.attrs
          : attrs // ignore: cast_nullable_to_non_nullable
              as Attrs?,
      vals: freezed == vals
          ? _value.vals
          : vals // ignore: cast_nullable_to_non_nullable
              as Vals?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceListDataImpl implements _DeviceListData {
  const _$DeviceListDataImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'parent') this.parent,
      @JsonKey(name: 'devId') required this.devId,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'modelId') required this.modelId,
      @JsonKey(name: 'modelName') required this.modelName,
      @JsonKey(name: 'owner') this.owner,
      @JsonKey(name: 'activeappid') required this.activeappid,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'profiles') required final List<dynamic> profiles,
      @JsonKey(name: 'attrs') this.attrs,
      @JsonKey(name: 'vals', fromJson: valsFromJson) this.vals})
      : _profiles = profiles;

  factory _$DeviceListDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceListDataImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'parent')
  final String? parent;
  @override
  @JsonKey(name: 'devId')
  final String devId;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'modelId')
  final int modelId;
  @override
  @JsonKey(name: 'modelName')
  final String modelName;
  @override
  @JsonKey(name: 'owner')
  final String? owner;
  @override
  @JsonKey(name: 'activeappid')
  final int activeappid;
  @override
  @JsonKey(name: 'status')
  final int status;
  final List<dynamic> _profiles;
  @override
  @JsonKey(name: 'profiles')
  List<dynamic> get profiles {
    if (_profiles is EqualUnmodifiableListView) return _profiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profiles);
  }

  @override
  @JsonKey(name: 'attrs')
  final Attrs? attrs;
  @override
  @JsonKey(name: 'vals', fromJson: valsFromJson)
  final Vals? vals;

  @override
  String toString() {
    return 'DeviceListData(id: $id, parent: $parent, devId: $devId, name: $name, modelId: $modelId, modelName: $modelName, owner: $owner, activeappid: $activeappid, status: $status, profiles: $profiles, attrs: $attrs, vals: $vals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceListDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.devId, devId) || other.devId == devId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.modelId, modelId) || other.modelId == modelId) &&
            (identical(other.modelName, modelName) ||
                other.modelName == modelName) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.activeappid, activeappid) ||
                other.activeappid == activeappid) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._profiles, _profiles) &&
            (identical(other.attrs, attrs) || other.attrs == attrs) &&
            (identical(other.vals, vals) || other.vals == vals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      parent,
      devId,
      name,
      modelId,
      modelName,
      owner,
      activeappid,
      status,
      const DeepCollectionEquality().hash(_profiles),
      attrs,
      vals);

  /// Create a copy of DeviceListData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceListDataImplCopyWith<_$DeviceListDataImpl> get copyWith =>
      __$$DeviceListDataImplCopyWithImpl<_$DeviceListDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceListDataImplToJson(
      this,
    );
  }
}

abstract class _DeviceListData implements DeviceListData {
  const factory _DeviceListData(
          {@JsonKey(name: 'id') required final String id,
          @JsonKey(name: 'parent') final String? parent,
          @JsonKey(name: 'devId') required final String devId,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'modelId') required final int modelId,
          @JsonKey(name: 'modelName') required final String modelName,
          @JsonKey(name: 'owner') final String? owner,
          @JsonKey(name: 'activeappid') required final int activeappid,
          @JsonKey(name: 'status') required final int status,
          @JsonKey(name: 'profiles') required final List<dynamic> profiles,
          @JsonKey(name: 'attrs') final Attrs? attrs,
          @JsonKey(name: 'vals', fromJson: valsFromJson) final Vals? vals}) =
      _$DeviceListDataImpl;

  factory _DeviceListData.fromJson(Map<String, dynamic> json) =
      _$DeviceListDataImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'parent')
  String? get parent;
  @override
  @JsonKey(name: 'devId')
  String get devId;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'modelId')
  int get modelId;
  @override
  @JsonKey(name: 'modelName')
  String get modelName;
  @override
  @JsonKey(name: 'owner')
  String? get owner;
  @override
  @JsonKey(name: 'activeappid')
  int get activeappid;
  @override
  @JsonKey(name: 'status')
  int get status;
  @override
  @JsonKey(name: 'profiles')
  List<dynamic> get profiles;
  @override
  @JsonKey(name: 'attrs')
  Attrs? get attrs;
  @override
  @JsonKey(name: 'vals', fromJson: valsFromJson)
  Vals? get vals;

  /// Create a copy of DeviceListData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceListDataImplCopyWith<_$DeviceListDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
