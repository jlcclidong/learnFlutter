import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "网络加载数据",
      home: new MyHttpView(),
    );
  }
}

class MyHttpView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHttpViewState();
  }
}

class MyHttpViewState extends State<MyHttpView> {
  String _content = "dengdai";
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new RaisedButton(
      onPressed: () {
        http
            .get(
                "https://domokit.github.io/examples/stocks/data/stock_data_2.json")
            .then((http.Response re) {
          String s = re.body;
          setState(() {
            _content = s;
          });
        });
      },
      child: new Text(
        _content,
        style: const TextStyle(fontSize: 30.0, color: Colors.deepPurple),
      ),
    ));
  }
}
