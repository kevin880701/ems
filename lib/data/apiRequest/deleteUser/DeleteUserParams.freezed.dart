// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'DeleteUserParams.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeleteUserParams _$DeleteUserParamsFromJson(Map<String, dynamic> json) {
  return _DeleteUserParams.fromJson(json);
}

/// @nodoc
mixin _$DeleteUserParams {
  @JsonKey(name: 'account')
  String get account => throw _privateConstructorUsedError;
  @JsonKey(name: 'accountType')
  int get accountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'org')
  String? get org => throw _privateConstructorUsedError;

  /// Serializes this DeleteUserParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeleteUserParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteUserParamsCopyWith<DeleteUserParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteUserParamsCopyWith<$Res> {
  factory $DeleteUserParamsCopyWith(
          DeleteUserParams value, $Res Function(DeleteUserParams) then) =
      _$DeleteUserParamsCopyWithImpl<$Res, DeleteUserParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'account') String account,
      @JsonKey(name: 'accountType') int accountType,
      @JsonKey(name: 'org') String? org});
}

/// @nodoc
class _$DeleteUserParamsCopyWithImpl<$Res, $Val extends DeleteUserParams>
    implements $DeleteUserParamsCopyWith<$Res> {
  _$DeleteUserParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteUserParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? accountType = null,
    Object? org = freezed,
  }) {
    return _then(_value.copyWith(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as int,
      org: freezed == org
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteUserParamsImplCopyWith<$Res>
    implements $DeleteUserParamsCopyWith<$Res> {
  factory _$$DeleteUserParamsImplCopyWith(_$DeleteUserParamsImpl value,
          $Res Function(_$DeleteUserParamsImpl) then) =
      __$$DeleteUserParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'account') String account,
      @JsonKey(name: 'accountType') int accountType,
      @JsonKey(name: 'org') String? org});
}

/// @nodoc
class __$$DeleteUserParamsImplCopyWithImpl<$Res>
    extends _$DeleteUserParamsCopyWithImpl<$Res, _$DeleteUserParamsImpl>
    implements _$$DeleteUserParamsImplCopyWith<$Res> {
  __$$DeleteUserParamsImplCopyWithImpl(_$DeleteUserParamsImpl _value,
      $Res Function(_$DeleteUserParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteUserParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? accountType = null,
    Object? org = freezed,
  }) {
    return _then(_$DeleteUserParamsImpl(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as int,
      org: freezed == org
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteUserParamsImpl implements _DeleteUserParams {
  const _$DeleteUserParamsImpl(
      {@JsonKey(name: 'account') required this.account,
      @JsonKey(name: 'accountType') required this.accountType,
      @JsonKey(name: 'org') this.org});

  factory _$DeleteUserParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteUserParamsImplFromJson(json);

  @override
  @JsonKey(name: 'account')
  final String account;
  @override
  @JsonKey(name: 'accountType')
  final int accountType;
  @override
  @JsonKey(name: 'org')
  final String? org;

  @override
  String toString() {
    return 'DeleteUserParams(account: $account, accountType: $accountType, org: $org)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteUserParamsImpl &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.org, org) || other.org == org));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, account, accountType, org);

  /// Create a copy of DeleteUserParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteUserParamsImplCopyWith<_$DeleteUserParamsImpl> get copyWith =>
      __$$DeleteUserParamsImplCopyWithImpl<_$DeleteUserParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteUserParamsImplToJson(
      this,
    );
  }
}

abstract class _DeleteUserParams implements DeleteUserParams {
  const factory _DeleteUserParams(
      {@JsonKey(name: 'account') required final String account,
      @JsonKey(name: 'accountType') required final int accountType,
      @JsonKey(name: 'org') final String? org}) = _$DeleteUserParamsImpl;

  factory _DeleteUserParams.fromJson(Map<String, dynamic> json) =
      _$DeleteUserParamsImpl.fromJson;

  @override
  @JsonKey(name: 'account')
  String get account;
  @override
  @JsonKey(name: 'accountType')
  int get accountType;
  @override
  @JsonKey(name: 'org')
  String? get org;

  /// Create a copy of DeleteUserParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteUserParamsImplCopyWith<_$DeleteUserParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
