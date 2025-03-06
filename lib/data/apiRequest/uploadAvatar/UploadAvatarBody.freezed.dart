// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'UploadAvatarBody.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadAvatarBody _$UploadAvatarBodyFromJson(Map<String, dynamic> json) {
  return _UploadAvatarBody.fromJson(json);
}

/// @nodoc
mixin _$UploadAvatarBody {
  @JsonKey(name: 'File1', fromJson: _fileFromJson, toJson: _fileToJson)
  File get file1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'attrs')
  Map<String, dynamic> get attrs => throw _privateConstructorUsedError;

  /// Serializes this UploadAvatarBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadAvatarBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadAvatarBodyCopyWith<UploadAvatarBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadAvatarBodyCopyWith<$Res> {
  factory $UploadAvatarBodyCopyWith(
          UploadAvatarBody value, $Res Function(UploadAvatarBody) then) =
      _$UploadAvatarBodyCopyWithImpl<$Res, UploadAvatarBody>;
  @useResult
  $Res call(
      {@JsonKey(name: 'File1', fromJson: _fileFromJson, toJson: _fileToJson)
      File file1,
      @JsonKey(name: 'attrs') Map<String, dynamic> attrs});
}

/// @nodoc
class _$UploadAvatarBodyCopyWithImpl<$Res, $Val extends UploadAvatarBody>
    implements $UploadAvatarBodyCopyWith<$Res> {
  _$UploadAvatarBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadAvatarBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file1 = null,
    Object? attrs = null,
  }) {
    return _then(_value.copyWith(
      file1: null == file1
          ? _value.file1
          : file1 // ignore: cast_nullable_to_non_nullable
              as File,
      attrs: null == attrs
          ? _value.attrs
          : attrs // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadAvatarBodyImplCopyWith<$Res>
    implements $UploadAvatarBodyCopyWith<$Res> {
  factory _$$UploadAvatarBodyImplCopyWith(_$UploadAvatarBodyImpl value,
          $Res Function(_$UploadAvatarBodyImpl) then) =
      __$$UploadAvatarBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'File1', fromJson: _fileFromJson, toJson: _fileToJson)
      File file1,
      @JsonKey(name: 'attrs') Map<String, dynamic> attrs});
}

/// @nodoc
class __$$UploadAvatarBodyImplCopyWithImpl<$Res>
    extends _$UploadAvatarBodyCopyWithImpl<$Res, _$UploadAvatarBodyImpl>
    implements _$$UploadAvatarBodyImplCopyWith<$Res> {
  __$$UploadAvatarBodyImplCopyWithImpl(_$UploadAvatarBodyImpl _value,
      $Res Function(_$UploadAvatarBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadAvatarBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file1 = null,
    Object? attrs = null,
  }) {
    return _then(_$UploadAvatarBodyImpl(
      file1: null == file1
          ? _value.file1
          : file1 // ignore: cast_nullable_to_non_nullable
              as File,
      attrs: null == attrs
          ? _value._attrs
          : attrs // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadAvatarBodyImpl implements _UploadAvatarBody {
  const _$UploadAvatarBodyImpl(
      {@JsonKey(name: 'File1', fromJson: _fileFromJson, toJson: _fileToJson)
      required this.file1,
      @JsonKey(name: 'attrs') required final Map<String, dynamic> attrs})
      : _attrs = attrs;

  factory _$UploadAvatarBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadAvatarBodyImplFromJson(json);

  @override
  @JsonKey(name: 'File1', fromJson: _fileFromJson, toJson: _fileToJson)
  final File file1;
  final Map<String, dynamic> _attrs;
  @override
  @JsonKey(name: 'attrs')
  Map<String, dynamic> get attrs {
    if (_attrs is EqualUnmodifiableMapView) return _attrs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attrs);
  }

  @override
  String toString() {
    return 'UploadAvatarBody(file1: $file1, attrs: $attrs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadAvatarBodyImpl &&
            (identical(other.file1, file1) || other.file1 == file1) &&
            const DeepCollectionEquality().equals(other._attrs, _attrs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, file1, const DeepCollectionEquality().hash(_attrs));

  /// Create a copy of UploadAvatarBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadAvatarBodyImplCopyWith<_$UploadAvatarBodyImpl> get copyWith =>
      __$$UploadAvatarBodyImplCopyWithImpl<_$UploadAvatarBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadAvatarBodyImplToJson(
      this,
    );
  }
}

abstract class _UploadAvatarBody implements UploadAvatarBody {
  const factory _UploadAvatarBody(
          {@JsonKey(name: 'File1', fromJson: _fileFromJson, toJson: _fileToJson)
          required final File file1,
          @JsonKey(name: 'attrs') required final Map<String, dynamic> attrs}) =
      _$UploadAvatarBodyImpl;

  factory _UploadAvatarBody.fromJson(Map<String, dynamic> json) =
      _$UploadAvatarBodyImpl.fromJson;

  @override
  @JsonKey(name: 'File1', fromJson: _fileFromJson, toJson: _fileToJson)
  File get file1;
  @override
  @JsonKey(name: 'attrs')
  Map<String, dynamic> get attrs;

  /// Create a copy of UploadAvatarBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadAvatarBodyImplCopyWith<_$UploadAvatarBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
