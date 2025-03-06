// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'UserInfoResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserInfoResponse _$UserInfoResponseFromJson(Map<String, dynamic> json) {
  return _UserInfoResponse.fromJson(json);
}

/// @nodoc
mixin _$UserInfoResponse {
  @JsonKey(name: 'result')
  int get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  UserInfoData get data => throw _privateConstructorUsedError;

  /// Serializes this UserInfoResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInfoResponseCopyWith<UserInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoResponseCopyWith<$Res> {
  factory $UserInfoResponseCopyWith(
          UserInfoResponse value, $Res Function(UserInfoResponse) then) =
      _$UserInfoResponseCopyWithImpl<$Res, UserInfoResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'data') UserInfoData data});

  $UserInfoDataCopyWith<$Res> get data;
}

/// @nodoc
class _$UserInfoResponseCopyWithImpl<$Res, $Val extends UserInfoResponse>
    implements $UserInfoResponseCopyWith<$Res> {
  _$UserInfoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInfoResponse
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
              as UserInfoData,
    ) as $Val);
  }

  /// Create a copy of UserInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoDataCopyWith<$Res> get data {
    return $UserInfoDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserInfoResponseImplCopyWith<$Res>
    implements $UserInfoResponseCopyWith<$Res> {
  factory _$$UserInfoResponseImplCopyWith(_$UserInfoResponseImpl value,
          $Res Function(_$UserInfoResponseImpl) then) =
      __$$UserInfoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'data') UserInfoData data});

  @override
  $UserInfoDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$UserInfoResponseImplCopyWithImpl<$Res>
    extends _$UserInfoResponseCopyWithImpl<$Res, _$UserInfoResponseImpl>
    implements _$$UserInfoResponseImplCopyWith<$Res> {
  __$$UserInfoResponseImplCopyWithImpl(_$UserInfoResponseImpl _value,
      $Res Function(_$UserInfoResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? data = null,
  }) {
    return _then(_$UserInfoResponseImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserInfoData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoResponseImpl implements _UserInfoResponse {
  const _$UserInfoResponseImpl(
      {@JsonKey(name: 'result') required this.result,
      @JsonKey(name: 'data') required this.data});

  factory _$UserInfoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result')
  final int result;
  @override
  @JsonKey(name: 'data')
  final UserInfoData data;

  @override
  String toString() {
    return 'UserInfoResponse(result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoResponseImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result, data);

  /// Create a copy of UserInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoResponseImplCopyWith<_$UserInfoResponseImpl> get copyWith =>
      __$$UserInfoResponseImplCopyWithImpl<_$UserInfoResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoResponseImplToJson(
      this,
    );
  }
}

abstract class _UserInfoResponse implements UserInfoResponse {
  const factory _UserInfoResponse(
          {@JsonKey(name: 'result') required final int result,
          @JsonKey(name: 'data') required final UserInfoData data}) =
      _$UserInfoResponseImpl;

  factory _UserInfoResponse.fromJson(Map<String, dynamic> json) =
      _$UserInfoResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result')
  int get result;
  @override
  @JsonKey(name: 'data')
  UserInfoData get data;

  /// Create a copy of UserInfoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInfoResponseImplCopyWith<_$UserInfoResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserInfoData _$UserInfoDataFromJson(Map<String, dynamic> json) {
  return _UserInfoData.fromJson(json);
}

/// @nodoc
mixin _$UserInfoData {
  @JsonKey(name: 'uid')
  String? get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'account')
  String? get account => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'org')
  String? get org => throw _privateConstructorUsedError;
  @JsonKey(name: 'accountType')
  int get accountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'attrs')
  Map<String, String> get attrs => throw _privateConstructorUsedError;
  @JsonKey(name: 'groups')
  List<Group> get groups => throw _privateConstructorUsedError;
  @JsonKey(name: 'pushInfo')
  Map<String, dynamic> get pushInfo => throw _privateConstructorUsedError;

  /// Serializes this UserInfoData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserInfoData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInfoDataCopyWith<UserInfoData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoDataCopyWith<$Res> {
  factory $UserInfoDataCopyWith(
          UserInfoData value, $Res Function(UserInfoData) then) =
      _$UserInfoDataCopyWithImpl<$Res, UserInfoData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'uid') String? uid,
      @JsonKey(name: 'account') String? account,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'org') String? org,
      @JsonKey(name: 'accountType') int accountType,
      @JsonKey(name: 'attrs') Map<String, String> attrs,
      @JsonKey(name: 'groups') List<Group> groups,
      @JsonKey(name: 'pushInfo') Map<String, dynamic> pushInfo});
}

