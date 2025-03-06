import 'package:freezed_annotation/freezed_annotation.dart';

part 'AppleCheckParams.freezed.dart';
part 'AppleCheckParams.g.dart';

@freezed
class AppleCheckParams with _$AppleCheckParams {
  const factory AppleCheckParams({
    @JsonKey(name: 'uid') required String uid,
  }) = _AppleCheckParams;

  factory AppleCheckParams.fromJson(Map<String, dynamic> json) =>
      _$AppleCheckParamsFromJson(json);
}
