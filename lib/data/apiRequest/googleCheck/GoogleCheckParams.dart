import 'package:freezed_annotation/freezed_annotation.dart';

part 'GoogleCheckParams.freezed.dart';
part 'GoogleCheckParams.g.dart';

@freezed
class GoogleCheckParams with _$GoogleCheckParams {
  const factory GoogleCheckParams({
    @JsonKey(name: 'uid') required String uid,
  }) = _GoogleCheckParams;

  factory GoogleCheckParams.fromJson(Map<String, dynamic> json) =>
      _$GoogleCheckParamsFromJson(json);
}
