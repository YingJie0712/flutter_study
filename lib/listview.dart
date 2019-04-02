import 'package:flutter/material.dart';
import 'toast.dart';

// 一、简单的ListView
class SimpleListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text("简单ListView"),
      ),
      body: new SimpleListViewPage(),
    );
  }
}

class SimpleListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SimpleListViewState();
  }
}

class SimpleListViewState extends State<SimpleListViewPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
      itemCount: datas.length, // item个数
      itemBuilder: buildItem,
      padding: EdgeInsets.all(5), // ListView的内边距
    );
  }

  Widget buildItem(BuildContext context, int index) {
    TextStyle textStyle = new TextStyle(
      color: Colors.white,
      fontSize: 18,
    );
    return new GestureDetector(
      onTap: () {
        Toast.toast(context, "点击：" + datas.elementAt(index).name);
      },
      child: new Container(
        padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
        // 每个item的内边距
        margin: EdgeInsets.only(left: 0, top: 3, right: 0, bottom: 0),
        color: Colors.grey,
        child: new Text(
          index.toString() + ":" + datas.elementAt(index).name,
          style: textStyle,
          textAlign: TextAlign.left,
          maxLines: 1,
        ),
      ),
    );
  }
}

// 二，复杂点的ListView
// 本例选中的product放在shoppingCart内
class ShoppingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ShoppingList(
      products: datas,
    );
  }
}

class ShoppingList extends StatefulWidget {
  final List<Product> products;

  ShoppingList({Key key, this.products}) : super(key: key);

  @override
  _ShoppingListState createState() => new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> shoppingCart = new Set();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 类似于onCreate
    // 重写initState以完成仅需要执行一次的工作，例如 配置动画或订阅platform services
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Shopping List"),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: shoppingCart.contains(product),
            onCartChanged: handleCartChanged,
          );
        }).toList(),
      ),
    );
  }

  void handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        shoppingCart.add(product);
        print('选中：' + product.name);
      } else {
        shoppingCart.remove(product);
        print('移除：' + product.name);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // 类似于onDestroy
    // 执行清理工作，例如 取消定时器或取消订阅platform services
  }
}

class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
      : product = product,
        super(key: new ObjectKey(product));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        // 图标
        backgroundColor: getColor(context),
        child: new Text(
          product.name[0],
          style: new TextStyle(
            color: Colors.white,
          ),
        ), // 图标上文字取name第一个字
      ),
      title: new Text(
        product.name,
        style: getTextStyle(context),
      ), // item标题
    );
  }

  Color getColor(BuildContext context) {
    return inCart ? Colors.red : Colors.black45; // 选中背景：未选中背景
  }

  TextStyle getTextStyle(BuildContext content) {
    if (!inCart) return null; // 未选中的文字颜色，空既取自context

    return new TextStyle(
      // 选中的文字颜色
      color: Colors.red,
      decoration: TextDecoration.underline,
    );
  }
}

class Product {
  const Product({this.name});

  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

const List<Product> datas = const <Product>[
  const Product(name: "土豆"),
  const Product(name: "茄子"),
  const Product(name: "西瓜"),
  const Product(name: "五花肉"),
  const Product(name: "德芙巧克力"),
  const Product(name: "肉松面包"),
  const Product(name: "炸鸡排"),
  const Product(name: "炸鸡排"),
  const Product(name: "小白菜"),
  const Product(name: "竹笋"),
  const Product(name: "土豆"),
  const Product(name: "茄子"),
  const Product(name: "西瓜"),
  const Product(name: "五花肉"),
  const Product(name: "德芙巧克力"),
  const Product(name: "肉松面包"),
  const Product(name: "炸鸡排"),
  const Product(name: "炸鸡排"),
  const Product(name: "小白菜"),
  const Product(name: "竹笋"),
  const Product(name: "土豆"),
  const Product(name: "茄子"),
  const Product(name: "西瓜"),
  const Product(name: "五花肉"),
  const Product(name: "德芙巧克力"),
  const Product(name: "肉松面包"),
  const Product(name: "炸鸡排"),
  const Product(name: "炸鸡排"),
  const Product(name: "小白菜"),
  const Product(name: "竹笋"),
];