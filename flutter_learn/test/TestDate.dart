import 'package:flutter_learn/TimeBeakBean.dart';

void main() {
  var list = new List();
  list
    ..add(new TimeBreakBean(time: "2018-10-24 13:09:52", type: 1))
    ..add(new TimeBreakBean(time: "2018-10-24 13:10:53", type: 2))
    ..add(new TimeBreakBean(time: "2018-10-24 14:12:52", type: 0))
    ..add(new TimeBreakBean(time: "2018-10-24 15:16:52", type: 3))
    ..add(new TimeBreakBean(time: "2018-10-24 18:22:52", type: 1))
    ..add(new TimeBreakBean(time: "2018-10-24 19:14:23", type: 0));
  var _startTime = DateTime.parse(list[0].time);
  print(_startTime);
}
