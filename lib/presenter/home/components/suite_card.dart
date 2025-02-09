import 'package:flutter/material.dart';
import 'package:moteis/core/theme/theme.dart';

class SuiteCard extends StatelessWidget {
  const SuiteCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * .9,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppInsets.xs),
          child: child,
        ),
      ),
    );
  }
}
