import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopApp/providers/cart.dart';
import 'package:shopApp/providers/products.dart';
import 'package:shopApp/widgets/cart_item.dart' as ci;

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<Cart>(context);
    var cartItems = state.items.values.toList();
    showAlertDialog(BuildContext context, String id) {
      // set up the button
      Widget okButton = FlatButton(
        child: Text("Remove"),
        onPressed: () {
          state.removeItem(id);
          Navigator.of(context).pop();
        },
      );
      Widget cancelButton = FlatButton(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("My title"),
        content: Text("Are you sure you want to remove"),
        actions: [okButton, cancelButton],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Shopping Cart'),
        ),
        body: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(Icons.attach_money),
                title: Text(
                    state.getTotalPrice().floorToDouble().toString() + " \$"),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ci.CartItem(
                    id: cartItems[index].id,
                    productId: state.items.keys.toList()[index],
                    title: cartItems[index].title,
                    price: cartItems[index].price * cartItems[index].quantatiy,
                    quantity: cartItems[index].quantatiy,
                  );
                },
                itemCount: cartItems.length,
              ),
            ),
          ],
        ));
  }
}
