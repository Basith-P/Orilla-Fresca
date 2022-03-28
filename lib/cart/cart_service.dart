import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:orilla_fresca/cart/cart_item_model.dart';
import 'package:orilla_fresca/models/sub_category.dart';

class CartService with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  UnmodifiableListView<CartItem> get cartItems => UnmodifiableListView(_cartItems);

  void addCartItem(CartItem item) {
    _cartItems.insert(0, item);
    notifyListeners();
  }

  void removeCartItem(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  bool isSubCatAddedToCart(SubCategoryModel item) {
    return _cartItems.isNotEmpty
        ? _cartItems.any((element) => element.category.name == item.name)
        : false;
  }

  SubCategoryModel? getCategoryFromCart(SubCategoryModel cat) {
    SubCategoryModel? subCat = cat;
    if (_cartItems.isNotEmpty &&
        _cartItems.any((CartItem item) => item.category.name == cat.name)) {
      CartItem cartItem = _cartItems.firstWhere((CartItem item) => item.category.name == cat.name);
      subCat = cartItem.category as SubCategoryModel?;
    }
    return subCat;
  }
}
