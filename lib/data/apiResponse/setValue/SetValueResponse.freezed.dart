// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SetValueResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SetValueResponse _$SetValueResponseFromJson(Map<String, dynamic> json) {
  return _SetValueResponse.fromJson(json);
}

/// @nodoc
mixin _$SetValueResponse {
  @JsonKey(name: 'result')
  int get result => throw _privateConstructorUsedError;

  /// Serializes this SetValueResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SetValueResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SetValueResponseCopyWith<SetValueResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetValueResponseCopyWith<$Res> {
  factory $SetValueResponseCopyWith(
          SetValueResponse value, $Res Function(SetValueResponse) then) =
      _$SetValueResponseCopyWithImpl<$Res, SetValueResponse>;
  @useResult
  $Res call({@JsonKey(name: 'result') int result});
}

/// @nodoc
class _$SetValueResponseCopyWithImpl<$Res, $Val extends SetValueResponse>
    implements $SetValueResponseCopyWith<$Res> {
  _$SetValueResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SetValueResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetValueResponseImplCopyWith<$Res>
    implements $SetValueResponseCopyWith<$Res> {
  factory _$$SetValueResponseImplCopyWith(_$SetValueResponseImpl value,
          $Res Function(_$SetValueResponseImpl) then) =
      __$$SetValueResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'result') int result});
}

/// @nodoc
class __$$SetValueResponseImplCopyWithImpl<$Res>
    extends _$SetValueResponseCopyWithImpl<$Res, _$SetValueResponseImpl>
    implements _$$SetValueResponseImplCopyWith<$Res> {
  __$$SetValueResponseImplCopyWithImpl(_$SetValueResponseImpl _value,
      $Res Function(_$SetValueResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SetValueResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$SetValueResponseImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetValueResponseImpl implements _SetValueResponse {
  const _$SetValueResponseImpl({@JsonKey(name: 'result') required this.result});

  factory _$SetValueResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetValueResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result')
  final int result;

  @override
  String toString() {
    return 'SetValueResponse(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetValueResponseImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of SetValueResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetValueResponseImplCopyWith<_$SetValueResponseImpl> get copyWith =>
      __$$SetValueResponseImplCopyWithImpl<_$SetValueResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetValueResponseImplToJson(
      this,
    );
  }
}

abstract class _SetValueResponse implements SetValueResponse {
  const factory _SetValueResponse(
          {@JsonKey(name: 'result') required final int result}) =
      _$SetValueResponseImpl;

  factory _SetValueResponse.fromJson(Map<String, dynamic> json) =
      _$SetValueResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result')
  int get result;

  /// Create a copy of SetValueResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetValueResponseImplCopyWith<_$SetValueResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
