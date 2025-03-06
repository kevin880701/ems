import 'package:freezed_annotation/freezed_annotation.dart';

part 'Attrs.freezed.dart';
part 'Attrs.g.dart';

@freezed
class Attrs with _$Attrs {
  const factory Attrs({
    @JsonKey(name: 'Timezone') String? timezone,
    @JsonKey(name: 'Timezone_val') String? timezoneVal,
    @JsonKey(name: 'belongUnit') String? belongUnit,
  }) = _Attrs;

  factory Attrs.fromJson(Map<String, dynamic> json) => _$AttrsFromJson(json);
}