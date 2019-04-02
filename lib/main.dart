import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // CupertinoButton 用到
import 'exam1.dart';
import 'counter.dart';
import 'listview.dart';
import 'toptab.dart';
import 'bottomTab.dart';
import 'StatelessWidgetAndStatefulWidget.dart';
import 'gridview.dart';
import 'translation.dart';
import 'draw.dart';
import 'intent.dart';
import 'async.dart';
import 'asyncTask.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
//      home: MyHomePage(title: '第一个页面'),
      home: SecondePage(
        title: "Flutter",
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: new CupertinoButton(
              child: Text("进入第二个页面"),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new SecondePage(
                          title: "第二个页面",
                        )));
              })),
    );
  }
}

class SecondePage extends StatelessWidget {
  const SecondePage({Key key, this.title}) : super(key: key);

  final title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: new Column(
          children: <Widget>[
            new Row(// 第一行
              children: <Widget>[
                new RaisedButton(
                    child: new Text(
                      "进入Exam1页面",
                      style: new TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new Example1()));
                    }),
                new Container(
                  width: 2,
                  color: Colors.transparent,
                ),
                new RaisedButton(
                    child: new Text("简单事件",
                        style: new TextStyle(color: Colors.white)),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new Counter()));
                    }),
                new Container(
                  width: 2,
                  color: Colors.transparent,
                ),
                new RaisedButton(
                    child: new Text("复杂事件",
                        style: new TextStyle(color: Colors.white)),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new Counter2()));
                    }),
              ],
            ),
            new Row(// 第二行
              children: <Widget>[
                new RaisedButton(
                    child: new Text(
                      "更新",
                      style: new TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new SampleApp()));
                    }),
                new Container(
                  width: 2,
                  color: Colors.transparent,
                ),
                new RaisedButton(
                    child: new Text("顶部导航",
                        style: new TextStyle(color: Colors.white)),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new TopTabPage()));
                    }),
                new Container(
                  width: 2,
                  color: Colors.transparent,
                ),
                new RaisedButton(
                    child: new Text("底部导航",
                        style: new TextStyle(color: Colors.white)),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new BottomTabPage()));
                    }),new Container(
                  width: 2,
                  color: Colors.transparent,
                ),
                new RaisedButton(
                    child: new Text("动画",
                        style: new TextStyle(color: Colors.white)),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new FadeAppTest()));
                    }),
              ],
            ),
            new Row(// 第三行
              children: <Widget>[
                new RaisedButton(
                    child: new Text("ListView1",
                        style: new TextStyle(color: Colors.white)),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new SimpleListView()));
                    }),
                new Container(
                  width: 2,
                  color: Colors.transparent,
                ),
                new RaisedButton(
                    child: new Text("ListView2",
                        style: new TextStyle(color: Colors.white)),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new ShoppingPage()));
                    }),
                new Container(
                  width: 2,
                  color: Colors.transparent,
                ),
                new RaisedButton(
                    child: Text(
                      "GridView",
                      style: new TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new GridViewPage()));
                    }),
              ],
            ),
            new Row(
              children: <Widget>[
                new RaisedButton(
                    child: Text(
                      "绘制",
                      style: new TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.all(0),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new DrawApp()));
                    }),
                new Container(
                  width: 2,
                  color: Colors.transparent,
                ),
                new RaisedButton(
                    child: Text(
                      "Intent",
                      style: new TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.all(0),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new IntentApp()));
                    }),
                new Container(
                  width: 2,
                  color: Colors.transparent,
                ),
                new RaisedButton(
                    child: Text(
                      "异步",
                      style: new TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.all(0),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new AsyncApp()));
                    }),
                new Container(
                  width: 2,
                  color: Colors.transparent,
                ),
                new RaisedButton(
                    child: Text(
                      "AsyncTask",
                      style: new TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.all(0),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new AsyncTastApp()));
                    }),
              ],
            ),
          ],
        ));
  }
}
