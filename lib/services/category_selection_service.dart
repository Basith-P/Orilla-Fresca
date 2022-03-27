import 'package:flutter/cupertino.dart';

import '../models/category.dart';
import '../models/sub_category.dart';

class CategorySelectionService with ChangeNotifier {
  late CategoryModel _selectedCategory;
  late SubCategoryModel _selectedSubCategory;

  CategoryModel get selectedCategory => _selectedCategory;
  set selectedCategory(CategoryModel value) {
    _selectedCategory = value;
    notifyListeners();
  }

  SubCategoryModel get selectedSubCategory => _selectedSubCategory;
  set selectedSubCategory(SubCategoryModel value) {
    _selectedSubCategory = value;
    notifyListeners();
  }
}
