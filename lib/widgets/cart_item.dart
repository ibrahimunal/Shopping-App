import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopApp/providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final String productId;
  final int quantity;
  final String title;
  CartItem({
    this.id,
    this.price,
    this.quantity,
    this.title,
    this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              elevation: 3,
              title: Text("Are u sure?"),
              content: Text("Do you want to remove the item?"),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text("no")),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text("yes")),
              ],
            );
          },
        );
      },
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).primaryColor.withOpacity(0.7),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        elevation: 4,
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(
                child: Text(
                  (price / quantity).toString(),
                ),
              ),
            ),
          ),
          // leading: CircleAvatar(
          //   backgroundImage: NetworkImage(productList[index].imageUrl),
          //   backgroundColor: Colors.transparent,
          // ),
          title: Text(
            title.toString(),
          ),
          subtitle: Text(
            price.toString(),
          ),
          trailing: Text(quantity.toString() + "x"),
        ),
      ),
    );
  }
}
