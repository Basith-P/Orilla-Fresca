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

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      icon: json['icon'],
      color: Color(int.parse('0xFF' + json['color'])),
      imgName: json['imgName'],
      subCategories: SubCategoryModel.fromJsonList(json['subCategories']),
    );
  }
}
