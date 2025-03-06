import 'package:ems_app/data/Params.dart';
import 'package:ems_app/define.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SetSelfUseModeTimeBody.freezed.dart';
part 'SetSelfUseModeTimeBody.g.dart';

@freezed
class SetSelfUseModeTimeBody with _$SetSelfUseModeTimeBody {
  const factory SetSelfUseModeTimeBody({
    @JsonKey(name: 'M33') required String m33,
    @JsonKey(name: 'M34') required String m34,
  }) = _SetSelfUseModeTimeBody;

  factory SetSelfUseModeTimeBody.create(
      String? chargeStartTime,
      String? chargeEndTime,
      ) {
    return SetSelfUseModeTimeBody(
      m33: chargeStartTime ?? '0000',
      m34: chargeEndTime ?? '0000',
    );
  }

  factory SetSelfUseModeTimeBody.fromJson(Map<String, dynamic> json) =>
      _$SetSelfUseModeTimeBodyFromJson(json);
}
