export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'screen/BasePageState.dart';
import 'package:ems_app/data/Params.dart';
import 'package:ems_app/resources/app_colors.dart';
import 'package:ems_app/resources/app_texts.dart';
import 'package:ems_app/utils/toast/src/core/toastification.dart';
import 'package:ems_app/utils/toast/src/widget/built_in/built_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ems_app/utils/toast/toastification.dart';
import 'package:tuple/tuple.dart';
import 'define.dart';
import 'dart:io';

class Define {
  //region Singleton 單例模式，確保一個類別只有一個實例
  Define._();

  static final Define instance = Define._();

  //endregion

  String rootDir = "";

  String headPhotoFileName = "";

  Color statusBarBgColor = AppColors.white;
  Brightness statusBarIconColor = Brightness.light;

  init() async {
    // rootDir = await _getResourcePath();
    headPhotoFileName = "${rootDir}/headphoto.jpg";
  }
}

///
/// 設置狀態欄的顏色和圖標顏色。
///
/// 這個函數用於設置應用程序的狀態欄背景顏色和圖標顏色。
///
/// 参数：
///   statusBarBgColor: 狀態欄的背景顏色
///   statusBarIconColor: 狀態欄圖標的顏色
///
// void setStatusBar(Color statusBarBgColor, Brightness statusBarIconColor) {
//   Define.instance.statusBarBgColor = statusBarBgColor;
//   Define.instance.statusBarIconColor = statusBarIconColor;
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     statusBarColor: statusBarBgColor,
//     statusBarIconBrightness: statusBarIconColor,
//     systemNavigationBarColor: statusBarBgColor,
//     systemNavigationBarIconBrightness: statusBarIconColor,
//   ));
// }
void setStatusBar() {
  // 暫時固定設透明底色
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
}

///region extension
extension DateTimeExtension on DateTime {
  static final DateTime minValue = DateTime(2000, 1, 1);

  static String get now =>
      DateFormat('yyyy/MM/dd kk:mm').format(DateTime.now());
}

extension StringExtension on String {
  ///看看是否為int
  bool tryInt() {
    try {
      return int.tryParse(this) != null ? true : false;
    } catch (e) {
      return false;
    }
  }

  bool isNullOrEmpty() {
    if (isEmpty) {
      return true;
    }
    return false;
  }

  ///如果是null or empty就回傳預設值
  String defaultValue(String s) {
    if (isNullOrEmpty()) return s;
    return this;
  }

  ///只接受字母及數字 字數限制8~20
  bool isValidatePassword() {
    if (isEmpty) return false;

    if (length < 8 || length > 20) return false;
    RegExp regex = RegExp(r'^[A-Za-z0-9]+$');
    if (!regex.hasMatch(this)) return false;
    return true;
  }

  //檢查信箱是否合乎規則
  bool isEmailValid() {
    if (isEmpty) return false;

    ///信箱中只能包含英文字母 數字 英文句號. 和底線_  不能連續使用 小老鼠只能一個，@後不可為空
    List<String> parts = this!.split('@');
    if (parts.length != 2 || parts[1].isEmpty) return false;

    // 檢查@後的部分是否符合 XXX.XXX 格式
    List<String> domainParts = parts[1].split('.');
    if (domainParts.length != 2) return false;

    // 檢查第一部分是否為空
    if (domainParts[0].isEmpty) return false;

    // 檢查第二部分是否為空
    if (domainParts[1].isEmpty) return false;

    bool isDotOrLineOrAt = false;
    for (int i = 0; i < this!.length; ++i) {
      var asciicode = this[i].codeUnitAt(0);
      //Number
      if (asciicode >= 48 && asciicode <= 57) {
        isDotOrLineOrAt = false;
        continue;
      }
      //大寫英文
      if (asciicode >= 65 && asciicode <= 90) {
        isDotOrLineOrAt = false;
        continue;
      }
      //小寫英文
      if (asciicode >= 97 && asciicode <= 122) {
        isDotOrLineOrAt = false;
        continue;
      }
      //.
      if (asciicode == 46) {
        if (i == 0) return false;
        if (isDotOrLineOrAt == true) return false;
        isDotOrLineOrAt = true;
        continue;
      }
      //_
      if (asciicode == 95) {
        if (i == 0) return false;
        if (isDotOrLineOrAt == true) return false;
        isDotOrLineOrAt = true;
        continue;
      }
      //@
      if (asciicode == 64) {
        if (i == 0) return false;
        if (isDotOrLineOrAt == true) return false;
        isDotOrLineOrAt = true;
        continue;
      }
      return false;
    }
    return true;
  }

  ///
  /// 判斷字串是否為 UID
  ///
  /// 使用正則表達式匹配輸入的字元串，判斷是否符合 UID 的格式。
  /// UID 的格式為 8-4-4-4-12 個十六進制數字和連字元 '-' 組成的字元串。
  ///
  /// 返回值：
  ///   如果字元串符合 UUID 的格式，則返回 true；否則返回 false。
  ///
  bool isUid() {
    // 定義 UID 的正則表達式
    RegExp regExp = RegExp(r'^[\da-f]{8}-([\da-f]{4}-){3}[\da-f]{12}$');
    // 使用正則表達式匹配輸入的字串
    return regExp.hasMatch(this!);
  }
}

extension StringExtension2 on String? {

  int? stringToInt() {
    try {
      if (this != null) {
        return int.parse(this!);
      }
    } catch (e) {
      try {
        double doubleValue = double.parse(this!);
        if (doubleValue % 1 == 0) {
          return doubleValue.toInt();
        }
      } catch (e) {
      }
    }
    return null;
  }


  ///看看是否為int
  bool tryInt() {
    try {
      if (isNullOrEmpty()) return false;
      return int.tryParse(this!) != null ? true : false;
    } catch (e) {
      return false;
    }
  }

  bool isNullOrEmpty() {
    if (this?.isEmpty ?? true) {
      return true;
    }
    return false;
  }

  ///如果是null or empty就回傳預設值
  String? defaultValue(String s) {
    if (isNullOrEmpty()) return s;
    return this;
  }

  ///只接受字母及數字 字數限制8~20
  bool isValidatePassword() {
    if (isNullOrEmpty()) {
      return false;
    }

    if (this!.length < 8 || this!.length > 20) return false;
    RegExp regex = RegExp(r'^[A-Za-z0-9]+$');
    if (!regex.hasMatch(this!)) return false;
    return true;
  }

