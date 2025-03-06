// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'TriggerRegisterResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TriggerRegisterResponse _$TriggerRegisterResponseFromJson(
    Map<String, dynamic> json) {
  return _TriggerRegisterResponse.fromJson(json);
}

/// @nodoc
mixin _$TriggerRegisterResponse {
  @JsonKey(name: 'result')
  int get result => throw _privateConstructorUsedError;

  /// Serializes this TriggerRegisterResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TriggerRegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TriggerRegisterResponseCopyWith<TriggerRegisterResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriggerRegisterResponseCopyWith<$Res> {
  factory $TriggerRegisterResponseCopyWith(TriggerRegisterResponse value,
          $Res Function(TriggerRegisterResponse) then) =
      _$TriggerRegisterResponseCopyWithImpl<$Res, TriggerRegisterResponse>;
  @useResult
  $Res call({@JsonKey(name: 'result') int result});
}

/// @nodoc
class _$TriggerRegisterResponseCopyWithImpl<$Res,
        $Val extends TriggerRegisterResponse>
    implements $TriggerRegisterResponseCopyWith<$Res> {
  _$TriggerRegisterResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TriggerRegisterResponse
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
abstract class _$$TriggerRegisterResponseImplCopyWith<$Res>
    implements $TriggerRegisterResponseCopyWith<$Res> {
  factory _$$TriggerRegisterResponseImplCopyWith(
          _$TriggerRegisterResponseImpl value,
          $Res Function(_$TriggerRegisterResponseImpl) then) =
      __$$TriggerRegisterResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'result') int result});
}

/// @nodoc
class __$$TriggerRegisterResponseImplCopyWithImpl<$Res>
    extends _$TriggerRegisterResponseCopyWithImpl<$Res,
        _$TriggerRegisterResponseImpl>
    implements _$$TriggerRegisterResponseImplCopyWith<$Res> {
  __$$TriggerRegisterResponseImplCopyWithImpl(
      _$TriggerRegisterResponseImpl _value,
      $Res Function(_$TriggerRegisterResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TriggerRegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$TriggerRegisterResponseImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TriggerRegisterResponseImpl implements _TriggerRegisterResponse {
  const _$TriggerRegisterResponseImpl(
      {@JsonKey(name: 'result') required this.result});

  factory _$TriggerRegisterResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TriggerRegisterResponseImplFromJson(json);

  @override
  @JsonKey(name: 'result')
  final int result;

  @override
  String toString() {
    return 'TriggerRegisterResponse(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TriggerRegisterResponseImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of TriggerRegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TriggerRegisterResponseImplCopyWith<_$TriggerRegisterResponseImpl>
      get copyWith => __$$TriggerRegisterResponseImplCopyWithImpl<
          _$TriggerRegisterResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TriggerRegisterResponseImplToJson(
      this,
    );
  }
}

abstract class _TriggerRegisterResponse implements TriggerRegisterResponse {
  const factory _TriggerRegisterResponse(
          {@JsonKey(name: 'result') required final int result}) =
      _$TriggerRegisterResponseImpl;

  factory _TriggerRegisterResponse.fromJson(Map<String, dynamic> json) =
      _$TriggerRegisterResponseImpl.fromJson;

  @override
  @JsonKey(name: 'result')
  int get result;

  /// Create a copy of TriggerRegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TriggerRegisterResponseImplCopyWith<_$TriggerRegisterResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
