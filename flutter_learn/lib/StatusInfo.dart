import 'package:flutter/material.dart';

class StatusInfo extends StatefulWidget {
  String mainDriverName;
  String coDriverName;
  int type;
  String time0;
  String time1;
  String time2;
  String time3;
  StatusInfo(
      {Key key,
      this.mainDriverName,
      this.coDriverName,
      this.type,
      this.time0,
      this.time1,
      this.time2,
      this.time3})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => new _StatusInfoState();
}

class _StatusInfoState extends State<StatusInfo> {
  String _driverString;
  String _typeTime = "";
  List _names = ["Driving", "Shift", "Cycle", "Rest"];
  TextStyle _mainTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    fontWeight: FontWeight.w900,
  );
  Widget _paddingH = new SizedBox(
    height: 10.0,
  );
  @override
  void initState() {
    super.initState();

    switch (widget.type) {
      case 0:
        _typeTime = widget.time0;
        break;
      case 1:
        _typeTime = widget.time1;
        break;
      case 2:
        _typeTime = widget.time2;
        break;
      case 3:
        _typeTime = widget.time3;
        break;
    }

    _driverString = '${widget.mainDriverName}(main)';
    if (widget.coDriverName != null)
      _driverString += ' \/ ${widget.coDriverName}(co)';
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        _buildTop(),
        _paddingH,
        _buildRow(),
        _paddingH,
        new Text(
          "Current Status:${_names[widget.type]}",
          style: _mainTextStyle,
        ),
        _paddingH,
        new Text(
          _driverString,
          style: _mainTextStyle,
        ),
      ],
    );
  }

  Widget _buildTop() {
    return new Expanded(
      child: new Container(
        width: double.infinity,
        color: Colors.yellow[800],
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Container(
              child: new Text(
                _typeTime,
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 80.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            new SizedBox(
              height: 30.0,
            ),
            new GestureDetector(
              child: new Text(
                "Break",
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
            ),
            new SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _buildRows(),
    );
  }

  List<Widget> _buildRows() {
    List<Widget> list = new List();
    if (widget.type != 0) {
      list.add(_buildRowItem(widget.type == 0, _names[0], widget.time0));
    }
    if (widget.type != 1) {
      list.add(_buildRowItem(widget.type == 1, _names[1], widget.time1));
    }
    if (widget.type != 2) {
      list.add(_buildRowItem(widget.type == 2, _names[2], widget.time2));
    }
    if (widget.type != 3) {
      list.add(_buildRowItem(widget.type == 3, _names[3], widget.time3));
    }
    return list;
  }

  Widget _buildRowItem(bool visible, String name, String time) {
    return new Container(
      width: 100.0,
      height: 100.0,
      decoration: new BoxDecoration(
        border: new Border.all(
          color: Colors.grey[400],
        ),
      ),
      child: new Stack(
        children: <Widget>[
          new Align(
            child: new Text(
              time,
              style: new TextStyle(
                  color: Colors.yellow[800],
                  fontWeight: FontWeight.w800,
                  fontSize: 29.0),
            ),
          ),
          new Positioned(
            bottom: 5.0,
            left: 10.0,
            right: 10.0,
            child: new Text(
              name,
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.yellow[800], fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
