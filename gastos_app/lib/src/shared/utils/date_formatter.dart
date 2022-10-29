class DateFormatter {
  static String formatted(DateTime date) {
    final day = date.day;
    final month = date.month;
    final year = date.year;

    return "$day/$month/$year";
  }

  static String formattedWithMonthName(DateTime date) {
    final day = date.day;
    final month = monthName(date);
    final year = date.year;

    return "$day/$month/$year";
  }

  static String monthName(DateTime date) {
    final month = date.month;

    switch (month) {
      case 1:
        return "janeiro";
      case 2:
        return "fevereiro";
      case 3:
        return "março";
      case 4:
        return "abril";
      case 5:
        return "maio";
      case 6:
        return "junho";
      case 7:
        return "julho";
      case 8:
        return "agosto";
      case 9:
        return "setembro";
      case 10:
        return "outubro";
      case 11:
        return "novembro";
      default:
        return "dezembro";
    }
  }
}
