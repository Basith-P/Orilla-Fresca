import '../models/category.dart';
import '../models/sub_category.dart';

class CategorySelectionService {
  CategoryModel? _selectedCategory;
  SubCategoryModel? _selectedSubCategory;

  CategoryModel? get selectedCategory => _selectedCategory;
  set SelectecCategory(CategoryModel value) {
    _selectedCategory = value;
  }

  SubCategoryModel? get selectedSubCategory => _selectedSubCategory;
  set SelectedSubCategory(SubCategoryModel value) {
    _selectedSubCategory = value;
  }
}
