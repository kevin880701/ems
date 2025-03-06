import 'package:freezed_annotation/freezed_annotation.dart';

part 'EnergyListData.freezed.dart';
part 'EnergyListData.g.dart';

@freezed
class EnergyListData with _$EnergyListData {
  const factory EnergyListData({
    @JsonKey(name: 'data') required List<EnergyData> energyList,
  }) = _EnergyListData;

  factory EnergyListData.fromJson(Map<String, dynamic> json) =>
      _$EnergyListDataFromJson(json);
}

@freezed
class EnergyData with _$EnergyData {
  const factory EnergyData({
    @JsonKey(name: 'time') required String time,
    required List<String> titleList,
    required List<double?> valueList,
  }) = _EnergyData;

  factory EnergyData.fromJson(Map<String, dynamic> json) =>
      _$EnergyDataFromJson(json);
}

extension EnergyDataExtensions on EnergyData {
  static EnergyData parseFromJson(
      Map<String, dynamic> json,
      List<String> titleList,
      ) {
    List<double?> valueList = titleList
        .map((title) => double.tryParse(
        json[title.substring(0, title.length - 4)].toString()))
        .toList();

    return EnergyData(
      time: json['time'] as String,
      titleList: titleList,
      valueList: valueList,
    );
  }
}

extension EnergyListDataExtensions on EnergyListData {
  static EnergyListData parseFromJson(
      Map<String, dynamic> json,
      List<String> titleList,
      ) {
    var dataList = json['data'] as List<dynamic>;
    List<EnergyData> energies = dataList
        .map((data) =>
        EnergyDataExtensions.parseFromJson(data as Map<String, dynamic>, titleList))
        .toList();

    return EnergyListData(energyList: energies);
  }
}