  //檢查信箱是否合乎規則
  bool isEmailVaild() {
    if (isNullOrEmpty()) {
      return false;
    }

    ///信箱中只能包含英文字母 數字 英文句號. 和底線_  不能連續使用 小老鼠只能一個
    ///參考Yahoo的
    if (this!.split('@').length != 2) return false;

    bool isDotOrLineOrAt = false;
    for (int i = 0; i < this!.length; ++i) {
      var asciicode = this![i].codeUnitAt(0);
      //Number
      if (asciicode >= 48 && asciicode <= 57) {
        isDotOrLineOrAt = false;
        continue;
      }
      //大寫英文
      if (asciicode >= 65 && asciicode <= 90) {
        isDotOrLineOrAt = false;
        continue;
      }
      //小寫英文
      if (asciicode >= 97 && asciicode <= 122) {
        isDotOrLineOrAt = false;
        continue;
      }
      //.
      if (asciicode == 46) {
        if (i == 0) return false;
        if (isDotOrLineOrAt == true) return false;
        isDotOrLineOrAt = true;
        continue;
      }
      //_
      if (asciicode == 95) {
        if (i == 0) return false;
        if (isDotOrLineOrAt == true) return false;
        isDotOrLineOrAt = true;
        continue;
      }
      //@
      if (asciicode == 64) {
        if (i == 0) return false;
        if (isDotOrLineOrAt == true) return false;
        isDotOrLineOrAt = true;
        continue;
      }
      return false;
    }
    return true;
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

///
/// 用於獲取Text元件，並設定文本的樣式和屬性。
///
/// 參數：
///   text: 要顯示的文本內容
///   overflow: 文本溢出時的處理方式，默認為null
///   fontWeight: 字體的粗細，默認為FontWeight.w600
///   fontFamily: 字體的名稱，默認為"PingFang TC"
///   fontSize: 字體大小
///   textAlign: 文本的對齊方式，默認為null
///   color: 文本的顏色，默認為AppColors.primaryBlack
///   decoration: 文本的裝飾樣式，默認為null
///   height: 行高，默認為1.4
///   maxLines: 最大行數，默認為null
///
/// 返回值：
///   Text元件
///
Text getText(String text,
    {TextOverflow? overflow,
    FontWeight? fontWeight = FontWeight.w600,
    double? fontSize,
    TextAlign? textAlign,
    Color? color = AppColors.primaryBlack,
    TextDecoration? decoration,
    double? height = 1.4,
    int? maxLines = null}) {

  var fontFamily = Platform.isIOS ? "PingFangTC" : "NotoSansTC";
  return Text(text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
          decoration: decoration,
          color: color,
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          height: height));
}

///
/// 用於獲取Image元件，並設定其屬性。
///
/// 參數：
///   filename: 圖像文件名
///   width: 圖像的寬度
///   height: 圖像的高度
///   fit: 圖像適應方式，默認為null
///   alignment: 圖像對齊方式，默認為Alignment.center
///
/// 返回值：
///   Image.asset元件
///
Widget getImage(String filename,
    {double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center}) {
  return Image.asset(
    'assets/images/$filename',
    width: width,
    height: height,
    fit: fit,
    alignment: alignment,
  );
}

///
/// 用於獲取一個帶顏色濾鏡的圖像ICON，並設定其屬性。
///
/// 參數：
///   filename: 圖像文件名
///   width: 圖像的寬度
///   height: 圖像的高度
///   fit: 圖像適應方式，默認為null
///   color: 濾鏡顏色，默認為AppColors.appPrimaryBlue
///   alignment: 圖像對齊方式，默認為Alignment.center
///
/// 返回值：
///   ColorFiltered 小部件，包含著帶有顏色濾鏡的 Image.asset 元件
///
Widget getImageIcon(String filename,
    {double? width,
    double? height,
    BoxFit? fit,
    Color color = AppColors.appPrimaryBlue,
    AlignmentGeometry alignment = Alignment.center}) {
  return ColorFiltered(
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      child: Image.asset(
        'assets/images/$filename',
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
      ));
}

Widget getGestureImage(
  String filename, {
  double? width,
  double? height,
  BoxFit? fit,
  AlignmentGeometry alignment = Alignment.center,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Image.asset(
      'assets/images/$filename',
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
    ),
  );
}

Widget getGestureImageIcon(
  String filename, {
  double? width,
  double? height,
  BoxFit? fit,
  Color color = AppColors.appPrimaryBlue,
  AlignmentGeometry alignment = Alignment.center,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: ColorFiltered(
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        child: Image.asset(
          'assets/images/$filename',
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
        )),
  );
}

///
/// 根據指定的透明度將顏色進行調整，返回新的具有指定透明度的Color對象。
///
/// 參數：
///   color: 要調整透明度的顏色
///   opacity: 透明度值，取值範圍為0（完全透明）到1（完全不透明）
///
/// 返回值：
///   返回新的具有指定透明度的Color對象。
///
Color colorOpacity(Color color, double opacity) {
  // 將透明度轉換為0到255之間的整數值
  int alpha = (opacity * 255).round();
  // 獲取顏色的紅、綠、藍分量
  int red = color.red;
  int green = color.green;
  int blue = color.blue;
  // 返回具有指定透明度的新Color對象
  return Color.fromARGB(alpha, red, green, blue);
}

Widget getDashedLine({required Color color}) {
  return CustomPaint(
    painter: DashedLinePainter(color: color),
  );
}

class DashedLinePainter extends CustomPainter {
  final Color color;

  DashedLinePainter({this.color = Colors.grey});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color // 虛線的顏色
      ..strokeWidth = 1 // 虛線的寬度
      ..style = PaintingStyle.stroke;

