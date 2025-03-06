// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SetGroupResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SetGroupResponse _$SetGroupResponseFromJson(Map<String, dynamic> json) {
  return _SetGroupResponse.fromJson(json);
}

/// @nodoc
mixin _$SetGroupResponse {
  @JsonKey(name: 'result')
  int get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  dynamic get data => throw _privateConstructorUsedError;

  /// Serializes this SetGroupResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SetGroupResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SetGroupResponseCopyWith<SetGroupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetGroupResponseCopyWith<$Res> {
  factory $SetGroupResponseCopyWith(
          SetGroupResponse value, $Res Function(SetGroupResponse) then) =
      _$SetGroupResponseCopyWithImpl<$Res, SetGroupResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'data') dynamic data});
}

/// @nodoc
class _$SetGroupResponseCopyWithImpl<$Res, $Val extends SetGroupResponse>
    implements $SetGroupResponseCopyWith<$Res> {
  _$SetGroupResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SetGroupResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetGroupResponseImplCopyWith<$Res>
    implements $SetGroupResponseCopyWith<$Res> {
  factory _$$SetGroupResponseImplCopyWith(_$SetGroupResponseImpl value,
          $Res Function(_$SetGroupResponseImpl) then) =
      __$$SetGroupResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'data') dynamic data});
}

/// @nodoc
class __$$SetGroupResponseImplCopyWithImpl<$Res>
    extends _$SetGroupResponseCopyWithImpl<$Res, _$SetGroupResponseImpl>
    implements _$$SetGroupResponseImplCopyWith<$Res> {
  __$$SetGroupResponseImplCopyWithImpl(_$SetGroupResponseImpl _value,
      $Res Function(_$SetGroupResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SetGroupResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? data = freezed,
  }) {
    return _then(_$SetGroupResponseImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetGroupResponseImpl implements _SetGroupResponse {
  const _$SetGroupResponseImpl(
      {@JsonKey(name: 'result') required this.result,
      @JsonKey(name: 'data') required this.data});

  factory _$SetGroupResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetGroupResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result')
  final int result;
  @override
  @JsonKey(name: 'data')
  final dynamic data;

  @override
  String toString() {
    return 'SetGroupResponse(result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetGroupResponseImpl &&
            (identical(other.result, result) || other.result == result) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, result, const DeepCollectionEquality().hash(data));

  /// Create a copy of SetGroupResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetGroupResponseImplCopyWith<_$SetGroupResponseImpl> get copyWith =>
      __$$SetGroupResponseImplCopyWithImpl<_$SetGroupResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetGroupResponseImplToJson(
      this,
    );
  }
}

abstract class _SetGroupResponse implements SetGroupResponse {
  const factory _SetGroupResponse(
          {@JsonKey(name: 'result') required final int result,
          @JsonKey(name: 'data') required final dynamic data}) =
      _$SetGroupResponseImpl;

  factory _SetGroupResponse.fromJson(Map<String, dynamic> json) =
      _$SetGroupResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result')
  int get result;
  @override
  @JsonKey(name: 'data')
  dynamic get data;

  /// Create a copy of SetGroupResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetGroupResponseImplCopyWith<_$SetGroupResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
