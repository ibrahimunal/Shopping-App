import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopApp/providers/products.dart';
import 'package:shopApp/screens/edit_product_screen.dart';
import 'package:shopApp/widgets/appDrawer.dart';
import 'package:shopApp/widgets/user_product.dart';

class UserProdutcsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<Products>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("User Products"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProdutcsScreen.routeName);
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (context, index) => Column(
            children: <Widget>[
              UserProductItem(
                  title: state.items[index].title,
                  imageUrl: state.items[index].imageUrl),
              Divider()
            ],
          ),
          itemCount: state.items.length,
        ),
      ),
    );
  }
}
