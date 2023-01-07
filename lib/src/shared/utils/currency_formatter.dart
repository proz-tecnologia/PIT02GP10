import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String doubleToReais(double value) {
    return NumberFormat.simpleCurrency(decimalDigits: 2, locale: 'pt-BR')
        .format(value);
  }
}
