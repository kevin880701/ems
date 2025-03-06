import 'package:freezed_annotation/freezed_annotation.dart';

part 'TriggerRegisterResponse.freezed.dart';
part 'TriggerRegisterResponse.g.dart';

@freezed
class TriggerRegisterResponse with _$TriggerRegisterResponse {
  const factory TriggerRegisterResponse({
    @JsonKey(name: 'result') required int result,
  }) = _TriggerRegisterResponse;

  factory TriggerRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$TriggerRegisterResponseFromJson(json);
}
