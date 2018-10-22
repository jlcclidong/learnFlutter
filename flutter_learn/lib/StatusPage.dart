import 'package:flutter/material.dart';
import 'package:flutter_learn/StatusInfo.dart';
import 'package:flutter_learn/StatusChange.dart';

class StatusPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new StatusPageState();
}

class StatusPageState extends State<StatusPage>
    with AutomaticKeepAliveClientMixin<StatusPage> {
  bool _type = true; //true-代表计时状态 false—代表切换状态

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Expanded(
          child: new Stack(children: [
            new Align(
              child: new StatusInfo(
                mainDriverName: "David Backham",
                coDriverName: "Joe Smith",
                type: 2,
                time0: "3:42",
                time1: "10:39",
                time2: "1:49",
                time3: "2:22",
              ),
            ),
            new Align(
              alignment: new Alignment(0.5, 1.0),
              child: new Offstage(
                offstage: _type,
                child: new Container(
                  margin: EdgeInsets.only(top: 30.0),
                  color: Colors.white,
                  child: new StatusChange( cancle: cancleClick,),
                ),
              ),
            )
          ]),
        ),
        new Container(
          height: 150,
          child: new Center(
            child: new SizedBox(
              width: 300,
              height: 50,
              child: new FlatButton(
                onPressed: () {
                  setState(() {
                    _type = !_type;
                  });
                },
                color: Colors.yellow[800],
                child: new Text(
                  _type ? "Change State" : "30 min Break",
                  style: new TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  void cancleClick() {
    setState(() {
      _type = true;
    });
  }
}
