import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AsyncApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Async App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new AsyncPage(),
    );
  }
}

class AsyncPage extends StatefulWidget {
  AsyncPage({Key key}) : super(key: key);

  AsyncPageState createState() => new AsyncPageState();
}

class AsyncPageState extends State<AsyncPage> {
  String result = "no data";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Async App"),
        backgroundColor: Colors.blue,
      ),
      body: new Column(
        children: <Widget>[
          new RaisedButton(
              child: new Text("请求数据", style: new TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                loadData();
              }),
          new Center(
            child: new Text("Result: ${result}"),
          ),
        ],
      ),
    );
  }

  /*
   * http请求使用：
   *  1、在pubspec.yaml中的dependencies下导入库 http: ^0.11.0
   *  2、在类中导入 import 'package:http/http.dart' as http;
   *  3、请求方法声明为async的，在方法中请求网络的方法前面使用await关键字，表示等待请求结果，
   *  4、在setState中更新UI
   */
  loadData() async {
    String url =
        "http://www.tongxinhulian.com:10053/digitalID/v3/currentTimeMillis";
    http.Response response = await http.get(url);
    setState(() {
      result = response.body;
    });
  }
}
