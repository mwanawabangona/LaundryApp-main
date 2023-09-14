import 'package:flutter/foundation.dart';

import '../models/product.dart';

class Products with ChangeNotifier {
  List<Product> _cartItems = [];
  List<Product> get cartItems => _cartItems;

  void addToCart(Product prod) {
    if (_cartItems.contains(prod)) {
      prod.qty++;
    } else {
      _cartItems.add(prod);
    }
    notifyListeners();
  }

  void changeQty(Product prod, bool isDecrease) {
    if (isDecrease && prod.qty > 1) {
      prod.qty--;
    } else {
      if (prod.qty != 1 || !isDecrease) {
        prod.qty++;
      }
    }
    notifyListeners();
  }
}
