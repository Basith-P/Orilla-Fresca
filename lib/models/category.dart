import 'dart:ui';

class CategoryModel {
  String name;
  String icon;
  Color color;
  String imgName;
  List<CategoryModel> subCategories;

  CategoryModel({
    required this.name,
    required this.icon,
    required this.color,
    required this.imgName,
    required this.subCategories,
  });
}
