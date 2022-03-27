import '../models/category.dart';

class CartItem {
  CategoryModel category;
  int quantity;

  CartItem({required this.category, this.quantity = 0});
}
