import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "表单输入",
      home: new MyFromView(),
    );
  }
}

class MyFromView extends StatelessWidget {
  GlobalKey<FormState> _key = new GlobalKey<FormState>();
  String _name;
  String _passWord;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("登录")),
      body: new Center(
        child: new Form(
          key: _key,
          child: new Column(
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(hintText: "姓名"),
                onSaved: (String s) {
                  _name = s;
                },
              ),
              new TextFormField(
                initialValue: "密码",
                onSaved: (String s) {
                  _passWord = s;
                },
              ),
              new RaisedButton(
                child: new Text("登录"),
                color: Colors.green,
                onPressed: () {
                  _key.currentState.save();
                  Fluttertoast.showToast(
                    msg: _name + _passWord,
                    toastLength: Toast.LENGTH_LONG,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
