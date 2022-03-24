import 'dart:ui';

import 'sub_category.dart';

class CategoryModel {
  String name;
  String icon;
  Color color;
  String imgName;
  List<SubCategoryModel>? subCategories;

  CategoryModel({
    required this.name,
    required this.icon,
    required this.color,
    required this.imgName,
    this.subCategories,
  });
}
