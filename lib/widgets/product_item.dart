import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopApp/providers/cart.dart';
import 'package:shopApp/providers/product.dart';
import 'package:shopApp/providers/products.dart';
import 'package:shopApp/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final double price;
  // final String description;
  // final String imageUrl;

  // const ProductItem(
  //     {this.id, this.title, this.imageUrl, this.price, this.description});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);

    return Consumer<Cart>(
      builder: (context, state, child) => Container(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
              footer: GridTileBar(
                leading: IconButton(
                  icon: Icon(product.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border),
                  color: Colors.red,
                  onPressed: () {
                    product.toggle();
                  },
                ),
                backgroundColor: Colors.black54,
                title: Text(
                  product.title,
                  textAlign: TextAlign.center,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.yellow[800],
                  ),
                  onPressed: () {
                    cart.addItem(product.id, product.price, product.title);
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Item is added to the cart',
                        textAlign: TextAlign.center,
                      ),
                      duration: Duration(milliseconds: 350),
                    ));
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
