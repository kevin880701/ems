// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AddDevNodeResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddDevNodeResponse _$AddDevNodeResponseFromJson(Map<String, dynamic> json) {
  return _AddDevNodeResponse.fromJson(json);
}

/// @nodoc
mixin _$AddDevNodeResponse {
  @JsonKey(name: 'result')
  int get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  AddDevNodeData get data => throw _privateConstructorUsedError;

  /// Serializes this AddDevNodeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddDevNodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddDevNodeResponseCopyWith<AddDevNodeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddDevNodeResponseCopyWith<$Res> {
  factory $AddDevNodeResponseCopyWith(
          AddDevNodeResponse value, $Res Function(AddDevNodeResponse) then) =
      _$AddDevNodeResponseCopyWithImpl<$Res, AddDevNodeResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'data') AddDevNodeData data});

  $AddDevNodeDataCopyWith<$Res> get data;
}

/// @nodoc
class _$AddDevNodeResponseCopyWithImpl<$Res, $Val extends AddDevNodeResponse>
    implements $AddDevNodeResponseCopyWith<$Res> {
  _$AddDevNodeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddDevNodeResponse
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
              as AddDevNodeData,
    ) as $Val);
  }

  /// Create a copy of AddDevNodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddDevNodeDataCopyWith<$Res> get data {
    return $AddDevNodeDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddDevNodeResponseImplCopyWith<$Res>
    implements $AddDevNodeResponseCopyWith<$Res> {
  factory _$$AddDevNodeResponseImplCopyWith(_$AddDevNodeResponseImpl value,
          $Res Function(_$AddDevNodeResponseImpl) then) =
      __$$AddDevNodeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'data') AddDevNodeData data});

  @override
  $AddDevNodeDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$AddDevNodeResponseImplCopyWithImpl<$Res>
    extends _$AddDevNodeResponseCopyWithImpl<$Res, _$AddDevNodeResponseImpl>
    implements _$$AddDevNodeResponseImplCopyWith<$Res> {
  __$$AddDevNodeResponseImplCopyWithImpl(_$AddDevNodeResponseImpl _value,
      $Res Function(_$AddDevNodeResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddDevNodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? data = null,
  }) {
    return _then(_$AddDevNodeResponseImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AddDevNodeData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddDevNodeResponseImpl implements _AddDevNodeResponse {
  const _$AddDevNodeResponseImpl(
      {@JsonKey(name: 'result') required this.result,
      @JsonKey(name: 'data') required this.data});

  factory _$AddDevNodeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddDevNodeResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result')
  final int result;
  @override
  @JsonKey(name: 'data')
  final AddDevNodeData data;

  @override
  String toString() {
    return 'AddDevNodeResponse(result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddDevNodeResponseImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result, data);

  /// Create a copy of AddDevNodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddDevNodeResponseImplCopyWith<_$AddDevNodeResponseImpl> get copyWith =>
      __$$AddDevNodeResponseImplCopyWithImpl<_$AddDevNodeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddDevNodeResponseImplToJson(
      this,
    );
  }
}

abstract class _AddDevNodeResponse implements AddDevNodeResponse {
  const factory _AddDevNodeResponse(
          {@JsonKey(name: 'result') required final int result,
          @JsonKey(name: 'data') required final AddDevNodeData data}) =
      _$AddDevNodeResponseImpl;

  factory _AddDevNodeResponse.fromJson(Map<String, dynamic> json) =
      _$AddDevNodeResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result')
  int get result;
  @override
  @JsonKey(name: 'data')
  AddDevNodeData get data;

  /// Create a copy of AddDevNodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddDevNodeResponseImplCopyWith<_$AddDevNodeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddDevNodeData _$AddDevNodeDataFromJson(Map<String, dynamic> json) {
  return _AddDevNodeData.fromJson(json);
}

/// @nodoc
mixin _$AddDevNodeData {
  @JsonKey(name: 'devid')
  String get devId => throw _privateConstructorUsedError;

  /// Serializes this AddDevNodeData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddDevNodeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddDevNodeDataCopyWith<AddDevNodeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddDevNodeDataCopyWith<$Res> {
  factory $AddDevNodeDataCopyWith(
          AddDevNodeData value, $Res Function(AddDevNodeData) then) =
      _$AddDevNodeDataCopyWithImpl<$Res, AddDevNodeData>;
  @useResult
  $Res call({@JsonKey(name: 'devid') String devId});
}

/// @nodoc
class _$AddDevNodeDataCopyWithImpl<$Res, $Val extends AddDevNodeData>
    implements $AddDevNodeDataCopyWith<$Res> {
  _$AddDevNodeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddDevNodeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devId = null,
  }) {
    return _then(_value.copyWith(
      devId: null == devId
          ? _value.devId
          : devId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddDevNodeDataImplCopyWith<$Res>
    implements $AddDevNodeDataCopyWith<$Res> {
  factory _$$AddDevNodeDataImplCopyWith(_$AddDevNodeDataImpl value,
          $Res Function(_$AddDevNodeDataImpl) then) =
      __$$AddDevNodeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'devid') String devId});
}

/// @nodoc
class __$$AddDevNodeDataImplCopyWithImpl<$Res>
    extends _$AddDevNodeDataCopyWithImpl<$Res, _$AddDevNodeDataImpl>
    implements _$$AddDevNodeDataImplCopyWith<$Res> {
  __$$AddDevNodeDataImplCopyWithImpl(
      _$AddDevNodeDataImpl _value, $Res Function(_$AddDevNodeDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddDevNodeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devId = null,
  }) {
    return _then(_$AddDevNodeDataImpl(
      devId: null == devId
          ? _value.devId
          : devId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddDevNodeDataImpl implements _AddDevNodeData {
  const _$AddDevNodeDataImpl({@JsonKey(name: 'devid') required this.devId});

  factory _$AddDevNodeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddDevNodeDataImplFromJson(json);

  @override
  @JsonKey(name: 'devid')
  final String devId;

  @override
  String toString() {
    return 'AddDevNodeData(devId: $devId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddDevNodeDataImpl &&
            (identical(other.devId, devId) || other.devId == devId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, devId);

  /// Create a copy of AddDevNodeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddDevNodeDataImplCopyWith<_$AddDevNodeDataImpl> get copyWith =>
      __$$AddDevNodeDataImplCopyWithImpl<_$AddDevNodeDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddDevNodeDataImplToJson(
      this,
    );
  }
}

abstract class _AddDevNodeData implements AddDevNodeData {
  const factory _AddDevNodeData(
          {@JsonKey(name: 'devid') required final String devId}) =
      _$AddDevNodeDataImpl;

  factory _AddDevNodeData.fromJson(Map<String, dynamic> json) =
      _$AddDevNodeDataImpl.fromJson;

  @override
  @JsonKey(name: 'devid')
  String get devId;

  /// Create a copy of AddDevNodeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddDevNodeDataImplCopyWith<_$AddDevNodeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
