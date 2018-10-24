import 'package:flutter/material.dart';
import 'package:flutter_learn/TimeBeakBean.dart';
import 'dart:core';

class StatusList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _StatusListState();
}

class _StatusListState extends State<StatusList> {
  List<TimeBreakBean> list = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list
      ..add(new TimeBreakBean(timeString: "2018-10-24 13:09:52", type: 1))
      ..add(new TimeBreakBean(timeString: "2018-10-24 13:10:53", type: 2))
      ..add(new TimeBreakBean(timeString: "2018-10-24 14:12:52", type: 0))
      ..add(new TimeBreakBean(timeString: "2018-10-24 15:16:52", type: 3))
      ..add(new TimeBreakBean(timeString: "2018-10-24 18:22:52", type: 1))
      ..add(new TimeBreakBean(timeString: "2018-10-25 19:14:23", type: 0));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 400.0,
      width: double.infinity,
      child: new Stack(
        children: <Widget>[
          new ListView(
            scrollDirection: Axis.horizontal,
            children: _buildItems(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildItems() {
    List<Widget> wigets = new List();
    var _duration = list[0].time.difference(list[list.length - 1].time);
    int _hours = _duration.inHours;
    var time = list[0].time;
    var j = 0;
    for (var i = 0; i < _hours + 4; i++) {
      time.add(Duration(hours: 1));
      for (; j < list.length; j++) {
        if (list[j].time.isBefore(time)) {}
      }
      wigets.add(new Container(
        width: 60,
        height: 400,
      ));
    }
    return wigets;
  }
}
