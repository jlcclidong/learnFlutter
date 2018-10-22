import 'package:flutter/material.dart';

class StatusChange extends StatefulWidget {
  Function cancle;
  StatusChange({this.cancle});

  @override
  State<StatefulWidget> createState() => new _StatusChangeState();
}

class _StatusChangeState extends State<StatusChange> {
  List<String> _mainDriverStatus = ['On', 'D', 'YM', 'Off', 'PC', 'SB'];
  List<String> _coDriversStatus = ['On', 'D', 'Off', 'SB'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        _buildTop(),
        new SizedBox(
          height: 10.0,
        ),
        new Text(
          "Main Driver",
          style: new TextStyle(
            color: Colors.yellow[800],
            fontSize: 18.0,
          ),
        ),
        _buildMainChoice(),
        new Text(
          "Co Driver",
          style: new TextStyle(
            color: Colors.yellow[800],
            fontSize: 18.0,
          ),
        ),
        _buildCoChoice(),
      ],
    );
  }

  Widget _buildTop() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        new FlatButton(
          onPressed: () {
            widget.cancle();
          },
          color: Colors.grey,
          textColor: Colors.white,
          child: new Text("Cancle"),
        ),
        new SizedBox(
          width: 10.0,
        ),
        new FlatButton(
          padding: EdgeInsets.all(10.0),
          onPressed: () {},
          color: Colors.yellow[800],
          textColor: Colors.white,
          child: new Text("Submit"),
        ),
        new SizedBox(
          width: 10.0,
        ),
      ],
    );
  }

  Widget _buildCoChoice() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new SizedBox(
          width: 20.0,
        ),
        _buildChoiceRowsChild(6),
        _buildChoiceRowsChild(7),
        _buildChoiceRowsChild(8),
        _buildChoiceRowsChild(9),
        new SizedBox(
          width: 20.0,
        ),
      ],
    );
  }

  Widget _buildMainChoice() {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new SizedBox(
          height: 20.0,
        ),
        _buildMainChoiceColumsChild(0),
        new SizedBox(
          height: 20.0,
        ),
        _buildMainChoiceColumsChild(1),
        new SizedBox(
          height: 20.0,
        ),
      ],
    );
  }

  Widget _buildMainChoiceColumsChild(int pos) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new SizedBox(
          width: 20.0,
        ),
        _buildChoiceRowsChild(pos == 0 ? 0 : 3),
        _buildChoiceRowsChild(pos == 0 ? 1 : 4),
        _buildChoiceRowsChild(pos == 0 ? 2 : 5),
        new SizedBox(
          width: 20.0,
        ),
      ],
    );
  }

  Widget _buildChoiceRowsChild(int type) {
    bool _mainOrCo = type <= 5;
    return new Container(
      width: 90.0,
      height: 90.0,
      decoration: new BoxDecoration(
        border: new Border.all(color: Colors.yellow[800]),
      ),
      child: new Center(
        child: new Text(
            _mainOrCo ? _mainDriverStatus[type] : _coDriversStatus[type - 6]),
      ),
    );
  }
}
