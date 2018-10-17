import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: "标题点击事件弹窗", home: new MyTextView());
  }
}

class MyTextView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyTextViewState();
}

class MyTextViewState extends State<MyTextView> {
  String _content = "初始化";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("右侧可点击"),
        actions: <Widget>[
          new PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                    new PopupMenuItem<String>(
                        value: '选项一的值', child: new Text('选项一')),
                    new PopupMenuItem<String>(
                        value: '选项二的值', child: new Text('选项二'))
                  ],
              onSelected: (String value) {
                setState(() {
                  _content = value;
                });
              })
        ],
      ),
      body: new Center(
        child: new Text(_content),
      ),
    );
  }
}
