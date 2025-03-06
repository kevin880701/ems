// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'EnergyListData.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EnergyListData _$EnergyListDataFromJson(Map<String, dynamic> json) {
  return _EnergyListData.fromJson(json);
}

/// @nodoc
mixin _$EnergyListData {
  @JsonKey(name: 'data')
  List<EnergyData> get energyList => throw _privateConstructorUsedError;

  /// Serializes this EnergyListData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EnergyListData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnergyListDataCopyWith<EnergyListData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnergyListDataCopyWith<$Res> {
  factory $EnergyListDataCopyWith(
          EnergyListData value, $Res Function(EnergyListData) then) =
      _$EnergyListDataCopyWithImpl<$Res, EnergyListData>;
  @useResult
  $Res call({@JsonKey(name: 'data') List<EnergyData> energyList});
}

/// @nodoc
class _$EnergyListDataCopyWithImpl<$Res, $Val extends EnergyListData>
    implements $EnergyListDataCopyWith<$Res> {
  _$EnergyListDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnergyListData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? energyList = null,
  }) {
    return _then(_value.copyWith(
      energyList: null == energyList
          ? _value.energyList
          : energyList // ignore: cast_nullable_to_non_nullable
              as List<EnergyData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnergyListDataImplCopyWith<$Res>
    implements $EnergyListDataCopyWith<$Res> {
  factory _$$EnergyListDataImplCopyWith(_$EnergyListDataImpl value,
          $Res Function(_$EnergyListDataImpl) then) =
      __$$EnergyListDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'data') List<EnergyData> energyList});
}

/// @nodoc
class __$$EnergyListDataImplCopyWithImpl<$Res>
    extends _$EnergyListDataCopyWithImpl<$Res, _$EnergyListDataImpl>
    implements _$$EnergyListDataImplCopyWith<$Res> {
  __$$EnergyListDataImplCopyWithImpl(
      _$EnergyListDataImpl _value, $Res Function(_$EnergyListDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnergyListData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? energyList = null,
  }) {
    return _then(_$EnergyListDataImpl(
      energyList: null == energyList
          ? _value._energyList
          : energyList // ignore: cast_nullable_to_non_nullable
              as List<EnergyData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnergyListDataImpl implements _EnergyListData {
  const _$EnergyListDataImpl(
      {@JsonKey(name: 'data') required final List<EnergyData> energyList})
      : _energyList = energyList;

  factory _$EnergyListDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnergyListDataImplFromJson(json);

  final List<EnergyData> _energyList;
  @override
  @JsonKey(name: 'data')
  List<EnergyData> get energyList {
    if (_energyList is EqualUnmodifiableListView) return _energyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_energyList);
  }

  @override
  String toString() {
    return 'EnergyListData(energyList: $energyList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnergyListDataImpl &&
            const DeepCollectionEquality()
                .equals(other._energyList, _energyList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_energyList));

  /// Create a copy of EnergyListData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnergyListDataImplCopyWith<_$EnergyListDataImpl> get copyWith =>
      __$$EnergyListDataImplCopyWithImpl<_$EnergyListDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnergyListDataImplToJson(
      this,
    );
  }
}

abstract class _EnergyListData implements EnergyListData {
  const factory _EnergyListData(
          {@JsonKey(name: 'data') required final List<EnergyData> energyList}) =
      _$EnergyListDataImpl;

  factory _EnergyListData.fromJson(Map<String, dynamic> json) =
      _$EnergyListDataImpl.fromJson;

  @override
  @JsonKey(name: 'data')
  List<EnergyData> get energyList;

  /// Create a copy of EnergyListData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnergyListDataImplCopyWith<_$EnergyListDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EnergyData _$EnergyDataFromJson(Map<String, dynamic> json) {
  return _EnergyData.fromJson(json);
}

/// @nodoc
mixin _$EnergyData {
  @JsonKey(name: 'time')
  String get time => throw _privateConstructorUsedError;
  List<String> get titleList => throw _privateConstructorUsedError;
  List<double?> get valueList => throw _privateConstructorUsedError;

  /// Serializes this EnergyData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EnergyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnergyDataCopyWith<EnergyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnergyDataCopyWith<$Res> {
  factory $EnergyDataCopyWith(
          EnergyData value, $Res Function(EnergyData) then) =
      _$EnergyDataCopyWithImpl<$Res, EnergyData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'time') String time,
      List<String> titleList,
      List<double?> valueList});
}

