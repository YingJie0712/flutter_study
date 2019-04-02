import 'package:flutter/material.dart';

class MyStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

class MyStateful extends StatefulWidget {
  @override
  MyState createState() => new MyState();
}

class MyState extends State<MyStateful> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

/**
 * StatelessWidget
 *  1、重写build方法
 *  2、无状态widget从它们的父widget接收参数， 它们被存储在final型的成员变量中。
 *    当一个widget被要求构建时，它使用这些存储的值作为参数来构建widget。
 */

/**
 * StatefulWidget
 *  1、重写createState方法
 *  2、StatefulWidgets是特殊的widget，它知道如何生成State对象，然后用它来保持状态。
 *  3、您可能想知道为什么StatefulWidget和State是单独的对象。在Flutter中，这两种类型的对象具有不同的生命周期：
 *    Widget是临时对象，用于构建当前状态下的应用程序，而State对象在多次调用build()之间保持不变，允许它们记住信息(状态)。
 */

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Simple App",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  String textToShow = "I like Flutter";
  bool update = true;

  void _updateText() {
    setState(() {
      if (update) {
        textToShow = "Flutter ia Awesame";
      } else {
        textToShow = "I like Flutter";
      }
      update = !update;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new Center(
        child: new Text(
          textToShow,
          style: new TextStyle(color: update ? Colors.black : Colors.red),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _updateText,
        tooltip: "Update Text",
        child: new Icon(Icons.update),
      ),
    );
  }

}