/// @nodoc
class _$UserInfoDataCopyWithImpl<$Res, $Val extends UserInfoData>
    implements $UserInfoDataCopyWith<$Res> {
  _$UserInfoDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInfoData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? account = freezed,
    Object? name = freezed,
    Object? org = freezed,
    Object? accountType = null,
    Object? attrs = null,
    Object? groups = null,
    Object? pushInfo = null,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      org: freezed == org
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as int,
      attrs: null == attrs
          ? _value.attrs
          : attrs // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
      pushInfo: null == pushInfo
          ? _value.pushInfo
          : pushInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInfoDataImplCopyWith<$Res>
    implements $UserInfoDataCopyWith<$Res> {
  factory _$$UserInfoDataImplCopyWith(
          _$UserInfoDataImpl value, $Res Function(_$UserInfoDataImpl) then) =
      __$$UserInfoDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'uid') String? uid,
      @JsonKey(name: 'account') String? account,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'org') String? org,
      @JsonKey(name: 'accountType') int accountType,
      @JsonKey(name: 'attrs') Map<String, String> attrs,
      @JsonKey(name: 'groups') List<Group> groups,
      @JsonKey(name: 'pushInfo') Map<String, dynamic> pushInfo});
}

/// @nodoc
class __$$UserInfoDataImplCopyWithImpl<$Res>
    extends _$UserInfoDataCopyWithImpl<$Res, _$UserInfoDataImpl>
    implements _$$UserInfoDataImplCopyWith<$Res> {
  __$$UserInfoDataImplCopyWithImpl(
      _$UserInfoDataImpl _value, $Res Function(_$UserInfoDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInfoData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? account = freezed,
    Object? name = freezed,
    Object? org = freezed,
    Object? accountType = null,
    Object? attrs = null,
    Object? groups = null,
    Object? pushInfo = null,
  }) {
    return _then(_$UserInfoDataImpl(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      org: freezed == org
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as int,
      attrs: null == attrs
          ? _value._attrs
          : attrs // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
      pushInfo: null == pushInfo
          ? _value._pushInfo
          : pushInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoDataImpl implements _UserInfoData {
  const _$UserInfoDataImpl(
      {@JsonKey(name: 'uid') this.uid,
      @JsonKey(name: 'account') this.account,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'org') this.org,
      @JsonKey(name: 'accountType') required this.accountType,
      @JsonKey(name: 'attrs') required final Map<String, String> attrs,
      @JsonKey(name: 'groups') required final List<Group> groups,
      @JsonKey(name: 'pushInfo') required final Map<String, dynamic> pushInfo})
      : _attrs = attrs,
        _groups = groups,
        _pushInfo = pushInfo;

  factory _$UserInfoDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoDataImplFromJson(json);

  @override
  @JsonKey(name: 'uid')
  final String? uid;
  @override
  @JsonKey(name: 'account')
  final String? account;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'org')
  final String? org;
  @override
  @JsonKey(name: 'accountType')
  final int accountType;
  final Map<String, String> _attrs;
  @override
  @JsonKey(name: 'attrs')
  Map<String, String> get attrs {
    if (_attrs is EqualUnmodifiableMapView) return _attrs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attrs);
  }

  final List<Group> _groups;
  @override
  @JsonKey(name: 'groups')
  List<Group> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  final Map<String, dynamic> _pushInfo;
  @override
  @JsonKey(name: 'pushInfo')
  Map<String, dynamic> get pushInfo {
    if (_pushInfo is EqualUnmodifiableMapView) return _pushInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_pushInfo);
  }

  @override
  String toString() {
    return 'UserInfoData(uid: $uid, account: $account, name: $name, org: $org, accountType: $accountType, attrs: $attrs, groups: $groups, pushInfo: $pushInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoDataImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.org, org) || other.org == org) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            const DeepCollectionEquality().equals(other._attrs, _attrs) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            const DeepCollectionEquality().equals(other._pushInfo, _pushInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      account,
      name,
      org,
      accountType,
      const DeepCollectionEquality().hash(_attrs),
      const DeepCollectionEquality().hash(_groups),
      const DeepCollectionEquality().hash(_pushInfo));

  /// Create a copy of UserInfoData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoDataImplCopyWith<_$UserInfoDataImpl> get copyWith =>
      __$$UserInfoDataImplCopyWithImpl<_$UserInfoDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoDataImplToJson(
      this,
    );
  }
}

