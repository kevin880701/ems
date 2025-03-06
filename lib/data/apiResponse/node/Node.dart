import 'package:freezed_annotation/freezed_annotation.dart';

part 'Node.freezed.dart';
part 'Node.g.dart';

@freezed
class Node with _$Node {
  const factory Node({
    @JsonKey(name: 'devid') required String devid,
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'type') required int type,
    @JsonKey(name: 'val') required String val,
    @JsonKey(name: 'data') required Map<String, dynamic> data,
    @JsonKey(name: 'attrs') required Map<String, dynamic> attrs,
    @JsonKey(name: 'ruleType') required String ruleType,
    @JsonKey(name: 'rule') required String rule,
  }) = _Node;

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
}
