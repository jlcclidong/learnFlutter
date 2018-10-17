import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "层叠布局",
      home: new MyStackView(),
    );
  }
}

class MyStackView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("层叠布局"),
      ),
      body: new Stack(
        children: <Widget>[
          new Align(
            child: new Image.network(
                "http://img2.cxtuku.com/00/13/12/s97783873391.jpg"),
             alignment: FractionalOffset.centerRight,
          ),
          new Align(
            alignment: new FractionalOffset(0.5, 0.5),
            child: new Image.network("http://up.qqjia.com/z/25/tu32710_11.jpg"),
          ),
          new Positioned(
            left: 20.0,
            right: 30.0,
            top: 45.0,
            child: new Text(
              '''这是一个层叠的数据  
            sdfasdfas
            sadfasdfa1111111111111111111111
            ssss
            dfasdfasd''',
              style: const TextStyle(fontFamily: "serif", fontSize: 15.0),
            ),
          )
        ],
      ),
    );
  }
}
