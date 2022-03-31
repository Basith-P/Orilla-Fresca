import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:orilla_fresca/cart/cart_item_model.dart';
import 'package:orilla_fresca/models/sub_category.dart';
import 'package:orilla_fresca/services/login_service.dart';
import 'package:provider/provider.dart';

import '../services/category_selection_service.dart';
import '../services/category_service.dart';

class CartService with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  UnmodifiableListView<CartItem> get cartItems => UnmodifiableListView(_cartItems);

  void addCartItem(BuildContext context, CartItem item) {
    final loginService = context.read<LoginService>();
    _cartItems.insert(0, item);
    Map<String, int> cartMap = {};

    for (var item in cartItems) {
      cartMap[item.category.imgName] = (item.category as SubCategoryModel).quantity;
    }

    FirebaseFirestore.instance
        .collection('shoppers')
        .doc(loginService.loggedInUser!.uid)
        .set({'cart': cartMap}).then((value) {
      notifyListeners();
    });
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

  void loadCartItemsFromFirebase(BuildContext context) {
    if (_cartItems.isNotEmpty) {
      _cartItems.clear();
    }

    final loginService = context.read<LoginService>();
    final catService = context.read<CategoryService>();
    final catSelectionService = context.read<CategorySelectionService>();

    if (loginService.isLoggedIn) {
      FirebaseFirestore.instance
          .collection('shoppers')
          .doc(loginService.loggedInUser!.uid)
          .get()
          .then((snapshot) {
        Map<String, dynamic> cartItems = snapshot.data()!['cartItems'];

        for (var cat in catService.categories) {
          for (var subCat in cat.subCategories!) {
            if (cartItems.containsKey(subCat.imgName)) {
              var quantity = cartItems[subCat.imgName] as int;
              subCat.quantity = quantity;

              _cartItems.add(CartItem(category: subCat, quantity: quantity));

              if (catSelectionService.selectedCategory.name == subCat.name) {
                catSelectionService.selectedCategory = subCat;
              }
            }
          }
        }
      });

      notifyListeners();
    }
  }
}
