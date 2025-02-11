import 'package:flutter/material.dart';
import 'package:moteis/core/theme/settings/app_insets.dart';
import 'package:moteis/core/theme/settings/app_text_styles.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.child, this.title});
  final Widget child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppInsets.xxxl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppInsets.xl,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: Navigator.of(context).pop,
                    icon: Icon(Icons.arrow_drop_down, size: 40),
                  ),
                  if (title != null) Text(title!, style: AppTextStyles.body),
                  if (title != null) SizedBox.shrink(),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppInsets.xl),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
