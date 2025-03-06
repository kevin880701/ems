import 'package:ems_app/utils/AppLog.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'Vals.freezed.dart';
part 'Vals.g.dart';

@freezed
class Vals with _$Vals {
  const factory Vals({
    @JsonKey(name: 'Req_And_Info_3444_B8') required String reqAndInfo3444B8,
    @JsonKey(name: 'Req_And_Info_3444_B9') required String reqAndInfo3444B9,
    @JsonKey(name: 'info_3441') String? info3441,
    @JsonKey(name: 'hb_3450') required String hb3450,
    @JsonKey(name: 'L2_3457') required String l2_3457,
    @JsonKey(name: 'L2_3460') required String l2_3460,
    @JsonKey(name: 'L2_3449') required String l2_3449,
    @JsonKey(name: 'Req_And_Info_3488_B8') String? reqAndInfo3488B8,
    @JsonKey(name: 'Req_And_Info_3488_B9') required String reqAndInfo3488B9,
    @JsonKey(name: 'hb_3494') required String hb3494,
    @JsonKey(name: 'L2_3501') String? l2_3501,
    @JsonKey(name: 'L2_3504') String? l2_3504,
    @JsonKey(name: 'L2_3493') required String l2_3493,
    @JsonKey(name: 'info_3529') String? info3529,
    @JsonKey(name: 'info_3485') String? info3485,
    @JsonKey(name: 'Req_And_Info_3532_B8') required String reqAndInfo3532B8,
    @JsonKey(name: 'Req_And_Info_3532_B9') required String reqAndInfo3532B9,
    @JsonKey(name: 'hb_3538') required String hb3538,
    @JsonKey(name: 'L2_3545') String? l2_3545,
    @JsonKey(name: 'L2_3548') String? l2_3548,
    @JsonKey(name: 'L2_3537') String? l2_3537,
    @JsonKey(name: 'L2_3540') String? l2_3540,
    @JsonKey(name: 'info_3573') String? info3573,
    @JsonKey(name: 'Req_And_Info_3576_B8') required String reqAndInfo3576B8,
    @JsonKey(name: 'Req_And_Info_3576_B9') required String reqAndInfo3576B9,
    @JsonKey(name: 'hb_3582') required String hb3582,
    @JsonKey(name: 'L2_3589') String? l2_3589,
    @JsonKey(name: 'L2_3592') String? l2_3592,
    @JsonKey(name: 'L2_3581') String? l2_3581,
    @JsonKey(name: 'L2_3584') String? l2_3584,
    @JsonKey(name: 'Req_And_Info_3044') String? reqAndInfo3044,
    @JsonKey(name: 'Req_And_Info_3160') required String reqAndInfo3160,
    @JsonKey(name: 'Req_And_Info_3168') required String reqAndInfo3168,
    @JsonKey(name: 'Req_And_Info_3317') String? reqAndInfo3317,
    @JsonKey(name: 'Req_And_Info_3318') required String reqAndInfo3318,
    @JsonKey(name: 'hb_3445') required String hb3445,
    @JsonKey(name: 'hb_3455') required String hb3455,
    @JsonKey(name: 'hb_3489') required String hb3489,
    @JsonKey(name: 'hb_3499') required String hb3499,
    @JsonKey(name: 'hb_3533') required String hb3533,
    @JsonKey(name: 'hb_3543') required String hb3543,
    @JsonKey(name: 'hb_3577') required String hb3577,
    @JsonKey(name: 'hb_3587') required String hb3587,
    @JsonKey(name: 'B_R_Battery') String? brBattery,
    @JsonKey(name: 'info_3472') String? info3472,
    @JsonKey(name: 'info_3516') String? info3516,
    @JsonKey(name: 'info_3560') String? info3560,
    @JsonKey(name: 'info_3604') String? info3604,
    @JsonKey(name: 'info_3077') String? info3077,
    @JsonKey(name: 'L1_3036') required String l13036,
    @JsonKey(name: 'P_KwhMonth') required String pKwhMonth,
    @JsonKey(name: 'L3_3039') String? l33039,
  }) = _Vals;

  factory Vals.fromJson(Map<String, dynamic> json) =>
      _$ValsFromJson(json);
}

Vals? valsFromJson(Object? json) {
  // 判斷 json 是否可以被正確轉換
  if (json == null || json is! Map<String, dynamic>) {
    print("Invalid json: null or not a Map<String, dynamic>");
    return null;
  }
  // 確保 json 不包含空字段或類型錯誤
  try {
    AppLog.i(json.toString());
    print(Vals.fromJson(json));
  } catch (e) {
    print("valsFromJson convert ERROR");
    print(e);
    return null;
  }

  if (json.isEmpty) {
    print("valsFromJson isEmpty");
    return null; // 如果是空對象，轉換為 null
  }

  return Vals.fromJson(json); // 正常轉換
}