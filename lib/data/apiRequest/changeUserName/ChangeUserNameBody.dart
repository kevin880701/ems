import 'package:freezed_annotation/freezed_annotation.dart';

part 'ChangeUserNameBody.freezed.dart';
part 'ChangeUserNameBody.g.dart';

@freezed
class ChangeUserNameBody with _$ChangeUserNameBody {
  const factory ChangeUserNameBody({
    @JsonKey(name: 'name') required String name,
  }) = _ChangeUserNameBody;

  factory ChangeUserNameBody.fromJson(Map<String, dynamic> json) =>
      _$ChangeUserNameBodyFromJson(json);
}
