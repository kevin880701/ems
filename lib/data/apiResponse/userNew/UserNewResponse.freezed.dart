// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'UserNewResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserNewResponse _$UserNewResponseFromJson(Map<String, dynamic> json) {
  return _UserNewResponse.fromJson(json);
}

/// @nodoc
mixin _$UserNewResponse {
  @JsonKey(name: 'result')
  int get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  dynamic get data => throw _privateConstructorUsedError;

  /// Serializes this UserNewResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserNewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserNewResponseCopyWith<UserNewResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserNewResponseCopyWith<$Res> {
  factory $UserNewResponseCopyWith(
          UserNewResponse value, $Res Function(UserNewResponse) then) =
      _$UserNewResponseCopyWithImpl<$Res, UserNewResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'data') dynamic data});
}

/// @nodoc
class _$UserNewResponseCopyWithImpl<$Res, $Val extends UserNewResponse>
    implements $UserNewResponseCopyWith<$Res> {
  _$UserNewResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserNewResponse
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
abstract class _$$UserNewResponseImplCopyWith<$Res>
    implements $UserNewResponseCopyWith<$Res> {
  factory _$$UserNewResponseImplCopyWith(_$UserNewResponseImpl value,
          $Res Function(_$UserNewResponseImpl) then) =
      __$$UserNewResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'data') dynamic data});
}

/// @nodoc
class __$$UserNewResponseImplCopyWithImpl<$Res>
    extends _$UserNewResponseCopyWithImpl<$Res, _$UserNewResponseImpl>
    implements _$$UserNewResponseImplCopyWith<$Res> {
  __$$UserNewResponseImplCopyWithImpl(
      _$UserNewResponseImpl _value, $Res Function(_$UserNewResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserNewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? data = freezed,
  }) {
    return _then(_$UserNewResponseImpl(
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
class _$UserNewResponseImpl implements _UserNewResponse {
  const _$UserNewResponseImpl(
      {@JsonKey(name: 'result') required this.result,
      @JsonKey(name: 'data') required this.data});

  factory _$UserNewResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserNewResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result')
  final int result;
  @override
  @JsonKey(name: 'data')
  final dynamic data;

  @override
  String toString() {
    return 'UserNewResponse(result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserNewResponseImpl &&
            (identical(other.result, result) || other.result == result) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, result, const DeepCollectionEquality().hash(data));

  /// Create a copy of UserNewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserNewResponseImplCopyWith<_$UserNewResponseImpl> get copyWith =>
      __$$UserNewResponseImplCopyWithImpl<_$UserNewResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserNewResponseImplToJson(
      this,
    );
  }
}

abstract class _UserNewResponse implements UserNewResponse {
  const factory _UserNewResponse(
          {@JsonKey(name: 'result') required final int result,
          @JsonKey(name: 'data') required final dynamic data}) =
      _$UserNewResponseImpl;

  factory _UserNewResponse.fromJson(Map<String, dynamic> json) =
      _$UserNewResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result')
  int get result;
  @override
  @JsonKey(name: 'data')
  dynamic get data;

  /// Create a copy of UserNewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserNewResponseImplCopyWith<_$UserNewResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
