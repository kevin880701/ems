// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'UploadAvatarResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadAvatarResponse _$UploadAvatarResponseFromJson(Map<String, dynamic> json) {
  return _UploadAvatarResponse.fromJson(json);
}

/// @nodoc
mixin _$UploadAvatarResponse {
  @JsonKey(name: 'result')
  int get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'fileid')
  String get data => throw _privateConstructorUsedError;

  /// Serializes this UploadAvatarResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadAvatarResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadAvatarResponseCopyWith<UploadAvatarResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadAvatarResponseCopyWith<$Res> {
  factory $UploadAvatarResponseCopyWith(UploadAvatarResponse value,
          $Res Function(UploadAvatarResponse) then) =
      _$UploadAvatarResponseCopyWithImpl<$Res, UploadAvatarResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'fileid') String data});
}

/// @nodoc
class _$UploadAvatarResponseCopyWithImpl<$Res,
        $Val extends UploadAvatarResponse>
    implements $UploadAvatarResponseCopyWith<$Res> {
  _$UploadAvatarResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadAvatarResponse
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
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadAvatarResponseImplCopyWith<$Res>
    implements $UploadAvatarResponseCopyWith<$Res> {
  factory _$$UploadAvatarResponseImplCopyWith(_$UploadAvatarResponseImpl value,
          $Res Function(_$UploadAvatarResponseImpl) then) =
      __$$UploadAvatarResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'result') int result,
      @JsonKey(name: 'fileid') String data});
}

/// @nodoc
class __$$UploadAvatarResponseImplCopyWithImpl<$Res>
    extends _$UploadAvatarResponseCopyWithImpl<$Res, _$UploadAvatarResponseImpl>
    implements _$$UploadAvatarResponseImplCopyWith<$Res> {
  __$$UploadAvatarResponseImplCopyWithImpl(_$UploadAvatarResponseImpl _value,
      $Res Function(_$UploadAvatarResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadAvatarResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? data = null,
  }) {
    return _then(_$UploadAvatarResponseImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadAvatarResponseImpl implements _UploadAvatarResponse {
  const _$UploadAvatarResponseImpl(
      {@JsonKey(name: 'result') required this.result,
      @JsonKey(name: 'fileid') required this.data});

  factory _$UploadAvatarResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadAvatarResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result')
  final int result;
  @override
  @JsonKey(name: 'fileid')
  final String data;

  @override
  String toString() {
    return 'UploadAvatarResponse(result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadAvatarResponseImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result, data);

  /// Create a copy of UploadAvatarResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadAvatarResponseImplCopyWith<_$UploadAvatarResponseImpl>
      get copyWith =>
          __$$UploadAvatarResponseImplCopyWithImpl<_$UploadAvatarResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadAvatarResponseImplToJson(
      this,
    );
  }
}

abstract class _UploadAvatarResponse implements UploadAvatarResponse {
  const factory _UploadAvatarResponse(
          {@JsonKey(name: 'result') required final int result,
          @JsonKey(name: 'fileid') required final String data}) =
      _$UploadAvatarResponseImpl;

  factory _UploadAvatarResponse.fromJson(Map<String, dynamic> json) =
      _$UploadAvatarResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result')
  int get result;
  @override
  @JsonKey(name: 'fileid')
  String get data;

  /// Create a copy of UploadAvatarResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadAvatarResponseImplCopyWith<_$UploadAvatarResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
