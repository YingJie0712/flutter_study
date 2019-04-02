import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:isolate';

class AsyncTastApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "AsyncTask",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new AsyncTaskPage(),
    );
  }
}

class AsyncTaskPage extends StatefulWidget {
  AsyncTaskPage({Key key}) : super(key: key);

  _AsyncTaskPageState createState() => new _AsyncTaskPageState();
}

class _AsyncTaskPageState extends State<AsyncTaskPage> {
  List widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("AsyncTask"),
      ),
      body: getBody(),
    );
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  ListView getListView() {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      },
      itemCount: widgets.length,
    );
  }

  Widget getRow(int i) {
    return new Padding(
      padding: new EdgeInsets.all(10.0),
      child: new Text("Row ${widgets[i]["id"]} : ${widgets[i]["title"]}"),
    );
  }

  getProgressDialog() {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  showLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    }
    return false;
  }

  loadData() async {
    // 接收消息
    ReceivePort receivePort = new ReceivePort();
    /*
      ※ 关于Isolate：
      1、在Dart中实现并发可以用Isolate，它是类似于线程(thread)但不共享内存的独立运行的worker，是一个独立的Dart程序执行环境。其实默认环境就是一个main isolate。
      2、在Dart语言中，所有的Dart代码都运行在某个isolate中，代码只能使用所属isolate的类和值。
      3、当你使用Isolate对象时，你的目的应该是控制其他isolate，而不是当前的isolate。
      4、当你要spawn(产生)一个新isolate时，如果操作成功，当前isolate会接收到一个代表新isolate的Isolate对象。
      4、
     */
    /*
      ※ spawn方法：
      1、entryPoint(dataLoader) 参数指定了调用产生的isolate时的初始函数。
         这个函数必须是可以以单一参数调用的全局函数或静态方法，也就是说，它应该是接收至少一个位置参数并且最多一个必要位置参数的编译时函数常量值。
         只要它能用一个参数来调用，它可以接收任意数量的可选参数。它不能是函数表达式或实例方法。
      2、初始化消息(message)通常包含一个SendPort，以便生产者与被产者互相交流。
      3、如果paused参数赋值为true，那么这个isolate启动时就是entryPoint方法调用前的暂停状态，就像初始化时就调用了isolate.pause(isolate.pauseCapability)一样。
         要恢复运行，可以调用isolate.resume(isolate.pauseCapability)。
      4、如果errorsAreFatal、 onExit 和/或 onError 参数被赋值，就相当于在isolate启动前，setErrorsFatal, addOnExitListener 和/或 addErrorListener 分别以相应参数调用。
      5、如果忽略errorsAreFatal参数，平台会以默认行为或者继承自当前isolate的行为来处理错误。
      6、你也可以对返回的isolate调用setErrorsFatal、addOnExitListener 和 addErrorListene等方法，但是除非isolate以pause状态启动，它在这些方法调用前可能已经执行完毕了。
     */
    await Isolate.spawn(dataLoader, receivePort.sendPort);
    // dataLoader 发送的第一个message，是它的SendPort
    SendPort sendPort = await receivePort.first;
    List msg = await sendReceive(
        sendPort, "https://jsonplaceholder.typicode.com/posts");

    setState(() {
      widgets = msg;
    });
  }

  // 新的 Isolate入口
  static dataLoader(SendPort sendPort) async {
    // 实例化一个ReceivePort 以接收消息
    ReceivePort receivePort = new ReceivePort();
    // 把它的sendPort发送给宿主isolate（生成此Isolate的地方），以便宿主可以给它发送消息。
    sendPort.send(receivePort.sendPort);

    // 监听消息
    await for (var msg in receivePort) {
      String data = msg[0];
      SendPort replyTo = msg[1];

      String dataUrl = data;
      http.Response response = await http.get(dataUrl);
      // Lots of JSON to parse
      replyTo.send(json.decode(response.body));
    }
  }

  // 对某个port发送消息，并接收结果
  Future sendReceive(SendPort port, msg) {
    ReceivePort receivePort = new ReceivePort();
    port.send([msg, receivePort.sendPort]);
    return receivePort.first;
  }
}
