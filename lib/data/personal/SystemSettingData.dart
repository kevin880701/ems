class SystemSettingData {
  final String title;
  final String settingPage;
  final List<SystemSettingItem> systemSettingItems;


  SystemSettingData({required this.title,required this.settingPage, required this.systemSettingItems});
}

class SystemSettingItem {
  final String subTitle;
  int isShowType = 0; // 用於判斷要顯示內容，0:開啟中/關閉中;1:箭頭;2:version
  bool? isOpening = false;

  SystemSettingItem({
    required this.subTitle,
    required this.isShowType,
    this.isOpening,
  });
}
