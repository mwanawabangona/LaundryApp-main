import 'package:flutter/foundation.dart';
import 'package:laundryapp/constants/constants.dart';
import 'package:laundryapp/widgets/custom_toast.dart';

import '../models/product.dart';

class Products with ChangeNotifier {
  List<Product> _cartItems = [];
  List<Product> get cartItems => _cartItems;

  void addToCart(Product prod) {
    Toast.showToast(
        message: '${prod.name} added to cart', type: ToastType.success);
    if (_cartItems.contains(prod)) {
      prod.qty++;
    } else {
      _cartItems.add(prod);
    }
    notifyListeners();
  }

  double get total {
    double sum = 0.0;
    for (var element in _cartItems) {
      sum += element.price * element.qty;
    }
    return sum;
  }

  int get totalClothes {
    int sum = 0;
    for (var element in _cartItems) {
      sum += element.qty;
    }
    return sum;
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

  void clearCart() {
    Toast.showToast(message: 'Cart cleared', type: ToastType.success);
    for (var prod in _cartItems) {
      prod.qty = 1;
    }
    _cartItems.clear();
    notifyListeners();
  }

  void removeItemfromCart(Product prod) {
    Toast.showToast(message: '${prod.name} removed', type: ToastType.success);
    prod.qty = 1;
    _cartItems.remove(prod);
    notifyListeners();
  }
}
