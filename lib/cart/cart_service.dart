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

  bool isSubCatAddedToCart(SubCategoryModel item) {
    return _cartItems.isNotEmpty
        ? _cartItems.any((element) => element.category.name == item.name)
        : false;
  }
}