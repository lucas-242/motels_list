import 'package:flutter/material.dart';
import 'package:moteis/injector.dart';
import 'package:moteis/presenter/app_widget.dart';

void main() {
  Injector.init();
  runApp(const AppWidget());
}
