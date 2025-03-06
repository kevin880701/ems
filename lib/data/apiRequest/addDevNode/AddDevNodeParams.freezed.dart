// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AddDevNodeParams.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddDevNodeParams _$AddDevNodeParamsFromJson(Map<String, dynamic> json) {
  return _AddDevNodeParams.fromJson(json);
}

/// @nodoc
mixin _$AddDevNodeParams {
  @JsonKey(name: 'devid')
  String get devid => throw _privateConstructorUsedError;
  @JsonKey(name: 'nodes')
  List<NodeConfig> get nodes => throw _privateConstructorUsedError;

  /// Serializes this AddDevNodeParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddDevNodeParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddDevNodeParamsCopyWith<AddDevNodeParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddDevNodeParamsCopyWith<$Res> {
  factory $AddDevNodeParamsCopyWith(
          AddDevNodeParams value, $Res Function(AddDevNodeParams) then) =
      _$AddDevNodeParamsCopyWithImpl<$Res, AddDevNodeParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'devid') String devid,
      @JsonKey(name: 'nodes') List<NodeConfig> nodes});
}

/// @nodoc
class _$AddDevNodeParamsCopyWithImpl<$Res, $Val extends AddDevNodeParams>
    implements $AddDevNodeParamsCopyWith<$Res> {
  _$AddDevNodeParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddDevNodeParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devid = null,
    Object? nodes = null,
  }) {
    return _then(_value.copyWith(
      devid: null == devid
          ? _value.devid
          : devid // ignore: cast_nullable_to_non_nullable
              as String,
      nodes: null == nodes
          ? _value.nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<NodeConfig>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddDevNodeParamsImplCopyWith<$Res>
    implements $AddDevNodeParamsCopyWith<$Res> {
  factory _$$AddDevNodeParamsImplCopyWith(_$AddDevNodeParamsImpl value,
          $Res Function(_$AddDevNodeParamsImpl) then) =
      __$$AddDevNodeParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'devid') String devid,
      @JsonKey(name: 'nodes') List<NodeConfig> nodes});
}

/// @nodoc
class __$$AddDevNodeParamsImplCopyWithImpl<$Res>
    extends _$AddDevNodeParamsCopyWithImpl<$Res, _$AddDevNodeParamsImpl>
    implements _$$AddDevNodeParamsImplCopyWith<$Res> {
  __$$AddDevNodeParamsImplCopyWithImpl(_$AddDevNodeParamsImpl _value,
      $Res Function(_$AddDevNodeParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddDevNodeParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devid = null,
    Object? nodes = null,
  }) {
    return _then(_$AddDevNodeParamsImpl(
      devid: null == devid
          ? _value.devid
          : devid // ignore: cast_nullable_to_non_nullable
              as String,
      nodes: null == nodes
          ? _value._nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<NodeConfig>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddDevNodeParamsImpl implements _AddDevNodeParams {
  const _$AddDevNodeParamsImpl(
      {@JsonKey(name: 'devid') required this.devid,
      @JsonKey(name: 'nodes') required final List<NodeConfig> nodes})
      : _nodes = nodes;

  factory _$AddDevNodeParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddDevNodeParamsImplFromJson(json);

  @override
  @JsonKey(name: 'devid')
  final String devid;
  final List<NodeConfig> _nodes;
  @override
  @JsonKey(name: 'nodes')
  List<NodeConfig> get nodes {
    if (_nodes is EqualUnmodifiableListView) return _nodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nodes);
  }

  @override
  String toString() {
    return 'AddDevNodeParams(devid: $devid, nodes: $nodes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddDevNodeParamsImpl &&
            (identical(other.devid, devid) || other.devid == devid) &&
            const DeepCollectionEquality().equals(other._nodes, _nodes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, devid, const DeepCollectionEquality().hash(_nodes));

  /// Create a copy of AddDevNodeParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddDevNodeParamsImplCopyWith<_$AddDevNodeParamsImpl> get copyWith =>
      __$$AddDevNodeParamsImplCopyWithImpl<_$AddDevNodeParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddDevNodeParamsImplToJson(
      this,
    );
  }
}

abstract class _AddDevNodeParams implements AddDevNodeParams {
  const factory _AddDevNodeParams(
          {@JsonKey(name: 'devid') required final String devid,
          @JsonKey(name: 'nodes') required final List<NodeConfig> nodes}) =
      _$AddDevNodeParamsImpl;

  factory _AddDevNodeParams.fromJson(Map<String, dynamic> json) =
      _$AddDevNodeParamsImpl.fromJson;

  @override
  @JsonKey(name: 'devid')
  String get devid;
  @override
  @JsonKey(name: 'nodes')
  List<NodeConfig> get nodes;

  /// Create a copy of AddDevNodeParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddDevNodeParamsImplCopyWith<_$AddDevNodeParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
