import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "水平列表",
      home: new MyRowView(),
    );
  }
}

class MyRowView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("水平列表"),
      ),
      body: new Column(
        children: <Widget>[
          new RaisedButton(
            onPressed: () {
              print("点击红色按钮");
            },
            color: Colors.red,
            child: new Text(
              "红色按钮",
              style: new TextStyle(decoration: TextDecoration.none),
            ),
          ),
          new Expanded(
            flex: 1,
            child: new RaisedButton(
                onPressed: () {
                  print("点击黄色按钮");
                },
                color: Colors.yellow,
                child: new Text("黄色按钮")),
          ),
          new RaisedButton(
            color: Colors.green,
            onPressed: () {
              print("点击了绿色按钮");
            },
            child: new Text("绿色按钮"),
          ),
          new Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: new RaisedButton(
              padding: const EdgeInsets.all(15.0),
              color: Colors.lightBlue,
              onPressed: () {
                print("点击了蓝色按钮");
              },
              child: new Text("蓝色按钮"),
            ),
          )
        ],
      ),
    );
  }
}