    final dashWidth = 5; // 虛線的寬度
    final dashSpace = 5; // 虛線之間的間距

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

///
/// 將DateTime對象轉換為指定格式的日期時間字元串。
///
/// 格式化後的字元串格式為'yyyy-MM-dd HH:mm'。
///
/// 參數：
///   date: 要轉換的DateTime對象
///
/// 返回值：
///   返回指定格式的日期時間字元串。
///
String dateConvert(DateTime date) {
  return DateFormat('yyyy-MM-dd HH:mm').format(date);
}

///
/// 將個位數的整數轉換為帶有前導零的兩位數字串。
///
/// 如果輸入的數字串長度為1，則在其前面添加一個零，使其成為兩位數字串；
/// 如果輸入的數字串已經是兩位數字串，則保持不變。
///
/// 參數：
///   number: 要轉換的數字串
///
/// 返回值：
///   返回帶有前導零的兩位數字串。
///
String addLeadingZero(String number) {
  return number.padLeft(2, '0');
}

///
/// 將數值轉換為單位k或m。
///
/// 如果數值大於等於1000000，則將其轉換為以百萬（m）為單位的格式；
/// 如果數值大於等於1000但小於1000000，則將其轉換為以千（k）為單位的格式；
/// 否則保持不變。
///
/// 參數：
///   value: 要轉換的數值
///
/// 返回值：
///   返回轉換後的String，格式為帶有單位的數值（如'1.2m'或'500k'）或整數String。
///
String formatValue(double value) {
  const suffixes = ["", "k", "m", "b", "t", "q", "p"];
  int suffixIndex = 0;
  while (value >= 1000 && suffixIndex < suffixes.length - 1) {
    value /= 1000;
    suffixIndex++;
  }
  return (value % 1 == 0) ? value.toStringAsFixed(0) : value.toStringAsFixed(1);
}

String formatUnit(double value) {
  const suffixes = ["", "k", "m", "b", "t", "q", "p"];
  int suffixIndex = 0;
  while (value >= 1000 && suffixIndex < suffixes.length - 1) {
    value /= 1000;
    suffixIndex++;
  }
  return (value % 1 == 0) ? "" : suffixes[suffixIndex];
}

String getBatteryHealthStatus(int healthVal) {
  return (healthVal >= 30) ? AppTexts.good : AppTexts.abnormal;
}

String getBatteryOperatingStatus(int status1, int status2) {
  if (status1 == 1 && status2 == 0) {
    return AppTexts.charging;
  } else if (status1 == 0 && status2 == 1) {
    return AppTexts.inProgress;
  } else {
    return AppTexts.standby;
  }
}

void showToast(
    {required BuildContext context,
    String text = "",
    Color? backgroundColor = AppColors.primaryBlack,
    Color? textColor = AppColors.white,
    Alignment? alignment = Alignment.topCenter}) {
  toastification.show(
      context: context,
      type: ToastificationType.info,
      style: ToastificationStyle.simple,
      title: getText(text, fontSize: 12.sp, color: textColor),
      alignment: alignment,
      autoCloseDuration: const Duration(seconds: 2),
      backgroundColor: backgroundColor,
      primaryColor: backgroundColor,
      borderRadius: BorderRadius.circular(100.sp),
  );
}

Future<T?> customAlertPopUp<T>(BuildContext context, {Widget? child}) async {
  return await showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: child,
      );
    },
  );
}

String removeTimeColon(String time) {
  return time.replaceAll(':', '');
}

String addTimeColon(String time) {
  if (time.length != 4 || !RegExp(r'^\d{4}$').hasMatch(time)) {
    throw ArgumentError('Invalid time format. Expected 4 digits.');
  }

  final hours = time.substring(0, 2);
  final minutes = time.substring(2);

  return "$hours:$minutes";
}

///
/// 對密碼進行掩碼處理。
///
/// 將傳入的密碼字元串進行掩碼處理，用 '*' 替換每個字元。
///
/// 參數：
///   password: 要掩碼處理的密碼字串
///
/// 返回值：
///   掩碼處理後的密碼字元串，長度與原密碼相同，每個字元用 '*' 替換
///
String maskPassword(String password) {
  return '*' * password.length;
}

int convertTimezoneToSeconds(String? timezoneVal) {
  if (timezoneVal == null || timezoneVal.isEmpty) {
    return 0;
  }

  RegExp regex = RegExp(r'^\+?(\d+)$');
  Match? match = regex.firstMatch(timezoneVal);

  if (match != null) {
    String matchedValue = match.group(1)!;
    return int.tryParse(matchedValue) ?? 0;
  } else {
    return 0;
  }
}

