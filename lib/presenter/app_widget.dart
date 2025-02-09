import 'package:flutter/material.dart';
import 'package:moteis/core/theme/theme.dart';
import 'package:moteis/presenter/home/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moteis',
      theme: ThemeConfig.theme,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
