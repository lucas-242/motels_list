import 'package:flutter/material.dart';
import 'package:moteis/core/theme/theme.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppInsets.sm,
      children: [
        Expanded(child: Divider()),
        Text(text, style: AppTextStyles.subtitle),
        Expanded(child: Divider()),
      ],
    );
  }
}
