class WeatherUtil {
  double degCelsius(double num) => num.toInt() - 273;

  String drFormat(String dtTxt) {
    int tmp = int.parse(
      dtTxt.substring(
        dtTxt.indexOf(" "),
        dtTxt.indexOf(":"),
      ),
    );
    int hour = tmp % 12;
    if (hour == 0) {
      hour = 12;
    }
    String period = tmp < 12 ? "AM" : "PM";
    return "$hour $period";
  }

  String dataFormat(String dtTxt) {
    List<String> t = dtTxt.substring(0, dtTxt.lastIndexOf("-") + 3).split("-");
    List<String> days = [
      'Понедельник',
      'Вторник',
      'Среда',
      'Четверг',
      'Пятница',
      'Суббота',
      'Воскресенье'
    ];
    DateTime date = DateTime(
      int.parse(t[0]),
      int.parse(t[1]),
      int.parse(
        t[2],
      ),
    );
    return days[date.weekday - 1].toString();
  }
}
