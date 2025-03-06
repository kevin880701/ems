// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'NodeConfigsResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NodeConfigsResponse {
  @JsonKey(name: 'result')
  int get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<NodeConfig> get data => throw _privateConstructorUsedError;

  /// Create a copy of NodeConfigsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NodeConfigsResponseCopyWith<NodeConfigsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NodeConfigsResponseCopyWith<$Res> {
  factory $NodeConfigsResponseCopyWith(
          NodeConfigsResponse value, $Res Function(NodeConfigsResponse) then) =
      _$NodeConfigsResponseCopyWithImpl<$Res, NodeConfigsResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'data') List<NodeConfig> data});
}

/// @nodoc
class _$NodeConfigsResponseCopyWithImpl<$Res, $Val extends NodeConfigsResponse>
    implements $NodeConfigsResponseCopyWith<$Res> {
  _$NodeConfigsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NodeConfigsResponse
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
              as List<NodeConfig>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NodeConfigsResponseImplCopyWith<$Res>
    implements $NodeConfigsResponseCopyWith<$Res> {
  factory _$$NodeConfigsResponseImplCopyWith(_$NodeConfigsResponseImpl value,
          $Res Function(_$NodeConfigsResponseImpl) then) =
      __$$NodeConfigsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'data') List<NodeConfig> data});
}

/// @nodoc
class __$$NodeConfigsResponseImplCopyWithImpl<$Res>
    extends _$NodeConfigsResponseCopyWithImpl<$Res, _$NodeConfigsResponseImpl>
    implements _$$NodeConfigsResponseImplCopyWith<$Res> {
  __$$NodeConfigsResponseImplCopyWithImpl(_$NodeConfigsResponseImpl _value,
      $Res Function(_$NodeConfigsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of NodeConfigsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? data = null,
  }) {
    return _then(_$NodeConfigsResponseImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NodeConfig>,
    ));
  }
}

/// @nodoc

class _$NodeConfigsResponseImpl implements _NodeConfigsResponse {
  const _$NodeConfigsResponseImpl(
      {@JsonKey(name: 'result') required this.result,
      @JsonKey(name: 'data') required final List<NodeConfig> data})
      : _data = data;

  @override
  @JsonKey(name: 'result')
  final int result;
  final List<NodeConfig> _data;
  @override
  @JsonKey(name: 'data')
  List<NodeConfig> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'NodeConfigsResponse(result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NodeConfigsResponseImpl &&
            (identical(other.result, result) || other.result == result) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, result, const DeepCollectionEquality().hash(_data));

  /// Create a copy of NodeConfigsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NodeConfigsResponseImplCopyWith<_$NodeConfigsResponseImpl> get copyWith =>
      __$$NodeConfigsResponseImplCopyWithImpl<_$NodeConfigsResponseImpl>(
          this, _$identity);
}

abstract class _NodeConfigsResponse implements NodeConfigsResponse {
  const factory _NodeConfigsResponse(
          {@JsonKey(name: 'result') required final int result,
          @JsonKey(name: 'data') required final List<NodeConfig> data}) =
      _$NodeConfigsResponseImpl;

  @override
  @JsonKey(name: 'result')
  int get result;
  @override
  @JsonKey(name: 'data')
  List<NodeConfig> get data;

  /// Create a copy of NodeConfigsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NodeConfigsResponseImplCopyWith<_$NodeConfigsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NodeConfig _$NodeConfigFromJson(Map<String, dynamic> json) {
  return _NodeConfig.fromJson(json);
}

/// @nodoc
mixin _$NodeConfig {
  @JsonKey(name: 'ruleType')
  String get ruleType => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'rule')
  String get rule => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  int get type => throw _privateConstructorUsedError;

  /// Serializes this NodeConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NodeConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NodeConfigCopyWith<NodeConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NodeConfigCopyWith<$Res> {
  factory $NodeConfigCopyWith(
          NodeConfig value, $Res Function(NodeConfig) then) =
      _$NodeConfigCopyWithImpl<$Res, NodeConfig>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ruleType') String ruleType,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'rule') String rule,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'type') int type});
}

/// @nodoc
class _$NodeConfigCopyWithImpl<$Res, $Val extends NodeConfig>
    implements $NodeConfigCopyWith<$Res> {
  _$NodeConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NodeConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ruleType = null,
    Object? name = null,
    Object? rule = null,
    Object? id = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      ruleType: null == ruleType
          ? _value.ruleType
          : ruleType // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rule: null == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NodeConfigImplCopyWith<$Res>
    implements $NodeConfigCopyWith<$Res> {
  factory _$$NodeConfigImplCopyWith(
          _$NodeConfigImpl value, $Res Function(_$NodeConfigImpl) then) =
      __$$NodeConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ruleType') String ruleType,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'rule') String rule,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'type') int type});
}

/// @nodoc
class __$$NodeConfigImplCopyWithImpl<$Res>
    extends _$NodeConfigCopyWithImpl<$Res, _$NodeConfigImpl>
    implements _$$NodeConfigImplCopyWith<$Res> {
  __$$NodeConfigImplCopyWithImpl(
      _$NodeConfigImpl _value, $Res Function(_$NodeConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of NodeConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ruleType = null,
    Object? name = null,
    Object? rule = null,
    Object? id = null,
    Object? type = null,
  }) {
    return _then(_$NodeConfigImpl(
      ruleType: null == ruleType
          ? _value.ruleType
          : ruleType // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rule: null == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NodeConfigImpl implements _NodeConfig {
  const _$NodeConfigImpl(
      {@JsonKey(name: 'ruleType') required this.ruleType,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'rule') required this.rule,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'type') required this.type});

  factory _$NodeConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$NodeConfigImplFromJson(json);

  @override
  @JsonKey(name: 'ruleType')
  final String ruleType;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'rule')
  final String rule;
  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'type')
  final int type;

  @override
  String toString() {
    return 'NodeConfig(ruleType: $ruleType, name: $name, rule: $rule, id: $id, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NodeConfigImpl &&
            (identical(other.ruleType, ruleType) ||
                other.ruleType == ruleType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rule, rule) || other.rule == rule) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ruleType, name, rule, id, type);

  /// Create a copy of NodeConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NodeConfigImplCopyWith<_$NodeConfigImpl> get copyWith =>
      __$$NodeConfigImplCopyWithImpl<_$NodeConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NodeConfigImplToJson(
      this,
    );
  }
}

abstract class _NodeConfig implements NodeConfig {
  const factory _NodeConfig(
      {@JsonKey(name: 'ruleType') required final String ruleType,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'rule') required final String rule,
      @JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'type') required final int type}) = _$NodeConfigImpl;

  factory _NodeConfig.fromJson(Map<String, dynamic> json) =
      _$NodeConfigImpl.fromJson;

  @override
  @JsonKey(name: 'ruleType')
  String get ruleType;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'rule')
  String get rule;
  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'type')
  int get type;

  /// Create a copy of NodeConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NodeConfigImplCopyWith<_$NodeConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