abstract class _UserInfoData implements UserInfoData {
  const factory _UserInfoData(
      {@JsonKey(name: 'uid') final String? uid,
      @JsonKey(name: 'account') final String? account,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'org') final String? org,
      @JsonKey(name: 'accountType') required final int accountType,
      @JsonKey(name: 'attrs') required final Map<String, String> attrs,
      @JsonKey(name: 'groups') required final List<Group> groups,
      @JsonKey(name: 'pushInfo')
      required final Map<String, dynamic> pushInfo}) = _$UserInfoDataImpl;

  factory _UserInfoData.fromJson(Map<String, dynamic> json) =
      _$UserInfoDataImpl.fromJson;

  @override
  @JsonKey(name: 'uid')
  String? get uid;
  @override
  @JsonKey(name: 'account')
  String? get account;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'org')
  String? get org;
  @override
  @JsonKey(name: 'accountType')
  int get accountType;
  @override
  @JsonKey(name: 'attrs')
  Map<String, String> get attrs;
  @override
  @JsonKey(name: 'groups')
  List<Group> get groups;
  @override
  @JsonKey(name: 'pushInfo')
  Map<String, dynamic> get pushInfo;

  /// Create a copy of UserInfoData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInfoDataImplCopyWith<_$UserInfoDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Group _$GroupFromJson(Map<String, dynamic> json) {
  return _Group.fromJson(json);
}

/// @nodoc
mixin _$Group {
  @JsonKey(name: 'groupId')
  String get groupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent')
  String get parent => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner')
  String get owner => throw _privateConstructorUsedError;
  @JsonKey(name: 'attrs')
  Map<String, dynamic> get attrs => throw _privateConstructorUsedError;
  @JsonKey(name: 'ownerAccount')
  String? get ownerAccount => throw _privateConstructorUsedError;

  /// Serializes this Group to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupCopyWith<Group> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupCopyWith<$Res> {
  factory $GroupCopyWith(Group value, $Res Function(Group) then) =
      _$GroupCopyWithImpl<$Res, Group>;
  @useResult
  $Res call(
      {@JsonKey(name: 'groupId') String groupId,
      @JsonKey(name: 'parent') String parent,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'owner') String owner,
      @JsonKey(name: 'attrs') Map<String, dynamic> attrs,
      @JsonKey(name: 'ownerAccount') String? ownerAccount});
}

