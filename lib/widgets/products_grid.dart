import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopApp/providers/product.dart';
import 'package:shopApp/providers/products.dart';
import 'package:shopApp/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  const ProductsGrid(
    this.showFavs,
  );
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false);
    final loadedProducts = showFavs ? products.favoriteItems : products.items;
    return GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: loadedProducts.length,
        itemBuilder: (context, index) => ChangeNotifierProvider(
              create: (BuildContext context) => loadedProducts[index],
              child: ProductItem(
                  // id: loadedProducts[index].id,
                  // imageUrl: loadedProducts[index].imageUrl,
                  // title: loadedProducts[index].title,
                  // price: loadedProducts[index].price,
                  // description: loadedProducts[index].description
                  ),
            ));
  }
}
