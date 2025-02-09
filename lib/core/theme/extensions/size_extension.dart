import 'package:flutter/widgets.dart';

extension SizeExtension on BuildContext {
  MediaQueryData get _mediaQuery => MediaQuery.of(this);

  /// Returns the screen width.
  double get width => _mediaQuery.size.width;

  /// Returns the screen height.
  double get height => _mediaQuery.size.height;
}
