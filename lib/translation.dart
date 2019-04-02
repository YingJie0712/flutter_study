import 'package:flutter/material.dart';

class FadeAppTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "动画",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyFadeTest(
        title: "Fade Demo",
      ),
    );
  }
}

class MyFadeTest extends StatefulWidget {
  final String title;

  MyFadeTest({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MyFadeTestState();
  }
}

class _MyFadeTestState extends State<MyFadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    animation = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
            child: new Container(
              child: new FadeTransition(
                opacity: animation,
                child: new FlutterLogo(
                  size: 200,
                ),
              ),
            ),
          ),
      floatingActionButton: new FloatingActionButton(
          tooltip: 'Fade',
          backgroundColor: Colors.green,
          child: new Icon(Icons.brush),
          onPressed: () {
            controller.forward();
          }),
    );
  }
}