///
/// 檢查字串中是否包含表情符號。
///
/// 該函數使用正則表達式來檢查傳入的字串是否包含任意表情符號。
///
/// 參數：
///   text: 要檢查的字串
///
/// 返回值：
///   如果字串中包含表情符號，返回 true；否則返回 false。
///
Iterable<RegExpMatch> containsEmoji(String text) {
  RegExp regex = RegExp(
    '/\uD83C\uDFF4\uDB40\uDC67\uDB40\uDC62(?:\uDB40\uDC77\uDB40\uDC6C\uDB40\uDC73|\uDB40\uDC73\uDB40\uDC63\uDB40\uDC74|\uDB40\uDC65\uDB40\uDC6E\uDB40\uDC67)\uDB40\uDC7F|(?:\uD83E\uDDD1\uD83C\uDFFF\u200D\u2764(?:\uFE0F\u200D(?:\uD83D\uDC8B\u200D)?|\u200D(?:\uD83D\uDC8B\u200D)?)\uD83E\uDDD1|\uD83D\uDC69\uD83C\uDFFF\u200D\uD83E\uDD1D\u200D(?:\uD83D[\uDC68\uDC69])|\uD83E\uDEF1\uD83C\uDFFF\u200D\uD83E\uDEF2)(?:\uD83C[\uDFFB-\uDFFE])|(?:\uD83E\uDDD1\uD83C\uDFFE\u200D\u2764(?:\uFE0F\u200D(?:\uD83D\uDC8B\u200D)?|\u200D(?:\uD83D\uDC8B\u200D)?)\uD83E\uDDD1|\uD83D\uDC69\uD83C\uDFFE\u200D\uD83E\uDD1D\u200D(?:\uD83D[\uDC68\uDC69])|\uD83E\uDEF1\uD83C\uDFFE\u200D\uD83E\uDEF2)(?:\uD83C[\uDFFB-\uDFFD\uDFFF])|(?:\uD83E\uDDD1\uD83C\uDFFD\u200D\u2764(?:\uFE0F\u200D(?:\uD83D\uDC8B\u200D)?|\u200D(?:\uD83D\uDC8B\u200D)?)\uD83E\uDDD1|\uD83D\uDC69\uD83C\uDFFD\u200D\uD83E\uDD1D\u200D(?:\uD83D[\uDC68\uDC69])|\uD83E\uDEF1\uD83C\uDFFD\u200D\uD83E\uDEF2)(?:\uD83C[\uDFFB\uDFFC\uDFFE\uDFFF])|(?:\uD83E\uDDD1\uD83C\uDFFC\u200D\u2764(?:\uFE0F\u200D(?:\uD83D\uDC8B\u200D)?|\u200D(?:\uD83D\uDC8B\u200D)?)\uD83E\uDDD1|\uD83D\uDC69\uD83C\uDFFC\u200D\uD83E\uDD1D\u200D(?:\uD83D[\uDC68\uDC69])|\uD83E\uDEF1\uD83C\uDFFC\u200D\uD83E\uDEF2)(?:\uD83C[\uDFFB\uDFFD-\uDFFF])|(?:\uD83E\uDDD1\uD83C\uDFFB\u200D\u2764(?:\uFE0F\u200D(?:\uD83D\uDC8B\u200D)?|\u200D(?:\uD83D\uDC8B\u200D)?)\uD83E\uDDD1|\uD83D\uDC69\uD83C\uDFFB\u200D\uD83E\uDD1D\u200D(?:\uD83D[\uDC68\uDC69])|\uD83E\uDEF1\uD83C\uDFFB\u200D\uD83E\uDEF2)(?:\uD83C[\uDFFC-\uDFFF])|\uD83D\uDC68(?:\uD83C\uDFFB(?:\u200D(?:\u2764(?:\uFE0F\u200D(?:\uD83D\uDC8B\u200D\uD83D\uDC68(?:\uD83C[\uDFFB-\uDFFF])|\uD83D\uDC68(?:\uD83C[\uDFFB-\uDFFF]))|\u200D(?:\uD83D\uDC8B\u200D\uD83D\uDC68(?:\uD83C[\uDFFB-\uDFFF])|\uD83D\uDC68(?:\uD83C[\uDFFB-\uDFFF])))|\uD83E\uDD1D\u200D\uD83D\uDC68(?:\uD83C[\uDFFC-\uDFFF])|[\u2695\u2696\u2708]\uFE0F|[\u2695\u2696\u2708]|\uD83C[\uDF3E\uDF73\uDF7C\uDF93\uDFA4\uDFA8\uDFEB\uDFED]|\uD83D[\uDCBB\uDCBC\uDD27\uDD2C\uDE80\uDE92]|\uD83E[\uDDAF-\uDDB3\uDDBC\uDDBD]))?|(?:\uD83C[\uDFFC-\uDFFF])\u200D\u2764(?:\uFE0F\u200D(?:\uD83D\uDC8B\u200D\uD83D\uDC68(?:\uD83C[\uDFFB-\uDFFF])|\uD83D\uDC68(?:\uD83C[\uDFFB-\uDFFF]))|\u200D(?:\uD83D\uDC8B\u200D\uD83D\uDC68(?:\uD83C[\uDFFB-\uDFFF])|\uD83D\uDC68(?:\uD83C[\uDFFB-\uDFFF])))|\u200D(?:\u2764(?:\uFE0F\u200D(?:\uD83D\uDC8B\u200D)?|\u200D(?:\uD83D\uDC8B\u200D)?)\uD83D\uDC68|(?:\uD83D[\uDC68\uDC69])\u200D(?:\uD83D\uDC66\u200D\uD83D\uDC66|\uD83D\uDC67\u200D(?:\uD83D[\uDC66\uDC67]))|\uD83D\uDC66\u200D\uD83D\uDC66|\uD83D\uDC67\u200D(?:\uD83D[\uDC66\uDC67])|\uD83C[\uDF3E\uDF73\uDF7C\uDF93\uDFA4\uDFA8\uDFEB\uDFED]|\uD83D[\uDCBB\uDCBC\uDD27\uDD2C\uDE80\uDE92]|\uD83E[\uDDAF-\uDDB3\uDDBC\uDDBD])|\uD83C\uDFFF\u200D(?:\uD83E\uDD1D\u200D\uD83D\uDC68(?:\uD83C[\uDFFB-\uDFFE])|\uD83C[\uDF3E\uDF73\uDF7C\uDF93\uDFA4\uDFA8\uDFEB\uDFED]|\uD83D[\uDCBB\uDCBC\uDD27\uDD2C\uDE80\uDE92]|\uD83E[\uDDAF-\uDDB3\uDDBC\uDDBD])|\uD83C\uDFFE\u200D(?:\uD83E\uDD1D\u200D\uD83D\uDC68(?:\uD83C[\uDFFB-\uDFFD\uDFFF])|\uD83C[\uDF3E\uDF73\uDF7C\uDF93\uDFA4\uDFA8\uDFEB\uDFED]|\uD83D[\uDCBB\uDCBC\uDD27\uDD2C\uDE80\uDE92]|\uD83E[\uDDAF-\uDDB3\uDDBC\uDDBD])|\uD83C\uDFFD\u200D(?:\uD83E\uDD1D\u200D\uD83D\uDC68(?:\uD83C[\uDFFB\uDFFC\uDFFE\uDFFF])|\uD83C[\uDF3E\uDF73\uDF7C\uDF93\uDFA4\uDFA8\uDFEB\uDFED]|\uD83D[\uDCBB\uDCBC\uDD27\uDD2C\uDE80\uDE92]|\uD83E[\uDDAF-\uDDB3\uDDBC\uDDBD])|\uD83C\uDFFC\u200D(?:\uD83E\uDD1D\u200D\uD83D\uDC68(?:\uD83C[\uDFFB\uDFFD-\uDFFF])|\uD83C[\uDF3E\uDF73\uDF7C\uDF93\uDFA4\uDFA8\uDFEB\uDFED]|\uD83D[\uDCBB\uDCBC\uDD27\uDD2C\uDE80\uDE92]|\uD83E[\uDDAF-\uDDB3\uDDBC\uDDBD])|(?:\uD83C\uDFFF\u200D[\u2695\u2696\u2708]|\uD83C\uDFFE\u200D[\u2695\u2696\u2708]|\uD83C\uDFFD\u200D[\u2695\u2696\u2708]|\uD83C\uDFFC\u200D[\u2695\u2696\u2708]|\u200D[\u2695\u2696\u2708])\uFE0F|\u200D(?:(?:\uD83D[\uDC68\uDC69])\u200D(?:\uD83D[\uDC66\uDC67])|\uD83D[\uDC66\uDC67])|\uD83C\uDFFF\u200D[\u2695\u2696\u2708]|\uD83C\uDFFE\u200D[\u2695\u2696\u2708]|\uD83C\uDFFD\u200D[\u2695\u2696\u2708]|\uD83C\uDFFC\u200D[\u2695\u2696\u2708]|\uD83C\uDFFF|\uD83C\uDFFE|\uD83C\uDFFD|\uD83C\uDFFC|\u200D[\u2695\u2696\u2708])?|(?:\uD83D\uDC69(?:\uD83C\uDFFB\u200D\u2764(?:\uFE0F\u200D(?:\uD83D\uDC8B\u200D(?:\uD83D[\uDC68\uDC69])|\uD83D[\uDC68\uDC69])|\u200D(?:\uD83D\uDC8B\u200D(?:\uD83D[\uDC68\uDC69])|\uD83D[\uDC68\uDC69]))|(?:\uD83C[\uDFFC-\uDFFF])\u200D\u2764(?:\uFE0F\u200D(?:\uD83D\uDC8B\u200D(?:\uD83D[\uDC68\uDC69])|\uD83D[\uDC68\uDC69])|\u200D(?:\uD83D\uDC8B\u200D(?:\uD83D[\uDC68\uDC69])|\uD83D[\uDC68\uDC69])))|\uD83E\uDDD1(?:\uD83C[\uDFFB-\uDFFF])\u200D\uD83E\uDD1D\u200D\uD83E\uDDD1)(?:\uD83C[\uDFFB-\uDFFF])|\uD83D\uDC69\u200D\uD83D\uDC69\u200D(?:\uD83D\uDC66\u200D\uD83D\uDC66|\uD83D\uDC67\u200D(?:\uD83D[\uDC66\uDC67]))|\uD83D\uDC69(?:\u200D(?:\u2764(?:\uFE0F\u200D(?:\uD83D\uDC8B\u200D(?:\uD83D[\uDC68\uDC69])|\uD83D[\uDC68\uDC69])|\u200D(?:\uD83D\uDC8B\u200D(?:\uD83D[\uDC68\uDC69])|\uD83D[\uDC68\uDC69]))|\uD83C[\uDF3E\uDF73\uDF7C\uDF93\uDFA4\uDFA8\uDFEB\uDFED]|\uD83D[\uDCBB\uDCBC\uDD27\uDD2C\uDE80\uDE92]|\uD83E[\uDDAF-\uDDB3\uDDBC\uDDBD])|\uD83C\uDFFF\u200D(?:\uD83C[\uDF3E\uDF73\uDF7C\uDF93\uDFA4\uDFA8\uDFEB\uDFED]|\uD83D[\uDCBB\uDCBC\uDD27\uDD2C\uDE80\uDE92]|\uD83E[\uDDAF-\uDDB3\uDDBC\uDDBD])|\uD83C\uDFFE\u200D(?:\uD83C[\uDF3E\uDF73\uDF7C\uDF93\uDFA4\uDFA8\uDFEB\uDFED]|\uD83D[\uDCBB\uDCBC\uDD27\uDD2C\uDE80\uDE92]|\uD83E[\uDDAF-\uDDB3\uDDBC\uDDBD])|\uD83C\uDFFD\u200D(?:\uD83C[\uDF3E\uDF73\uDF7C\uDF93\uDFA4\uDFA8\uDFEB\uDFED]|\uD83D[\uDCBB\uDCBC\uDD27\uDD2C\uDE80\uDE92]|\uD83E[\uDDAF-\uDDB3\uDDBC\uDDBD])|\uD83C\uDFFC\u200D(?:\uD83C[\uDF3E\uDF73\uDF7C\uDF93\uDFA4\uDFA8\uDFEB\uDFED]|\uD83D[\uDCBB\uDCBC\uDD27\uDD2C\uDE80\uDE92]|\uD83E[\uDDAF-\uDDB3\uDDBC\uDDBD])|\uD83C\uDFFB\u200D(?:\uD83C[\uDF3E\uDF73\uDF7C\uDF93\uDFA4\uDFA8\uDFEB\uDFED]|\uD83D[\uDCBB\uDCBC\uDD27\uDD2C\uDE80\uDE92]|\uD83E[\uDDAF-\uDDB3\uDDBC\uDDBD]))|\uD83E\uDDD1(?:\u200D(?:\uD83E\uDD1D\u200D\uD83E\uDDD1|\uD83C[\uDF3E\uDF73\uDF7C\uDF84\uDF93\uDFA4\uDFA8\uDFEB\uDFED]|\uD83D[\uDCBB\uDCBC\uDD27\uDD2C\uDE80\uDE92]|\uD83E[\uDDAF-\uDDB3\uDDBC\uDDBD])|\uD83C\uDFFF\u200D(?:\uD83C[\uDF3E\uDF73\uDF7C\uDF84\uDF93\uDFA4\uDFA8\uDFEB\uDFED]|\uD83D[\uDCBB\uDCBC\uDD27\uDD2C\uDE80\uDE92]|\uD83E[\uDDAF-\uDDB3\uDDBC\uDDBD])|\uD83C\uDFFE\u200D(?:\uD83C[\uDF3E\uDF73\uDF7C\uDF84\uDF93\uDFA4\uDFA8\uDFEB\uDFED]|\uD83D[\uDCBB\uDCBC\uDD27\uDD2C\uDE80\uDE92]|\uD83E[\uDDAF-\uDDB3\uDDBC\uDDBD])|\uD83C\uDFFD\u200D(?:\uD83C[\uDF3E\uDF73\uDF7C\uDF84\uDF93\uDFA4\uDFA8\uDFEB\uDFED]|\uD83D[\uDCBB\uDCBC\uDD27\uDD2C\uDE80\uDE92]|\uD83E[\uDDAF-\uDDB3\uDDBC\uDDBD])|\uD83C\uDFFC\u200D(?:\uD83C[\uDF3E\uDF73\uDF7C\uDF84\uDF93\uDFA4\uDFA8\uDFEB\uDFED]|\uD83D[\uDCBB\uDCBC\uDD27\uDD2C\uDE80\uDE92]|\uD83E[\uDDAF-\uDDB3\uDDBC\uDDBD])|\uD83C\uDFFB\u200D(?:\uD83C[\uDF3E\uDF73\uDF7C\uDF84\uDF93\uDFA4\uDFA8\uDFEB\uDFED]|\uD83D[\uDCBB\uDCBC\uDD27\uDD2C\uDE80\uDE92]|\uD83E[\uDDAF-\uDDB3\uDDBC\uDDBD]))|\uD83D\uDC69\u200D\uD83D\uDC66\u200D\uD83D\uDC66|\uD83D\uDC69\u200D\uD83D\uDC69\u200D(?:\uD83D[\uDC66\uDC67])|\uD83D\uDC69\u200D\uD83D\uDC67\u200D(?:\uD83D[\uDC66\uDC67])|(?:\uD83D\uDC41\uFE0F?\u200D\uD83D\uDDE8|\uD83E\uDDD1(?:\uD83C\uDFFF\u200D[\u2695\u2696\u2708]|\uD83C\uDFFE\u200D[\u2695\u2696\u2708]|\uD83C\uDFFD\u200D[\u2695\u2696\u2708]|\uD83C\uDFFC\u200D[\u2695\u2696\u2708]|\uD83C\uDFFB\u200D[\u2695\u2696\u2708]|\u200D[\u2695\u2696\u2708])|\uD83D\uDC69(?:\uD83C\uDFFF\u200D[\u2695\u2696\u2708]|\uD83C\uDFFE\u200D[\u2695\u2696\u2708]|\uD83C\uDFFD\u200D[\u2695\u2696\u2708]|\uD83C\uDFFC\u200D[\u2695\u2696\u2708]|\uD83C\uDFFB\u200D[\u2695\u2696\u2708]|\u200D[\u2695\u2696\u2708])|\uD83D\uDE36\u200D\uD83C\uDF2B|\uD83C\uDFF3\uFE0F?\u200D\u26A7|\uD83D\uDC3B\u200D\u2744|(?:(?:\uD83C[\uDFC3\uDFC4\uDFCA]|\uD83D[\uDC6E\uDC70\uDC71\uDC73\uDC77\uDC81\uDC82\uDC86\uDC87\uDE45-\uDE47\uDE4B\uDE4D\uDE4E\uDEA3\uDEB4-\uDEB6]|\uD83E[\uDD26\uDD35\uDD37-\uDD39\uDD3D\uDD3E\uDDB8\uDDB9\uDDCD-\uDDCF\uDDD4\uDDD6-\uDDDD])(?:\uD83C[\uDFFB-\uDFFF])|\uD83D\uDC6F|\uD83E[\uDDDE\uDDDF])\u200D[\u2640\u2642]|(?:\u26F9|\uD83C[\uDFCB\uDFCC]|\uD83D\uDD75)(?:(?:\uFE0F|\uD83C[\uDFFB-\uDFFF])\u200D[\u2640\u2642]|\u200D[\u2640\u2642])|\uD83C\uDFF4\u200D\u2620|(?:\uD83C[\uDFC3\uDFC4\uDFCA]|\uD83D[\uDC6E\uDC70\uDC71\uDC73\uDC77\uDC81\uDC82\uDC86\uDC87\uDE45-\uDE47\uDE4B\uDE4D\uDE4E\uDEA3\uDEB4-\uDEB6]|\uD83E[\uDD26\uDD35\uDD37-\uDD39\uDD3C-\uDD3E\uDDB8\uDDB9\uDDCD-\uDDCF\uDDD4\uDDD6-\uDDDD])\u200D[\u2640\u2642]|[\xA9\xAE\u203C\u2049\u2122\u2139\u2194-\u2199\u21A9\u21AA\u231A\u231B\u2328\u23CF\u23ED-\u23EF\u23F1\u23F2\u23F8-\u23FA\u24C2\u25AA\u25AB\u25B6\u25C0\u25FB\u25FC\u25FE\u2600-\u2604\u260E\u2611\u2614\u2615\u2618\u2620\u2622\u2623\u2626\u262A\u262E\u262F\u2638-\u263A\u2640\u2642\u2648-\u2653\u265F\u2660\u2663\u2665\u2666\u2668\u267B\u267E\u267F\u2692\u2694-\u2697\u2699\u269B\u269C\u26A0\u26A7\u26AA\u26B0\u26B1\u26BD\u26BE\u26C4\u26C8\u26CF\u26D1\u26D3\u26E9\u26F0-\u26F5\u26F7\u26F8\u26FA\u2702\u2708\u2709\u270F\u2712\u2714\u2716\u271D\u2721\u2733\u2734\u2744\u2747\u2757\u2763\u27A1\u2934\u2935\u2B05-\u2B07\u2B1B\u2B1C\u2B55\u3030\u303D\u3297\u3299]|\uD83C[\uDC04\uDD70\uDD71\uDD7E\uDD7F\uDE02\uDE37\uDF21\uDF24-\uDF2C\uDF36\uDF7D\uDF96\uDF97\uDF99-\uDF9B\uDF9E\uDF9F\uDFCD\uDFCE\uDFD4-\uDFDF\uDFF5\uDFF7]|\uD83D[\uDC3F\uDCFD\uDD49\uDD4A\uDD6F\uDD70\uDD73\uDD76-\uDD79\uDD87\uDD8A-\uDD8D\uDDA5\uDDA8\uDDB1\uDDB2\uDDBC\uDDC2-\uDDC4\uDDD1-\uDDD3\uDDDC-\uDDDE\uDDE1\uDDE3\uDDE8\uDDEF\uDDF3\uDDFA\uDECB\uDECD-\uDECF\uDEE0-\uDEE5\uDEE9\uDEF0\uDEF3])\uFE0F|\uD83D\uDC41\uFE0F?\u200D\uD83D\uDDE8|\uD83E\uDDD1(?:\uD83C\uDFFF\u200D[\u2695\u2696\u2708]|\uD83C\uDFFE\u200D[\u2695\u2696\u2708]|\uD83C\uDFFD\u200D[\u2695\u2696\u2708]|\uD83C\uDFFC\u200D[\u2695\u2696\u2708]|\uD83C\uDFFB\u200D[\u2695\u2696\u2708]|\u200D[\u2695\u2696\u2708])|\uD83D\uDC69(?:\uD83C\uDFFF\u200D[\u2695\u2696\u2708]|\uD83C\uDFFE\u200D[\u2695\u2696\u2708]|\uD83C\uDFFD\u200D[\u2695\u2696\u2708]|\uD83C\uDFFC\u200D[\u2695\u2696\u2708]|\uD83C\uDFFB\u200D[\u2695\u2696\u2708]|\u200D[\u2695\u2696\u2708])|\uD83C\uDFF3\uFE0F?\u200D\uD83C\uDF08|\uD83D\uDC69\u200D\uD83D\uDC67|\uD83D\uDC69\u200D\uD83D\uDC66|\uD83D\uDE36\u200D\uD83C\uDF2B|\uD83C\uDFF3\uFE0F?\u200D\u26A7|\uD83D\uDE35\u200D\uD83D\uDCAB|\uD83D\uDE2E\u200D\uD83D\uDCA8|\uD83D\uDC15\u200D\uD83E\uDDBA|\uD83E\uDEF1(?:\uD83C\uDFFF|\uD83C\uDFFE|\uD83C\uDFFD|\uD83C\uDFFC|\uD83C\uDFFB)?|\uD83E\uDDD1(?:\uD83C\uDFFF|\uD83C\uDFFE|\uD83C\uDFFD|\uD83C\uDFFC|\uD83C\uDFFB)?|\uD83D\uDC69(?:\uD83C\uDFFF|\uD83C\uDFFE|\uD83C\uDFFD|\uD83C\uDFFC|\uD83C\uDFFB)?|\uD83D\uDC3B\u200D\u2744|(?:(?:\uD83C[\uDFC3\uDFC4\uDFCA]|\uD83D[\uDC6E\uDC70\uDC71\uDC73\uDC77\uDC81\uDC82\uDC86\uDC87\uDE45-\uDE47\uDE4B\uDE4D\uDE4E\uDEA3\uDEB4-\uDEB6]|\uD83E[\uDD26\uDD35\uDD37-\uDD39\uDD3D\uDD3E\uDDB8\uDDB9\uDDCD-\uDDCF\uDDD4\uDDD6-\uDDDD])(?:\uD83C[\uDFFB-\uDFFF])|\uD83D\uDC6F|\uD83E[\uDDDE\uDDDF])\u200D[\u2640\u2642]|(?:\u26F9|\uD83C[\uDFCB\uDFCC]|\uD83D\uDD75)(?:(?:\uFE0F|\uD83C[\uDFFB-\uDFFF])\u200D[\u2640\u2642]|\u200D[\u2640\u2642])|\uD83C\uDFF4\u200D\u2620|\uD83C\uDDFD\uD83C\uDDF0|\uD83C\uDDF6\uD83C\uDDE6|\uD83C\uDDF4\uD83C\uDDF2|\uD83D\uDC08\u200D\u2B1B|\u2764(?:\uFE0F\u200D(?:\uD83D\uDD25|\uD83E\uDE79)|\u200D(?:\uD83D\uDD25|\uD83E\uDE79))|\uD83D\uDC41\uFE0F?|\uD83C\uDFF3\uFE0F?|(?:\uD83C[\uDFC3\uDFC4\uDFCA]|\uD83D[\uDC6E\uDC70\uDC71\uDC73\uDC77\uDC81\uDC82\uDC86\uDC87\uDE45-\uDE47\uDE4B\uDE4D\uDE4E\uDEA3\uDEB4-\uDEB6]|\uD83E[\uDD26\uDD35\uDD37-\uDD39\uDD3C-\uDD3E\uDDB8\uDDB9\uDDCD-\uDDCF\uDDD4\uDDD6-\uDDDD])\u200D[\u2640\u2642]|\uD83C\uDDFF(?:\uD83C[\uDDE6\uDDF2\uDDFC])|\uD83C\uDDFE(?:\uD83C[\uDDEA\uDDF9])|\uD83C\uDDFC(?:\uD83C[\uDDEB\uDDF8])|\uD83C\uDDFB(?:\uD83C[\uDDE6\uDDE8\uDDEA\uDDEC\uDDEE\uDDF3\uDDFA])|\uD83C\uDDFA(?:\uD83C[\uDDE6\uDDEC\uDDF2\uDDF3\uDDF8\uDDFE\uDDFF])|\uD83C\uDDF9(?:\uD83C[\uDDE6\uDDE8\uDDE9\uDDEB-\uDDED\uDDEF-\uDDF4\uDDF7\uDDF9\uDDFB\uDDFC\uDDFF])|\uD83C\uDDF8(?:\uD83C[\uDDE6-\uDDEA\uDDEC-\uDDF4\uDDF7-\uDDF9\uDDFB\uDDFD-\uDDFF])|\uD83C\uDDF7(?:\uD83C[\uDDEA\uDDF4\uDDF8\uDDFA\uDDFC])|\uD83C\uDDF5(?:\uD83C[\uDDE6\uDDEA-\uDDED\uDDF0-\uDDF3\uDDF7-\uDDF9\uDDFC\uDDFE])|\uD83C\uDDF3(?:\uD83C[\uDDE6\uDDE8\uDDEA-\uDDEC\uDDEE\uDDF1\uDDF4\uDDF5\uDDF7\uDDFA\uDDFF])|\uD83C\uDDF2(?:\uD83C[\uDDE6\uDDE8-\uDDED\uDDF0-\uDDFF])|\uD83C\uDDF1(?:\uD83C[\uDDE6-\uDDE8\uDDEE\uDDF0\uDDF7-\uDDFB\uDDFE])|\uD83C\uDDF0(?:\uD83C[\uDDEA\uDDEC-\uDDEE\uDDF2\uDDF3\uDDF5\uDDF7\uDDFC\uDDFE\uDDFF])|\uD83C\uDDEF(?:\uD83C[\uDDEA\uDDF2\uDDF4\uDDF5])|\uD83C\uDDEE(?:\uD83C[\uDDE8-\uDDEA\uDDF1-\uDDF4\uDDF6-\uDDF9])|\uD83C\uDDED(?:\uD83C[\uDDF0\uDDF2\uDDF3\uDDF7\uDDF9\uDDFA])|\uD83C\uDDEC(?:\uD83C[\uDDE6\uDDE7\uDDE9-\uDDEE\uDDF1-\uDDF3\uDDF5-\uDDFA\uDDFC\uDDFE])|\uD83C\uDDEB(?:\uD83C[\uDDEE-\uDDF0\uDDF2\uDDF4\uDDF7])|\uD83C\uDDEA(?:\uD83C[\uDDE6\uDDE8\uDDEA\uDDEC\uDDED\uDDF7-\uDDFA])|\uD83C\uDDE9(?:\uD83C[\uDDEA\uDDEC\uDDEF\uDDF0\uDDF2\uDDF4\uDDFF])|\uD83C\uDDE8(?:\uD83C[\uDDE6\uDDE8\uDDE9\uDDEB-\uDDEE\uDDF0-\uDDF5\uDDF7\uDDFA-\uDDFF])|\uD83C\uDDE7(?:\uD83C[\uDDE6\uDDE7\uDDE9-\uDDEF\uDDF1-\uDDF4\uDDF6-\uDDF9\uDDFB\uDDFC\uDDFE\uDDFF])|\uD83C\uDDE6(?:\uD83C[\uDDE8-\uDDEC\uDDEE\uDDF1\uDDF2\uDDF4\uDDF6-\uDDFA\uDDFC\uDDFD\uDDFF])|[#\*0-9]\uFE0F?\u20E3|\uD83E\uDD3C(?:\uD83C[\uDFFB-\uDFFF])|\u2764\uFE0F?|(?:\uD83C[\uDFC3\uDFC4\uDFCA]|\uD83D[\uDC6E\uDC70\uDC71\uDC73\uDC77\uDC81\uDC82\uDC86\uDC87\uDE45-\uDE47\uDE4B\uDE4D\uDE4E\uDEA3\uDEB4-\uDEB6]|\uD83E[\uDD26\uDD35\uDD37-\uDD39\uDD3D\uDD3E\uDDB8\uDDB9\uDDCD-\uDDCF\uDDD4\uDDD6-\uDDDD])(?:\uD83C[\uDFFB-\uDFFF])|(?:\u26F9|\uD83C[\uDFCB\uDFCC]|\uD83D\uDD75)(?:\uFE0F|\uD83C[\uDFFB-\uDFFF])?|\uD83C\uDFF4|(?:[\u270A\u270B]|\uD83C[\uDF85\uDFC2\uDFC7]|\uD83D[\uDC42\uDC43\uDC46-\uDC50\uDC66\uDC67\uDC6B-\uDC6D\uDC72\uDC74-\uDC76\uDC78\uDC7C\uDC83\uDC85\uDC8F\uDC91\uDCAA\uDD7A\uDD95\uDD96\uDE4C\uDE4F\uDEC0\uDECC]|\uD83E[\uDD0C\uDD0F\uDD18-\uDD1F\uDD30-\uDD34\uDD36\uDD77\uDDB5\uDDB6\uDDBB\uDDD2\uDDD3\uDDD5\uDEC3-\uDEC5\uDEF0\uDEF2-\uDEF6])(?:\uD83C[\uDFFB-\uDFFF])|(?:[\u261D\u270C\u270D]|\uD83D[\uDD74\uDD90])(?:\uFE0F|\uD83C[\uDFFB-\uDFFF])|[\u261D\u270A-\u270D]|\uD83C[\uDF85\uDFC2\uDFC7]|\uD83D[\uDC08\uDC15\uDC3B\uDC42\uDC43\uDC46-\uDC50\uDC66\uDC67\uDC6B-\uDC6D\uDC72\uDC74-\uDC76\uDC78\uDC7C\uDC83\uDC85\uDC8F\uDC91\uDCAA\uDD74\uDD7A\uDD90\uDD95\uDD96\uDE2E\uDE35\uDE36\uDE4C\uDE4F\uDEC0\uDECC]|\uD83E[\uDD0C\uDD0F\uDD18-\uDD1F\uDD30-\uDD34\uDD36\uDD3C\uDD77\uDDB5\uDDB6\uDDBB\uDDD2\uDDD3\uDDD5\uDEC3-\uDEC5\uDEF0\uDEF2-\uDEF6]|\uD83C[\uDFC3\uDFC4\uDFCA]|\uD83D[\uDC6E\uDC70\uDC71\uDC73\uDC77\uDC81\uDC82\uDC86\uDC87\uDE45-\uDE47\uDE4B\uDE4D\uDE4E\uDEA3\uDEB4-\uDEB6]|\uD83E[\uDD26\uDD35\uDD37-\uDD39\uDD3D\uDD3E\uDDB8\uDDB9\uDDCD-\uDDCF\uDDD4\uDDD6-\uDDDD]|\uD83D\uDC6F|\uD83E[\uDDDE\uDDDF]|[\xA9\xAE\u203C\u2049\u2122\u2139\u2194-\u2199\u21A9\u21AA\u231A\u231B\u2328\u23CF\u23ED-\u23EF\u23F1\u23F2\u23F8-\u23FA\u24C2\u25AA\u25AB\u25B6\u25C0\u25FB\u25FC\u25FE\u2600-\u2604\u260E\u2611\u2614\u2615\u2618\u2620\u2622\u2623\u2626\u262A\u262E\u262F\u2638-\u263A\u2640\u2642\u2648-\u2653\u265F\u2660\u2663\u2665\u2666\u2668\u267B\u267E\u267F\u2692\u2694-\u2697\u2699\u269B\u269C\u26A0\u26A7\u26AA\u26B0\u26B1\u26BD\u26BE\u26C4\u26C8\u26CF\u26D1\u26D3\u26E9\u26F0-\u26F5\u26F7\u26F8\u26FA\u2702\u2708\u2709\u270F\u2712\u2714\u2716\u271D\u2721\u2733\u2734\u2744\u2747\u2757\u2763\u27A1\u2934\u2935\u2B05-\u2B07\u2B1B\u2B1C\u2B55\u3030\u303D\u3297\u3299]|\uD83C[\uDC04\uDD70\uDD71\uDD7E\uDD7F\uDE02\uDE37\uDF21\uDF24-\uDF2C\uDF36\uDF7D\uDF96\uDF97\uDF99-\uDF9B\uDF9E\uDF9F\uDFCD\uDFCE\uDFD4-\uDFDF\uDFF5\uDFF7]|\uD83D[\uDC3F\uDCFD\uDD49\uDD4A\uDD6F\uDD70\uDD73\uDD76-\uDD79\uDD87\uDD8A-\uDD8D\uDDA5\uDDA8\uDDB1\uDDB2\uDDBC\uDDC2-\uDDC4\uDDD1-\uDDD3\uDDDC-\uDDDE\uDDE1\uDDE3\uDDE8\uDDEF\uDDF3\uDDFA\uDECB\uDECD-\uDECF\uDEE0-\uDEE5\uDEE9\uDEF0\uDEF3]|[\u23E9-\u23EC\u23F0\u23F3\u25FD\u2693\u26A1\u26AB\u26C5\u26CE\u26D4\u26EA\u26FD\u2705\u2728\u274C\u274E\u2753-\u2755\u2795-\u2797\u27B0\u27BF\u2B50]|\uD83C[\uDCCF\uDD8E\uDD91-\uDD9A\uDE01\uDE1A\uDE2F\uDE32-\uDE36\uDE38-\uDE3A\uDE50\uDE51\uDF00-\uDF20\uDF2D-\uDF35\uDF37-\uDF7C\uDF7E-\uDF84\uDF86-\uDF93\uDFA0-\uDFC1\uDFC5\uDFC6\uDFC8\uDFC9\uDFCF-\uDFD3\uDFE0-\uDFF0\uDFF8-\uDFFF]|\uD83D[\uDC00-\uDC07\uDC09-\uDC14\uDC16-\uDC3A\uDC3C-\uDC3E\uDC40\uDC44\uDC45\uDC51-\uDC65\uDC6A\uDC79-\uDC7B\uDC7D-\uDC80\uDC84\uDC88-\uDC8E\uDC90\uDC92-\uDCA9\uDCAB-\uDCFC\uDCFF-\uDD3D\uDD4B-\uDD4E\uDD50-\uDD67\uDDA4\uDDFB-\uDE2D\uDE2F-\uDE34\uDE37-\uDE44\uDE48-\uDE4A\uDE80-\uDEA2\uDEA4-\uDEB3\uDEB7-\uDEBF\uDEC1-\uDEC5\uDED0-\uDED2\uDED5-\uDED7\uDEDD-\uDEDF\uDEEB\uDEEC\uDEF4-\uDEFC\uDFE0-\uDFEB\uDFF0]|\uD83E[\uDD0D\uDD0E\uDD10-\uDD17\uDD20-\uDD25\uDD27-\uDD2F\uDD3A\uDD3F-\uDD45\uDD47-\uDD76\uDD78-\uDDB4\uDDB7\uDDBA\uDDBC-\uDDCC\uDDD0\uDDE0-\uDDFF\uDE70-\uDE74\uDE78-\uDE7C\uDE80-\uDE86\uDE90-\uDEAC\uDEB0-\uDEBA\uDEC0-\uDEC2\uDED0-\uDED9\uDEE0-\uDEE7]',
  );
  return regex.allMatches(text);
}