/// @nodoc
class _$GroupCopyWithImpl<$Res, $Val extends Group>
    implements $GroupCopyWith<$Res> {
  _$GroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = null,
    Object? parent = null,
    Object? name = null,
    Object? owner = null,
    Object? attrs = null,
    Object? ownerAccount = freezed,
  }) {
    return _then(_value.copyWith(
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      parent: null == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      attrs: null == attrs
          ? _value.attrs
          : attrs // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      ownerAccount: freezed == ownerAccount
          ? _value.ownerAccount
          : ownerAccount // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupImplCopyWith<$Res> implements $GroupCopyWith<$Res> {
  factory _$$GroupImplCopyWith(
          _$GroupImpl value, $Res Function(_$GroupImpl) then) =
      __$$GroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'groupId') String groupId,
      @JsonKey(name: 'parent') String parent,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'owner') String owner,
      @JsonKey(name: 'attrs') Map<String, dynamic> attrs,
      @JsonKey(name: 'ownerAccount') String? ownerAccount});
}

/// @nodoc
class __$$GroupImplCopyWithImpl<$Res>
    extends _$GroupCopyWithImpl<$Res, _$GroupImpl>
    implements _$$GroupImplCopyWith<$Res> {
  __$$GroupImplCopyWithImpl(
      _$GroupImpl _value, $Res Function(_$GroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = null,
    Object? parent = null,
    Object? name = null,
    Object? owner = null,
    Object? attrs = null,
    Object? ownerAccount = freezed,
  }) {
    return _then(_$GroupImpl(
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      parent: null == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      attrs: null == attrs
          ? _value._attrs
          : attrs // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      ownerAccount: freezed == ownerAccount
          ? _value.ownerAccount
          : ownerAccount // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupImpl implements _Group {
  const _$GroupImpl(
      {@JsonKey(name: 'groupId') required this.groupId,
      @JsonKey(name: 'parent') required this.parent,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'owner') required this.owner,
      @JsonKey(name: 'attrs') required final Map<String, dynamic> attrs,
      @JsonKey(name: 'ownerAccount') this.ownerAccount})
      : _attrs = attrs;

  factory _$GroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupImplFromJson(json);

  @override
  @JsonKey(name: 'groupId')
  final String groupId;
  @override
  @JsonKey(name: 'parent')
  final String parent;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'owner')
  final String owner;
  final Map<String, dynamic> _attrs;
  @override
  @JsonKey(name: 'attrs')
  Map<String, dynamic> get attrs {
    if (_attrs is EqualUnmodifiableMapView) return _attrs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attrs);
  }

  @override
  @JsonKey(name: 'ownerAccount')
  final String? ownerAccount;

  @override
  String toString() {
    return 'Group(groupId: $groupId, parent: $parent, name: $name, owner: $owner, attrs: $attrs, ownerAccount: $ownerAccount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupImpl &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            const DeepCollectionEquality().equals(other._attrs, _attrs) &&
            (identical(other.ownerAccount, ownerAccount) ||
                other.ownerAccount == ownerAccount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, groupId, parent, name, owner,
      const DeepCollectionEquality().hash(_attrs), ownerAccount);

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupImplCopyWith<_$GroupImpl> get copyWith =>
      __$$GroupImplCopyWithImpl<_$GroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupImplToJson(
      this,
    );
  }
}

abstract class _Group implements Group {
  const factory _Group(
      {@JsonKey(name: 'groupId') required final String groupId,
      @JsonKey(name: 'parent') required final String parent,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'owner') required final String owner,
      @JsonKey(name: 'attrs') required final Map<String, dynamic> attrs,
      @JsonKey(name: 'ownerAccount') final String? ownerAccount}) = _$GroupImpl;

  factory _Group.fromJson(Map<String, dynamic> json) = _$GroupImpl.fromJson;

  @override
  @JsonKey(name: 'groupId')
  String get groupId;
  @override
  @JsonKey(name: 'parent')
  String get parent;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'owner')
  String get owner;
  @override
  @JsonKey(name: 'attrs')
  Map<String, dynamic> get attrs;
  @override
  @JsonKey(name: 'ownerAccount')
  String? get ownerAccount;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupImplCopyWith<_$GroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
