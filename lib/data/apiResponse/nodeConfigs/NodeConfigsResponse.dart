import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'NodeConfigsResponse.freezed.dart';
part 'NodeConfigsResponse.g.dart';

@freezed
class NodeConfigsResponse with _$NodeConfigsResponse {
  const factory NodeConfigsResponse({
    @JsonKey(name: 'result') required int result,
    @JsonKey(name: 'data') required List<NodeConfig> data,
  }) = _NodeConfigsResponse;

  factory NodeConfigsResponse.fromJson(Map<String, dynamic> json) {
    // 檢查 data 是否是一個 String，如果是就轉換為 JSON List
    var rawData = json['data'];
    List<dynamic> parsedData;

    if (rawData is String) {
      parsedData = jsonDecode(rawData) as List<dynamic>;
    } else if (rawData is List) {
      parsedData = rawData;
    } else {
      throw Exception("Unexpected data format: ${rawData.runtimeType}");
    }

    var nodeConfigList = parsedData
        .map((node) => NodeConfig.fromJson(node as Map<String, dynamic>))
        .toList();

    return NodeConfigsResponse(
      result: json['result'] ?? 0,
      data: nodeConfigList,
    );
  }
}

@freezed
class NodeConfig with _$NodeConfig {
  const factory NodeConfig({
    @JsonKey(name: 'ruleType') required String ruleType,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'rule') required String rule,
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'type') required int type,
  }) = _NodeConfig;

  factory NodeConfig.fromJson(Map<String, dynamic> json) =>
      _$NodeConfigFromJson(json);
}
