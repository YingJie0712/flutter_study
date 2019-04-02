import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntentApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Intent shared",
      theme: new ThemeData(
          primarySwatch: Colors.blue,
      ),
      home: new IntentAppPage(),
    );
  }
}

class IntentAppPage extends StatefulWidget {
  IntentAppPage({Key key}) : super(key: key);

  IntentAppPageState createState() => new IntentAppPageState();
}

class IntentAppPageState extends State<IntentAppPage> {

  static const platform = const MethodChannel("app.channel.shared.data");
  String dataShared = "No data";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSharedText();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child: new Text(dataShared),
      ),
    );
  }

  getSharedText() async {
    var data = await platform.invokeMethod("getSharedText");
    if(data != null) {
      setState(() {
        dataShared = data;
      });
    }
  }
}