import 'package:intl/intl.dart';

class FormatDate {

  static String number( double number) {

    final numberFormat = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
      locale: 'en',
    ).format(number);

    return numberFormat;
  }
}