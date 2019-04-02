import 'package:flutter/material.dart';
import 'toast.dart';

class GridViewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GridViewList(
      peoples: peoples,
    );
  }
}

class GridViewList extends StatefulWidget {

  final List<People> peoples;

  GridViewList({Key key, this.peoples}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new GridViewPageState();
  }
}

class GridViewPageState extends State<GridViewList> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text("GridView"),
      ),
      body: new GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        // 滚动方向
        crossAxisSpacing: 10,
        // 水平间距
        mainAxisSpacing: 10,
        // 垂直间距
        children: widget.peoples.map((People people) {
          return new GridViewItem(
            people: people,
            index: widget.peoples.indexOf(people),
          );
      }).toList(),
      ),
    );
  }
}

class GridViewItem extends StatelessWidget {
  final People people;
  final int index;

  GridViewItem({this.people, this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: () {
        Toast.toast(context, index.toString() + ":" + people.name);
      },
      child: new Column(
        children: <Widget>[
          new Image(
            image: new AssetImage(people.imagePath),
            fit: BoxFit.cover,
          ),
          new Align(
            alignment: Alignment.bottomCenter,
            child: new Text(
              people.name,
              style: new TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class People {
  const People({this.name, this.imagePath});

  final String name;
  final String imagePath;
}

const List<People> peoples = const <People>[
  const People(name:"宝马", imagePath:"assets/car.jpg"),
  const People(name:"奔驰", imagePath:"assets/car.jpg"),
  const People(name:"奥迪", imagePath:"assets/car.jpg"),
  const People(name:"捷豹", imagePath:"assets/car.jpg"),
  const People(name:"凯迪拉克", imagePath:"assets/car.jpg"),
  const People(name:"丰田", imagePath:"assets/car.jpg"),
  const People(name:"大众", imagePath:"assets/car.jpg"),
  const People(name:"保时捷", imagePath:"assets/car.jpg"),
  const People(name:"法拉利", imagePath:"assets/car.jpg"),
  const People(name:"本田", imagePath:"assets/car.jpg"),
  const People(name:"雪佛兰", imagePath:"assets/car.jpg"),
  const People(name:"道奇", imagePath:"assets/car.jpg"),
  const People(name:"别克", imagePath:"assets/car.jpg"),
  const People(name:"比亚迪", imagePath:"assets/car.jpg"),
  const People(name:"传祺", imagePath:"assets/car.jpg"),
  const People(name:"布加迪", imagePath:"assets/car.jpg"),
  const People(name:"兰博基尼", imagePath:"assets/car.jpg"),
  const People(name:"路虎", imagePath:"assets/car.jpg"),
  const People(name:"日产", imagePath:"assets/car.jpg"),
  const People(name:"现代", imagePath:"assets/car.jpg"),
  const People(name:"悦达起亚", imagePath:"assets/car.jpg"),
  const People(name:"奇瑞", imagePath:"assets/car.jpg"),
  const People(name:"名爵", imagePath:"assets/car.jpg"),
];
