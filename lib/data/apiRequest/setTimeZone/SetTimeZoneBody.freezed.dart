// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SetTimeZoneBody.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SetTimeZoneBody _$SetTimeZoneBodyFromJson(Map<String, dynamic> json) {
  return _SetTimeZoneBody.fromJson(json);
}

/// @nodoc
mixin _$SetTimeZoneBody {
  @JsonKey(name: 'attrs')
  Attrs? get attrs => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;

  /// Serializes this SetTimeZoneBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SetTimeZoneBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SetTimeZoneBodyCopyWith<SetTimeZoneBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetTimeZoneBodyCopyWith<$Res> {
  factory $SetTimeZoneBodyCopyWith(
          SetTimeZoneBody value, $Res Function(SetTimeZoneBody) then) =
      _$SetTimeZoneBodyCopyWithImpl<$Res, SetTimeZoneBody>;
  @useResult
  $Res call(
      {@JsonKey(name: 'attrs') Attrs? attrs,
      @JsonKey(name: 'name') String name});

  $AttrsCopyWith<$Res>? get attrs;
}

/// @nodoc
class _$SetTimeZoneBodyCopyWithImpl<$Res, $Val extends SetTimeZoneBody>
    implements $SetTimeZoneBodyCopyWith<$Res> {
  _$SetTimeZoneBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SetTimeZoneBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attrs = freezed,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      attrs: freezed == attrs
          ? _value.attrs
          : attrs // ignore: cast_nullable_to_non_nullable
              as Attrs?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of SetTimeZoneBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttrsCopyWith<$Res>? get attrs {
    if (_value.attrs == null) {
      return null;
    }

    return $AttrsCopyWith<$Res>(_value.attrs!, (value) {
      return _then(_value.copyWith(attrs: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SetTimeZoneBodyImplCopyWith<$Res>
    implements $SetTimeZoneBodyCopyWith<$Res> {
  factory _$$SetTimeZoneBodyImplCopyWith(_$SetTimeZoneBodyImpl value,
          $Res Function(_$SetTimeZoneBodyImpl) then) =
      __$$SetTimeZoneBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'attrs') Attrs? attrs,
      @JsonKey(name: 'name') String name});

  @override
  $AttrsCopyWith<$Res>? get attrs;
}

/// @nodoc
class __$$SetTimeZoneBodyImplCopyWithImpl<$Res>
    extends _$SetTimeZoneBodyCopyWithImpl<$Res, _$SetTimeZoneBodyImpl>
    implements _$$SetTimeZoneBodyImplCopyWith<$Res> {
  __$$SetTimeZoneBodyImplCopyWithImpl(
      _$SetTimeZoneBodyImpl _value, $Res Function(_$SetTimeZoneBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of SetTimeZoneBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attrs = freezed,
    Object? name = null,
  }) {
    return _then(_$SetTimeZoneBodyImpl(
      attrs: freezed == attrs
          ? _value.attrs
          : attrs // ignore: cast_nullable_to_non_nullable
              as Attrs?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetTimeZoneBodyImpl implements _SetTimeZoneBody {
  const _$SetTimeZoneBodyImpl(
      {@JsonKey(name: 'attrs') required this.attrs,
      @JsonKey(name: 'name') required this.name});

  factory _$SetTimeZoneBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetTimeZoneBodyImplFromJson(json);

  @override
  @JsonKey(name: 'attrs')
  final Attrs? attrs;
  @override
  @JsonKey(name: 'name')
  final String name;

  @override
  String toString() {
    return 'SetTimeZoneBody(attrs: $attrs, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetTimeZoneBodyImpl &&
            (identical(other.attrs, attrs) || other.attrs == attrs) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attrs, name);

  /// Create a copy of SetTimeZoneBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetTimeZoneBodyImplCopyWith<_$SetTimeZoneBodyImpl> get copyWith =>
      __$$SetTimeZoneBodyImplCopyWithImpl<_$SetTimeZoneBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetTimeZoneBodyImplToJson(
      this,
    );
  }
}

abstract class _SetTimeZoneBody implements SetTimeZoneBody {
  const factory _SetTimeZoneBody(
          {@JsonKey(name: 'attrs') required final Attrs? attrs,
          @JsonKey(name: 'name') required final String name}) =
      _$SetTimeZoneBodyImpl;

  factory _SetTimeZoneBody.fromJson(Map<String, dynamic> json) =
      _$SetTimeZoneBodyImpl.fromJson;

  @override
  @JsonKey(name: 'attrs')
  Attrs? get attrs;
  @override
  @JsonKey(name: 'name')
  String get name;

  /// Create a copy of SetTimeZoneBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetTimeZoneBodyImplCopyWith<_$SetTimeZoneBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
