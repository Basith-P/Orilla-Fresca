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
}
