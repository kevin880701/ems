import 'package:ems_app/data/apiResponse/attrs/Attrs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SetTimeZoneBody.freezed.dart';
part 'SetTimeZoneBody.g.dart';

@freezed
class SetTimeZoneBody with _$SetTimeZoneBody {
  const factory SetTimeZoneBody({
    @JsonKey(name: 'attrs') required Attrs? attrs,
    @JsonKey(name: 'name') required String name,
  }) = _SetTimeZoneBody;

  factory SetTimeZoneBody.fromJson(Map<String, dynamic> json) =>
      _$SetTimeZoneBodyFromJson(json);
}
