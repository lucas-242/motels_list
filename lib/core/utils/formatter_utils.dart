import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:intl/number_symbols_data.dart';

abstract class FormatterUtils {
  static String currency(num value) {
    final stringLocale = _getCurrentLocale();

    return NumberFormat.currency(
      locale: stringLocale,
      symbol: _getCurrencySymbol(),
    ).format(value);
  }

  static String _getCurrentLocale() {
    final locale = PlatformDispatcher.instance.locale;
    final joined = '${locale.languageCode}_${locale.countryCode}';
    if (numberFormatSymbols.keys.contains(joined)) {
      return joined;
    }
    return locale.languageCode;
  }

  static String _getCurrencySymbol() {
    final format = NumberFormat.simpleCurrency(locale: _getCurrentLocale());
    return format.currencySymbol;
  }
}
