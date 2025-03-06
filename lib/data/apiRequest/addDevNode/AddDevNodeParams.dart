import 'package:ems_app/data/apiResponse/nodeConfigs/NodeConfigsResponse.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'AddDevNodeParams.freezed.dart';
part 'AddDevNodeParams.g.dart';

@freezed
class AddDevNodeParams with _$AddDevNodeParams {
  const factory AddDevNodeParams({
    @JsonKey(name: 'devid') required String devid,
    @JsonKey(name: 'nodes') required List<NodeConfig> nodes,
  }) = _AddDevNodeParams;

  factory AddDevNodeParams.fromJson(Map<String, dynamic> json) =>
      _$AddDevNodeParamsFromJson(json);
}
