import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import '../data/chart/ChartInfo.dart';

final dataProvider = StateProvider<String>((ref) => '');
abstract class BaseChartDetailState<T extends StatefulWidget> extends State<T> {
  final GlobalKey<FormState> FormKey = GlobalKey<FormState>();

  void updateData(List<String> times, List<double> values,
      ChartInfo chartInfo, String timeFormat) {
  }
}
