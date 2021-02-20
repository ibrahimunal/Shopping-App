import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopApp/providers/cart.dart';
import 'package:shopApp/providers/product.dart';
import 'package:shopApp/providers/products.dart';
import 'package:shopApp/screens/edit_product_screen.dart';
import 'package:shopApp/screens/product_overview_screen.dart';
import 'package:shopApp/screens/product_detail_screen.dart';
import 'package:shopApp/screens/shopping_cart_screen.dart';
import 'package:shopApp/screens/user_products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          '/shoppingCart': (context) => ShoppingCart(),
          UserProdutcsScreen.routeName: (context) => UserProdutcsScreen(),
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          ProductsOverviewScreen.routeName: (context) =>
              ProductsOverviewScreen(),
          EditProdutcsScreen.routeName: (context) => EditProdutcsScreen()
        },
      ),
    );
  }
}
