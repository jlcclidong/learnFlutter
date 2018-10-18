import "package:flutter/material.dart";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: "页面跳转", home: new FirstScreen());
  }
}

class FirstScreen extends StatelessWidget {
  final Things a = new Things.detail(name: "liuyue", time: "2015-12-1");

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("第一个页面"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new SecondScreen(
                          a: a,
                        )));
          },
          child: new Text("去第二页"),
          color: Colors.lightBlue,
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final Things a;
  SecondScreen({ this.a});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("第二个页面"),
      ),
      body: new Center(
        child: new FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.lightBlueAccent[200],
          child: new Text(a.name + 'sssss' + a.time),
        ),
      ),
    );
  }
}

class Things {
  String name;
  String time;

  Things.detail({this.name, this.time});
}
