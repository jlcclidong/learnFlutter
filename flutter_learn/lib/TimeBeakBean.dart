class TimeBreakBean {
  DateTime time;
  int type;

  TimeBreakBean({String timeString, this.type})
      : time = DateTime.parse(timeString);
}