/// @nodoc
class _$EnergyDataCopyWithImpl<$Res, $Val extends EnergyData>
    implements $EnergyDataCopyWith<$Res> {
  _$EnergyDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnergyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? titleList = null,
    Object? valueList = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      titleList: null == titleList
          ? _value.titleList
          : titleList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      valueList: null == valueList
          ? _value.valueList
          : valueList // ignore: cast_nullable_to_non_nullable
              as List<double?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnergyDataImplCopyWith<$Res>
    implements $EnergyDataCopyWith<$Res> {
  factory _$$EnergyDataImplCopyWith(
          _$EnergyDataImpl value, $Res Function(_$EnergyDataImpl) then) =
      __$$EnergyDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'time') String time,
      List<String> titleList,
      List<double?> valueList});
}

/// @nodoc
class __$$EnergyDataImplCopyWithImpl<$Res>
    extends _$EnergyDataCopyWithImpl<$Res, _$EnergyDataImpl>
    implements _$$EnergyDataImplCopyWith<$Res> {
  __$$EnergyDataImplCopyWithImpl(
      _$EnergyDataImpl _value, $Res Function(_$EnergyDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnergyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? titleList = null,
    Object? valueList = null,
  }) {
    return _then(_$EnergyDataImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      titleList: null == titleList
          ? _value._titleList
          : titleList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      valueList: null == valueList
          ? _value._valueList
          : valueList // ignore: cast_nullable_to_non_nullable
              as List<double?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnergyDataImpl implements _EnergyData {
  const _$EnergyDataImpl(
      {@JsonKey(name: 'time') required this.time,
      required final List<String> titleList,
      required final List<double?> valueList})
      : _titleList = titleList,
        _valueList = valueList;

  factory _$EnergyDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnergyDataImplFromJson(json);

  @override
  @JsonKey(name: 'time')
  final String time;
  final List<String> _titleList;
  @override
  List<String> get titleList {
    if (_titleList is EqualUnmodifiableListView) return _titleList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_titleList);
  }

  final List<double?> _valueList;
  @override
  List<double?> get valueList {
    if (_valueList is EqualUnmodifiableListView) return _valueList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_valueList);
  }

  @override
  String toString() {
    return 'EnergyData(time: $time, titleList: $titleList, valueList: $valueList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnergyDataImpl &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality()
                .equals(other._titleList, _titleList) &&
            const DeepCollectionEquality()
                .equals(other._valueList, _valueList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      time,
      const DeepCollectionEquality().hash(_titleList),
      const DeepCollectionEquality().hash(_valueList));

  /// Create a copy of EnergyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnergyDataImplCopyWith<_$EnergyDataImpl> get copyWith =>
      __$$EnergyDataImplCopyWithImpl<_$EnergyDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnergyDataImplToJson(
      this,
    );
  }
}

abstract class _EnergyData implements EnergyData {
  const factory _EnergyData(
      {@JsonKey(name: 'time') required final String time,
      required final List<String> titleList,
      required final List<double?> valueList}) = _$EnergyDataImpl;

  factory _EnergyData.fromJson(Map<String, dynamic> json) =
      _$EnergyDataImpl.fromJson;

  @override
  @JsonKey(name: 'time')
  String get time;
  @override
  List<String> get titleList;
  @override
  List<double?> get valueList;

  /// Create a copy of EnergyData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnergyDataImplCopyWith<_$EnergyDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
