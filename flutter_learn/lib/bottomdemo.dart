import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_learn/timep.dart';
import 'package:flutter_learn/login.dart';
import 'package:flutter_learn/row.dart';
import 'package:flutter_learn/stack.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "底部布局",
      home: new MyBottom(),
    );
  }
}

class MyBottom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyBottomState();
  }
}

class MyBottomState extends State<MyBottom> {
  int _currentIndex = 0;
  List<Widget> pages = new List();
  List<String> names = ['Status', 'Logs', 'Remarks', 'Steeings'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Widget a = new MyHomePage();
    Widget b = new LoginView();
    Widget c = new MyRowView();
    Widget d = new MyStackView();
    pages..add(a)..add(b)..add(c)..add(d);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(names[_currentIndex]),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: new CupertinoTabBar(
        activeColor: Colors.yellow[800],
        inactiveColor: Colors.grey[400],
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.crop_5_4),
            title: new Text("Status"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.crop_5_4),
            title: new Text("Logs"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.crop_5_4),
            title: new Text("Remarks"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.crop_5_4),
            title: new Text("Steeings"),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
