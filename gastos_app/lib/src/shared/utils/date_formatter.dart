class DateFormatter {
  static String formatted(DateTime date) {
    final day = dayMonthFormatter(date.day);
    final month = dayMonthFormatter(date.month);
    final year = date.year;

    return "$day/$month/$year";
  }

  static String formattedWithMonthName(DateTime date) {
    final day = dayMonthFormatter(date.day);
    final month = monthName(date);
    final year = date.year;

    return "$day/$month/$year";
  }

  static String dayMonthFormatter(int dayOrMonth) {
    if (dayOrMonth > 9) return "$dayOrMonth";
    return "0$dayOrMonth";
  }

  static String monthName(DateTime date) {
    final month = date.month;

    switch (month) {
      case 1:
        return "Janeiro";
      case 2:
        return "Fevereiro";
      case 3:
        return "Março";
      case 4:
        return "Abril";
      case 5:
        return "Maio";
      case 6:
        return "Junho";
      case 7:
        return "Julho";
      case 8:
        return "Agosto";
      case 9:
        return "Setembro";
      case 10:
        return "Outubro";
      case 11:
        return "Novembro";
      default:
        return "Dezembro";
    }
  }
}
