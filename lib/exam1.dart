import 'package:flutter/material.dart';

class Example1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material 是UI呈现的“一张纸”
    return new Material(
      // Column is 垂直方向的线性布局.
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              '同心互联',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(// 填充剩余可用空间
            child: new Column(
              children: <Widget>[
                new Text('Hello word!'),
                new GestureDetector(
                  onTap: () {
                    print('点击按钮');
                  },
                  onDoubleTap: () {
                    print('双击');
                  },
                  onLongPress: () {
                    print('长按');
                  },
                  onHorizontalDragDown: (DragDownDetails) {
                    print('onHorizontalDragDown');
                  },
                  onHorizontalDragCancel: () {
                    print("onHorizontalDragCancel");
                  },
                  onVerticalDragDown: (DragDownDetails) {
                    print("onVerticalDragDown");
                  },
                  onVerticalDragCancel: () {
                    print('onVerticalDragCancel');
                  },
                  onScaleStart: (ScanStartDetails) {
                    print('onScaleStart');
                  },
                  onScaleEnd: (ScanStartDetails) {
                    print('onScaleEnd');
                  },
                  child: new Container(
                    height: 36.0,
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(5.0),
                      color: Colors.lightGreen[500],
                    ),
                    child: new Center(
                      child: new Text('Engage'),
                    ),
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  // Widget子类中的字段往往都会定义为"final"
  final Widget title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 80, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）56+24
//      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.only(left: 8.0, top: 24.0, right: 8.0, bottom: 0.0),// 顶部状态栏高24，设置内距高24以免被状态栏挡住。
      decoration: new BoxDecoration(color: Colors.blue[500]),
      // Row 是水平方向的线性布局（linear layout）
      child: new Row(
        //列表项的类型是 <Widget>
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu),
              tooltip: 'Navigation menu',
              onPressed: null // null 会禁用 button
              ),
          new Expanded(
            child: title,
          ),
          new IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null
          )
        ],
      ),
    );
  }
}
