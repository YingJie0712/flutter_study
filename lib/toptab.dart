import 'package:flutter/material.dart';

class TopTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: ThemeData(// 主题
        primarySwatch: Colors.amber,// 优先级低
        primaryColor: Colors.red,// 优先级高
      ),
      home: new DefaultTabController(
          length: choices.length,
          child: new Scaffold(
            appBar: new AppBar(
              title: const Text('Tabbed AppBar'),
              bottom: new TabBar(
                isScrollable: true,// true头部导航栏可滚动，false则Tab填满头部。
                tabs: choices.map((Choice choice) {
                  return new Tab(
                    text: choice.title,
                    icon: new Icon(choice.icon),
                  );
                }).toList(),
              ),
            ),
            body: new TabBarView(
              children: choices.map((Choice choice) {
                return new Padding(
                  padding: const EdgeInsets.all(16),
                  child: new ChoiceCard(
                    choice: choice,
                  ),
                );
              }).toList(),
            ),
          )),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  final Choice choice;

  const ChoiceCard({Key key, this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(
              choice.icon,
              size: 128,
              color: textStyle.color,
            ),
            new Text(
              choice.title,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}
