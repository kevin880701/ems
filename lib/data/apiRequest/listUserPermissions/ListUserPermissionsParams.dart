import 'package:freezed_annotation/freezed_annotation.dart';

part 'ListUserPermissionsParams.freezed.dart';
part 'ListUserPermissionsParams.g.dart';

@freezed
class ListUserPermissionsParams with _$ListUserPermissionsParams {
  const factory ListUserPermissionsParams({
    @JsonKey(name: 'accountids') required String accountids,
  }) = _ListUserPermissionsParams;

  factory ListUserPermissionsParams.fromJson(Map<String, dynamic> json) =>
      _$ListUserPermissionsParamsFromJson(json);
}
