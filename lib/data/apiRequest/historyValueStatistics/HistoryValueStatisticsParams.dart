import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tuple/tuple.dart';
import 'package:intl/intl.dart';

part 'HistoryValueStatisticsParams.freezed.dart';
part 'HistoryValueStatisticsParams.g.dart';

@freezed
class HistoryValueStatisticsParams with _$HistoryValueStatisticsParams {
  const factory HistoryValueStatisticsParams({
    @JsonKey(name: 'startTime') required String startTime,
    @JsonKey(name: 'endTime') required String endTime,
    @JsonKey(name: 'fields') required String fields,
    @JsonKey(name: 'interval') required int interval,
    @JsonKey(name: 'titles') required String titles,
  }) = _HistoryValueStatisticsParams;

  factory HistoryValueStatisticsParams.requestFromParams(
      String devicePoint,
      String startTime,
      String endTime,
      List<String> fields,
      int interval,
      ) {
    try {
      String field = "\$time,$devicePoint:${fields.join(',$devicePoint:')}";
      String titles = "time,${fields.map((field) => '${devicePoint}_$field').join(',')}";

      return HistoryValueStatisticsParams(
        startTime: startTime,
        endTime: endTime,
        fields: field,
        interval: interval,
        titles: titles,
      );
    } catch (e) {
      throw FormatException('Failed to decode CardType: $e');
    }
  }

  factory HistoryValueStatisticsParams.fromJson(Map<String, dynamic> json) =>
      _$HistoryValueStatisticsParamsFromJson(json);
}

Tuple2<String, String> dayConvertRequest(DateTime date, int timezone) {
  String startTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss")
      .format(date.subtract(Duration(seconds: timezone)));
  String endTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss")
      .format(date.subtract(Duration(seconds: timezone)).add(Duration(hours: 24)));

  print("------------chooseDay------------");
  print("startTime：$startTime");
  print("endTime：$endTime");

  return Tuple2(startTime, endTime);
}

Tuple2<String, String> monthConvertRequest(String dateString, int timezone) {
  // 解析字串為 DateTime
  DateTime dateTime = DateTime.parse(dateString + '-01');
  DateTime startDateTime = dateTime.subtract(Duration(seconds: timezone));
  DateTime endDateTime = DateTime(dateTime.year, dateTime.month + 1, 1)
      .subtract(Duration(seconds: timezone));

  String startTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(startDateTime);
  String endTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(endDateTime);

  print("------------chooseMonth------------");
  print("startTime：$startTime");
  print("endTime：$endTime");

  return Tuple2(startTime, endTime);
}

Tuple2<String, String> yearConvertRequest(String dateString, int timezone) {
  // 將字串解析為年份
  DateTime dateTime = DateTime(int.parse(dateString), 1, 1);
  DateTime startDateTime = dateTime.subtract(Duration(seconds: timezone));
  DateTime endDateTime =
  DateTime(int.parse(dateString) + 1, 1, 1).subtract(Duration(seconds: timezone));

  String startTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(startDateTime);
  String endTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(endDateTime);

  print("------------chooseYear------------");
  print("startTime：$startTime");
  print("endTime：$endTime");

  return Tuple2(startTime, endTime);
}
