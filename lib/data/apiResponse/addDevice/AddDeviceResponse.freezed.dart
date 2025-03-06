// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AddDeviceResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddDeviceResponse _$AddDeviceResponseFromJson(Map<String, dynamic> json) {
  return _AddDeviceResponse.fromJson(json);
}

/// @nodoc
mixin _$AddDeviceResponse {
  @JsonKey(name: 'result')
  int get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  AddDeviceData get data => throw _privateConstructorUsedError;

  /// Serializes this AddDeviceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddDeviceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddDeviceResponseCopyWith<AddDeviceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddDeviceResponseCopyWith<$Res> {
  factory $AddDeviceResponseCopyWith(
          AddDeviceResponse value, $Res Function(AddDeviceResponse) then) =
      _$AddDeviceResponseCopyWithImpl<$Res, AddDeviceResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'data') AddDeviceData data});

  $AddDeviceDataCopyWith<$Res> get data;
}

/// @nodoc
class _$AddDeviceResponseCopyWithImpl<$Res, $Val extends AddDeviceResponse>
    implements $AddDeviceResponseCopyWith<$Res> {
  _$AddDeviceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddDeviceResponse
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
              as AddDeviceData,
    ) as $Val);
  }

  /// Create a copy of AddDeviceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddDeviceDataCopyWith<$Res> get data {
    return $AddDeviceDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddDeviceResponseImplCopyWith<$Res>
    implements $AddDeviceResponseCopyWith<$Res> {
  factory _$$AddDeviceResponseImplCopyWith(_$AddDeviceResponseImpl value,
          $Res Function(_$AddDeviceResponseImpl) then) =
      __$$AddDeviceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'data') AddDeviceData data});

  @override
  $AddDeviceDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$AddDeviceResponseImplCopyWithImpl<$Res>
    extends _$AddDeviceResponseCopyWithImpl<$Res, _$AddDeviceResponseImpl>
    implements _$$AddDeviceResponseImplCopyWith<$Res> {
  __$$AddDeviceResponseImplCopyWithImpl(_$AddDeviceResponseImpl _value,
      $Res Function(_$AddDeviceResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddDeviceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? data = null,
  }) {
    return _then(_$AddDeviceResponseImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AddDeviceData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddDeviceResponseImpl implements _AddDeviceResponse {
  const _$AddDeviceResponseImpl(
      {@JsonKey(name: 'result') required this.result,
      @JsonKey(name: 'data') required this.data});

  factory _$AddDeviceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddDeviceResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result')
  final int result;
  @override
  @JsonKey(name: 'data')
  final AddDeviceData data;

  @override
  String toString() {
    return 'AddDeviceResponse(result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddDeviceResponseImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result, data);

  /// Create a copy of AddDeviceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddDeviceResponseImplCopyWith<_$AddDeviceResponseImpl> get copyWith =>
      __$$AddDeviceResponseImplCopyWithImpl<_$AddDeviceResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddDeviceResponseImplToJson(
      this,
    );
  }
}

abstract class _AddDeviceResponse implements AddDeviceResponse {
  const factory _AddDeviceResponse(
          {@JsonKey(name: 'result') required final int result,
          @JsonKey(name: 'data') required final AddDeviceData data}) =
      _$AddDeviceResponseImpl;

  factory _AddDeviceResponse.fromJson(Map<String, dynamic> json) =
      _$AddDeviceResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result')
  int get result;
  @override
  @JsonKey(name: 'data')
  AddDeviceData get data;

  /// Create a copy of AddDeviceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddDeviceResponseImplCopyWith<_$AddDeviceResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddDeviceData _$AddDeviceDataFromJson(Map<String, dynamic> json) {
  return _AddDeviceData.fromJson(json);
}

/// @nodoc
mixin _$AddDeviceData {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'deviceid')
  String get deviceid => throw _privateConstructorUsedError;

  /// Serializes this AddDeviceData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddDeviceData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddDeviceDataCopyWith<AddDeviceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddDeviceDataCopyWith<$Res> {
  factory $AddDeviceDataCopyWith(
          AddDeviceData value, $Res Function(AddDeviceData) then) =
      _$AddDeviceDataCopyWithImpl<$Res, AddDeviceData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'deviceid') String deviceid});
}

/// @nodoc
class _$AddDeviceDataCopyWithImpl<$Res, $Val extends AddDeviceData>
    implements $AddDeviceDataCopyWith<$Res> {
  _$AddDeviceDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddDeviceData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deviceid = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deviceid: null == deviceid
          ? _value.deviceid
          : deviceid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddDeviceDataImplCopyWith<$Res>
    implements $AddDeviceDataCopyWith<$Res> {
  factory _$$AddDeviceDataImplCopyWith(
          _$AddDeviceDataImpl value, $Res Function(_$AddDeviceDataImpl) then) =
      __$$AddDeviceDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'deviceid') String deviceid});
}

/// @nodoc
class __$$AddDeviceDataImplCopyWithImpl<$Res>
    extends _$AddDeviceDataCopyWithImpl<$Res, _$AddDeviceDataImpl>
    implements _$$AddDeviceDataImplCopyWith<$Res> {
  __$$AddDeviceDataImplCopyWithImpl(
      _$AddDeviceDataImpl _value, $Res Function(_$AddDeviceDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddDeviceData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deviceid = null,
  }) {
    return _then(_$AddDeviceDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deviceid: null == deviceid
          ? _value.deviceid
          : deviceid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddDeviceDataImpl implements _AddDeviceData {
  const _$AddDeviceDataImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'deviceid') required this.deviceid});

  factory _$AddDeviceDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddDeviceDataImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'deviceid')
  final String deviceid;

  @override
  String toString() {
    return 'AddDeviceData(id: $id, deviceid: $deviceid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddDeviceDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deviceid, deviceid) ||
                other.deviceid == deviceid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, deviceid);

  /// Create a copy of AddDeviceData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddDeviceDataImplCopyWith<_$AddDeviceDataImpl> get copyWith =>
      __$$AddDeviceDataImplCopyWithImpl<_$AddDeviceDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddDeviceDataImplToJson(
      this,
    );
  }
}

abstract class _AddDeviceData implements AddDeviceData {
  const factory _AddDeviceData(
          {@JsonKey(name: 'id') required final String id,
          @JsonKey(name: 'deviceid') required final String deviceid}) =
      _$AddDeviceDataImpl;

  factory _AddDeviceData.fromJson(Map<String, dynamic> json) =
      _$AddDeviceDataImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'deviceid')
  String get deviceid;

  /// Create a copy of AddDeviceData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddDeviceDataImplCopyWith<_$AddDeviceDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
