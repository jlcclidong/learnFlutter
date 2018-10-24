import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "eld",
      home: new LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginViewState();
  }
}

class LoginViewState extends State<LoginView>
    with AutomaticKeepAliveClientMixin {
  static const login = "http://120.79.162.53:8080/AiSrs/terminal/login";
  int _type = 0; //0-main_driver 1-co_driver
  String _username = '';
  String _password = '';

  //分割用
  final SizedBox _paddingV = const SizedBox(
    height: 10.0,
  );
  final SizedBox _paddingH = const SizedBox(
    width: 10.0,
  );

  //上下占位用
  final Expanded _topBottomPadding = const Expanded(
    flex: 1,
    child: const SizedBox(),
  );

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Form(
      key: _formKey,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // _topBottomPadding,
            _buildChoiceDriver(),
            _paddingV,
            _buildUsernameInput(0),
            _paddingV,
            _buildUsernameInput(1),
            _paddingV,
            _buildLoginButton(),
            // _topBottomPadding,
          ],
        ),
      ),
    );
  }

  ///选择主副司机
  Row _buildChoiceDriver() {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new GestureDetector(
            onTap: () {
              setState(() {
                _type = 0;
              });
            },
            child: _buildChoiceSub(0),
          ),
          flex: 1,
        ),
        new Expanded(
          flex: 1,
          child: new GestureDetector(
            onTap: () {
              setState(() {
                _type = 1;
              });
            },
            child: _buildChoiceSub(1),
          ),
        )
      ],
    );
  }

  ///切换主副司机子控件
  ///pos 0-主 1-副
  Widget _buildChoiceSub(int pos) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Image.asset(
          pos == _type ? "images/checked.png" : "images/unchecked.png",
          width: 18,
          height: 18,
        ),
        _paddingH,
        new Text(
          pos == 0 ? '''Main Driver''' : '''Co-Driver''',
          style: new TextStyle(color: Colors.yellow[700], fontSize: 16.0),
        ),
      ],
    );
  }

  ///用户名输入框
  ///type 0 用户名 1密码
  Container _buildUsernameInput(int type) {
    return new Container(
      decoration: new BoxDecoration(
        border: new Border.all(color: Colors.yellow[700], width: 1.0),
        borderRadius: new BorderRadius.circular(6.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: new TextFormField(
        onSaved: (String s) {
          if (type == 0) {
            _username = s;
          } else {
            _password = s;
          }
        },
        obscureText: type == 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: type == 0 ? "UserName" : "PassWord",
          hintStyle: new TextStyle(
            color: Colors.yellow[800],
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }

  ///登录按钮
  SizedBox _buildLoginButton() {
    return new SizedBox(
      width: 375.0,
      height: 50.0,
      child: new FlatButton(
        onPressed: () {
          _formKey.currentState.save();
          if (_username.trim().isEmpty) {
            Fluttertoast.showToast(
              msg: 'please input username',
              toastLength: Toast.LENGTH_SHORT,
            );
          } else if (_password.trim().isEmpty) {
            Fluttertoast.showToast(
              msg: 'please input password',
              toastLength: Toast.LENGTH_SHORT,
            );
          } else {
            _login();
            Fluttertoast.showToast(
              msg:
                  '''$_username------$_password----${_type == 0 ? "maindriver" : "codriver"}''',
              toastLength: Toast.LENGTH_SHORT,
            );
          }
        },
        color: Colors.yellow[700],
        child: new Text(
          "Login",
          style: const TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      ),
    );
  }

  Future _login() async {
    var dio = new Dio();
    Response response = await dio.get(
      login,
      data: {
        "JOBNUMBER": _username,
        "PWD": _password,
      },
    );
    print(response.data);
  }

  @override
  bool get wantKeepAlive => true;
}
