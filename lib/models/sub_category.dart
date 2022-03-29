import 'dart:ui';

import 'category_part.dart';
import 'category.dart';

class SubCategoryModel extends CategoryModel {
  List<CategoryPart> parts;
  double price;
  int amount;

  SubCategoryModel({
    required String name,
    required String icon,
    required Color color,
    required String imgName,
    required this.parts,
    required this.price,
    this.amount = 0,
  }) : super(
          name: name,
          icon: icon,
          color: color,
          imgName: imgName,
        );

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      name: json['name'],
      icon: json['icon'],
      color: Color(int.parse('0xFF' + json['color'])),
      imgName: json['imgName'],
      parts: CategoryPart.fromJsonList(json['parts']),
      price: json['price'],
    );
  }

//fromJsonList
  static List<SubCategoryModel> fromJsonList(List<dynamic> jsonList) {
    List<SubCategoryModel> subCategoriesFromJson = [];

    for (var item in jsonList) {
      subCategoriesFromJson.add(SubCategoryModel.fromJson(item));
    }

    return subCategoriesFromJson;
  }
}
