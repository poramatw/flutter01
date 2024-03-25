import 'package:flutter/material.dart';

import '../models/cart_models.dart';

class CreateProvider extends ChangeNotifier {
  int _count = 0;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class CartProvider extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  double get totalPrice => _items.fold(0.0, (sum, item) => sum + item.price);

  void addItem(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeItem(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
