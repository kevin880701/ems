
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BasePageState<T extends StatefulWidget> extends State<T> {
  final GlobalKey<FormState> FormKey = GlobalKey<FormState>();

  bool saveKey() {
    if (!FormKey.currentState!.validate()) return false;
    FormKey.currentState!.save();
    return true;
  }

  @override
  void initState() {
    super.initState();
  }
}
