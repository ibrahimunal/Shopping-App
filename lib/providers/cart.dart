import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantatiy;
  final double price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantatiy,
      @required this.price});
}

class Cart with ChangeNotifier {
  var _totalQuantiity = 0;
  double _totalPrice = 0;

  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get getLength {
    return _totalQuantiity;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      //change quantity
      _items.update(
          productId,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              quantatiy: value.quantatiy + 1,
              price: value.price));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantatiy: 1));
    }
    _totalQuantiity++;
    notifyListeners();
  }

  double getTotalPrice() {
    _items.forEach((key, value) {
      _totalPrice += value.price * value.quantatiy;
    });

    return _totalPrice;
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}
