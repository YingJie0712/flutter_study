import 'package:flutter/material.dart';

class BottomTabPage extends StatefulWidget {
  BottomTabPage({Key key}) : super(key: key);

  @override
  _BottomTabPageState createState() => new _BottomTabPageState();
}

class _BottomTabPageState extends State<BottomTabPage> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("底部导航"),
      ),
      body: new Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            dHeader,
            ListTile(
              title: Text('Item 1'),
              leading: new CircleAvatar(
                child: new Icon(Icons.school),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              leading: new CircleAvatar(
                child: new Text('B2'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("弹出对话框"),
              leading: new CircleAvatar(
                child: new Icon(Icons.list),
              ),
              onTap: () {
                Navigator.pop(context);
                _showDialog();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,// false:点击外部不消失；true:点击外部消失。
        builder: (BuildContext content) {
          return AlertDialog(
            title: new Text("结果反馈"),
            content: new SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  new Text("AlertDialog好用吗？"),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: new Text("NO"),
                textColor: Colors.grey,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: new Text("YES"),
                textColor: Colors.redAccent,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

// 自定义header
Widget dHeader = DrawerHeader(
    padding: EdgeInsets.zero,// padding置为0
    child: new Stack(// 用stack来放背景图片
    children: <Widget>[
        new Image.asset(
          "assets/bg_drawer_header.png",
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        new Align(//先放置对齐
          alignment: FractionalOffset.bottomLeft,
          child: Container(
            height: 70.0,
            margin: EdgeInsets.only(left: 12.0, bottom: 12.0),
            child: new Row(
              mainAxisSize: MainAxisSize.min, // 宽度包住子组件即可
              crossAxisAlignment: CrossAxisAlignment.start,// 水平方向左对齐
              mainAxisAlignment: MainAxisAlignment.start,//  垂直方向上对齐
              children: <Widget>[
                new CircleAvatar(
                  backgroundImage: AssetImage('assets/photo.jpg'),
                  radius: 35,
                ),
                new Container(
                  margin: EdgeInsets.only(left: 6.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // 水平方向左对齐
                    mainAxisAlignment: MainAxisAlignment.center, //  垂直方向居中
                    children: <Widget>[
                      new Text(
                        'Tom',
                        style: new TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.red),
                      ),
                      new Text(
                        '人生自古谁无死',
                        style:
                            new TextStyle(fontSize: 14.0, color: Colors.black),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));

const _widgetOptions = [
  Text('Index 0: Home'),
  Text('Index 1: Business'),
  Text('Index 2: School'),
];
