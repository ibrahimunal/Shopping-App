import 'package:flutter/material.dart';
import 'package:shopApp/providers/cart.dart';
import 'package:shopApp/providers/products.dart';
import 'package:shopApp/screens/shopping_cart_screen.dart';
import 'package:shopApp/widgets/appDrawer.dart';
import 'package:shopApp/widgets/original.dart';
import 'package:shopApp/widgets/products_grid.dart';
import '../providers/product.dart';
import '../widgets/product_item.dart';
import 'package:provider/provider.dart';

enum FilterOption {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = '/product-overview';
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("MyShop"),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOption value) {
              setState(() {
                if (value == FilterOption.Favorites) {
                  _showOnlyFavorites = true;
                } else if (value == FilterOption.All) {
                  _showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                  child: Text("Favorites"), value: FilterOption.Favorites),
              PopupMenuItem(child: Text("Show All"), value: FilterOption.All)
            ],
            icon: Icon(Icons.more_vert),
          ),
          Badge(
            value: cart.getLength.toString(),
            child: GestureDetector(
              child: Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.pushNamed(context, '/shoppingCart');
              },
            ),
          )
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
