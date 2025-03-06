// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SetUserResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SetUserResponse _$SetUserResponseFromJson(Map<String, dynamic> json) {
  return _SetUserResponse.fromJson(json);
}

/// @nodoc
mixin _$SetUserResponse {
  @JsonKey(name: 'result')
  int get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  dynamic get data => throw _privateConstructorUsedError;

  /// Serializes this SetUserResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SetUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SetUserResponseCopyWith<SetUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetUserResponseCopyWith<$Res> {
  factory $SetUserResponseCopyWith(
          SetUserResponse value, $Res Function(SetUserResponse) then) =
      _$SetUserResponseCopyWithImpl<$Res, SetUserResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'data') dynamic data});
}

/// @nodoc
class _$SetUserResponseCopyWithImpl<$Res, $Val extends SetUserResponse>
    implements $SetUserResponseCopyWith<$Res> {
  _$SetUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SetUserResponse
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
abstract class _$$SetUserResponseImplCopyWith<$Res>
    implements $SetUserResponseCopyWith<$Res> {
  factory _$$SetUserResponseImplCopyWith(_$SetUserResponseImpl value,
          $Res Function(_$SetUserResponseImpl) then) =
      __$$SetUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'data') dynamic data});
}

/// @nodoc
class __$$SetUserResponseImplCopyWithImpl<$Res>
    extends _$SetUserResponseCopyWithImpl<$Res, _$SetUserResponseImpl>
    implements _$$SetUserResponseImplCopyWith<$Res> {
  __$$SetUserResponseImplCopyWithImpl(
      _$SetUserResponseImpl _value, $Res Function(_$SetUserResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SetUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? data = freezed,
  }) {
    return _then(_$SetUserResponseImpl(
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
class _$SetUserResponseImpl implements _SetUserResponse {
  const _$SetUserResponseImpl(
      {@JsonKey(name: 'result') required this.result,
      @JsonKey(name: 'data') required this.data});

  factory _$SetUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetUserResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result')
  final int result;
  @override
  @JsonKey(name: 'data')
  final dynamic data;

  @override
  String toString() {
    return 'SetUserResponse(result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetUserResponseImpl &&
            (identical(other.result, result) || other.result == result) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, result, const DeepCollectionEquality().hash(data));

  /// Create a copy of SetUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetUserResponseImplCopyWith<_$SetUserResponseImpl> get copyWith =>
      __$$SetUserResponseImplCopyWithImpl<_$SetUserResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetUserResponseImplToJson(
      this,
    );
  }
}

abstract class _SetUserResponse implements SetUserResponse {
  const factory _SetUserResponse(
          {@JsonKey(name: 'result') required final int result,
          @JsonKey(name: 'data') required final dynamic data}) =
      _$SetUserResponseImpl;

  factory _SetUserResponse.fromJson(Map<String, dynamic> json) =
      _$SetUserResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result')
  int get result;
  @override
  @JsonKey(name: 'data')
  dynamic get data;

  /// Create a copy of SetUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetUserResponseImplCopyWith<_$SetUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