String formatModeTime(String? time, {String defaultText = "－"}) {
  if (time == null) {
    return defaultText;
  }

  if (time.length == 4) {
    // 將"HHmm"格式轉為"HH:mm"
    return "${time.substring(0, 2)}:${time.substring(2)}";
  }

  // 如果格式不符合，回傳預設值
  return defaultText;
}

Tuple2<int, int> findClosestTimeIndex(String? startTime, String? endTime) {
  bool isValidTime(String? time) => time != null && time.length == 4 && RegExp(r'^\d{4}$').hasMatch(time);

  if (!isValidTime(startTime) || !isValidTime(endTime)) {
    return const Tuple2(-1, -1);
  }

  int findClosestIndex(String time) {
    int timeToMinutes(String t) {
      int hours = int.parse(t.substring(0, 2));
      int minutes = int.parse(t.substring(2, 4));
      return hours * 60 + minutes;
    }

    int targetMinutes = timeToMinutes(time);
    int closestIndex = 0;
    int smallestDifference = double.maxFinite.toInt();

    for (int i = 0; i < timeList.length; i++) {
      int currentMinutes = timeToMinutes(timeList[i]);
      int difference = (currentMinutes - targetMinutes).abs();

      if (difference < smallestDifference) {
        smallestDifference = difference;
        closestIndex = i;
      }
    }

    return closestIndex;
  }

  int startIndex = findClosestIndex(startTime!);
  int endIndex = findClosestIndex(endTime!);

  // 處理索引相同的情況
  if (startIndex == endIndex) {
    if (endIndex == timeList.length - 1) {
      startIndex = timeList.length - 2;
    } else {
      endIndex++;
    }
  }

  return Tuple2(startIndex, endIndex);
}