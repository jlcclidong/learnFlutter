import 'package:flutter/material.dart';

class Product {
  const Product({this.name});
  final String name;
}

typedef void CartChangeCallBack(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  final bool inCart;
  final CartChangeCallBack cartChangeCallBack;
  final Product product;

  ShoppingListItem({this.product, this.inCart, this.cartChangeCallBack})
      : super(key: new ObjectKey(product));

  Color _getColor() {
    return inCart ? Colors.lightBlue : Colors.lightGreen;
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        cartChangeCallBack(product, !inCart);
      },
      leading: new CircleAvatar(
        child: new Text(product.name),
        backgroundColor: _getColor(),
      ),
      title: new Text(product.name, style: _getTextStyle(context)),
    );
  }

  _getTextStyle(BuildContext context) {
    if (!inCart)
      return null;
    else
      return new TextStyle(
        color: Colors.red,
        decoration: TextDecoration.lineThrough,
      );
  }
}

class ShoppingList2 extends StatefulWidget {
  ShoppingList2({Key key, this.list}) : super(key: key);
  List<Product> list;

  @override
  State<StatefulWidget> createState() => new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList2> {
  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      print(inCart);
      if (inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("商品列表"),
      ),
      body: new ListView(
        children: widget.list.map((Product p) {
          return new ShoppingListItem(
            product: p,
            inCart: _shoppingCart.contains(p),
            cartChangeCallBack: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

class ShoppList extends StatelessWidget {
  List<Product> list;
  ShoppList({this.list});
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("列表"),
        ),
        body: new ListView(
          children: list.map((Product p) {
            return ShoppingListItem(
              product: p,
              inCart: true,
              cartChangeCallBack: (p, incart) {
                print("111");
              },
            );
          }).toList(),
        ));
  }
}

class MyApp extends StatelessWidget {
  List<Product> list = [
    new Product(name: "123"),
    new Product(name: "234"),
  ];
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "list",
      home: new ShoppingList2(
        list: list,
      ),
    );
  }
}
