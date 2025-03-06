// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AppleCheckResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppleCheckResponse _$AppleCheckResponseFromJson(Map<String, dynamic> json) {
  return _AppleCheckResponse.fromJson(json);
}

/// @nodoc
mixin _$AppleCheckResponse {
  @JsonKey(name: 'result')
  int get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  bool get data => throw _privateConstructorUsedError;

  /// Serializes this AppleCheckResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppleCheckResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppleCheckResponseCopyWith<AppleCheckResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppleCheckResponseCopyWith<$Res> {
  factory $AppleCheckResponseCopyWith(
          AppleCheckResponse value, $Res Function(AppleCheckResponse) then) =
      _$AppleCheckResponseCopyWithImpl<$Res, AppleCheckResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result, @JsonKey(name: 'data') bool data});
}

/// @nodoc
class _$AppleCheckResponseCopyWithImpl<$Res, $Val extends AppleCheckResponse>
    implements $AppleCheckResponseCopyWith<$Res> {
  _$AppleCheckResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppleCheckResponse
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
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppleCheckResponseImplCopyWith<$Res>
    implements $AppleCheckResponseCopyWith<$Res> {
  factory _$$AppleCheckResponseImplCopyWith(_$AppleCheckResponseImpl value,
          $Res Function(_$AppleCheckResponseImpl) then) =
      __$$AppleCheckResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result, @JsonKey(name: 'data') bool data});
}

/// @nodoc
class __$$AppleCheckResponseImplCopyWithImpl<$Res>
    extends _$AppleCheckResponseCopyWithImpl<$Res, _$AppleCheckResponseImpl>
    implements _$$AppleCheckResponseImplCopyWith<$Res> {
  __$$AppleCheckResponseImplCopyWithImpl(_$AppleCheckResponseImpl _value,
      $Res Function(_$AppleCheckResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppleCheckResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? data = null,
  }) {
    return _then(_$AppleCheckResponseImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppleCheckResponseImpl implements _AppleCheckResponse {
  const _$AppleCheckResponseImpl(
      {@JsonKey(name: 'result') required this.result,
      @JsonKey(name: 'data') required this.data});

  factory _$AppleCheckResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppleCheckResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result')
  final int result;
  @override
  @JsonKey(name: 'data')
  final bool data;

  @override
  String toString() {
    return 'AppleCheckResponse(result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppleCheckResponseImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result, data);

  /// Create a copy of AppleCheckResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppleCheckResponseImplCopyWith<_$AppleCheckResponseImpl> get copyWith =>
      __$$AppleCheckResponseImplCopyWithImpl<_$AppleCheckResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppleCheckResponseImplToJson(
      this,
    );
  }
}

abstract class _AppleCheckResponse implements AppleCheckResponse {
  const factory _AppleCheckResponse(
          {@JsonKey(name: 'result') required final int result,
          @JsonKey(name: 'data') required final bool data}) =
      _$AppleCheckResponseImpl;

  factory _AppleCheckResponse.fromJson(Map<String, dynamic> json) =
      _$AppleCheckResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result')
  int get result;
  @override
  @JsonKey(name: 'data')
  bool get data;

  /// Create a copy of AppleCheckResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppleCheckResponseImplCopyWith<_$AppleCheckResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
