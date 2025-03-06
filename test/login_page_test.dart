import 'package:ems_app/main.dart';
import 'package:ems_app/screen/LaunchScreenPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LaunchScreenPage', (WidgetTester tester) async {
    // 1. 測試啟動畫面
    await tester.pumpWidget(MyApp()); // MyApp 是你的主程式入口

    // 模擬時間流逝
    await tester.pump(const Duration(seconds: 2));

    // 檢查是否顯示啟動畫面
    expect(find.byType(LaunchScreenPage), findsOneWidget);
  });
}
