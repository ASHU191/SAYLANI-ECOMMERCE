
import 'package:e_commerce/Models/cart.dart';
import 'package:e_commerce/Data/data_product.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(Productdetails product) {
    final index =
        _items.indexWhere((item) => item.product.name == product.name);
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    // notifyListeners();
  }

  double get totalPrice => _items.fold(
      0,
      (sum, item) =>
          sum +
          (double.parse(item.product.price.substring(1)) * item.quantity));
}
