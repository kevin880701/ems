// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'GoogleCheckResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GoogleCheckResponse _$GoogleCheckResponseFromJson(Map<String, dynamic> json) {
  return _GoogleCheckResponse.fromJson(json);
}

/// @nodoc
mixin _$GoogleCheckResponse {
  @JsonKey(name: 'result')
  int get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  bool get data => throw _privateConstructorUsedError;

  /// Serializes this GoogleCheckResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoogleCheckResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoogleCheckResponseCopyWith<GoogleCheckResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleCheckResponseCopyWith<$Res> {
  factory $GoogleCheckResponseCopyWith(
          GoogleCheckResponse value, $Res Function(GoogleCheckResponse) then) =
      _$GoogleCheckResponseCopyWithImpl<$Res, GoogleCheckResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result, @JsonKey(name: 'data') bool data});
}

/// @nodoc
class _$GoogleCheckResponseCopyWithImpl<$Res, $Val extends GoogleCheckResponse>
    implements $GoogleCheckResponseCopyWith<$Res> {
  _$GoogleCheckResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoogleCheckResponse
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
abstract class _$$GoogleCheckResponseImplCopyWith<$Res>
    implements $GoogleCheckResponseCopyWith<$Res> {
  factory _$$GoogleCheckResponseImplCopyWith(_$GoogleCheckResponseImpl value,
          $Res Function(_$GoogleCheckResponseImpl) then) =
      __$$GoogleCheckResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result, @JsonKey(name: 'data') bool data});
}

/// @nodoc
class __$$GoogleCheckResponseImplCopyWithImpl<$Res>
    extends _$GoogleCheckResponseCopyWithImpl<$Res, _$GoogleCheckResponseImpl>
    implements _$$GoogleCheckResponseImplCopyWith<$Res> {
  __$$GoogleCheckResponseImplCopyWithImpl(_$GoogleCheckResponseImpl _value,
      $Res Function(_$GoogleCheckResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoogleCheckResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? data = null,
  }) {
    return _then(_$GoogleCheckResponseImpl(
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
class _$GoogleCheckResponseImpl implements _GoogleCheckResponse {
  const _$GoogleCheckResponseImpl(
      {@JsonKey(name: 'result') required this.result,
      @JsonKey(name: 'data') required this.data});

  factory _$GoogleCheckResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoogleCheckResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result')
  final int result;
  @override
  @JsonKey(name: 'data')
  final bool data;

  @override
  String toString() {
    return 'GoogleCheckResponse(result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleCheckResponseImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result, data);

  /// Create a copy of GoogleCheckResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleCheckResponseImplCopyWith<_$GoogleCheckResponseImpl> get copyWith =>
      __$$GoogleCheckResponseImplCopyWithImpl<_$GoogleCheckResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoogleCheckResponseImplToJson(
      this,
    );
  }
}

abstract class _GoogleCheckResponse implements GoogleCheckResponse {
  const factory _GoogleCheckResponse(
          {@JsonKey(name: 'result') required final int result,
          @JsonKey(name: 'data') required final bool data}) =
      _$GoogleCheckResponseImpl;

  factory _GoogleCheckResponse.fromJson(Map<String, dynamic> json) =
      _$GoogleCheckResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result')
  int get result;
  @override
  @JsonKey(name: 'data')
  bool get data;

  /// Create a copy of GoogleCheckResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoogleCheckResponseImplCopyWith<_$GoogleCheckResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
