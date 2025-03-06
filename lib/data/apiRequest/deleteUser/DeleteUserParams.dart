import 'package:freezed_annotation/freezed_annotation.dart';

part 'DeleteUserParams.freezed.dart';
part 'DeleteUserParams.g.dart';

@freezed
class DeleteUserParams with _$DeleteUserParams {
  const factory DeleteUserParams({
    @JsonKey(name: 'account') required String account,
    @JsonKey(name: 'accountType') required int accountType,
    @JsonKey(name: 'org') String? org,
  }) = _DeleteUserParams;

  factory DeleteUserParams.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserParamsFromJson(json);
}
