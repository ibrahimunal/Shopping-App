import 'package:flutter/material.dart';
import 'package:shopApp/screens/product_detail_screen.dart';
import 'package:shopApp/screens/product_overview_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Friend'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.supervised_user_circle),
            title: Text('User Products'),
            onTap: () {
              Navigator.of(context).pushNamed('/user-products');
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home Page'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ProductsOverviewScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
