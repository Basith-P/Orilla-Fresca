import 'dart:ui';

import 'category_part.dart';
import 'category.dart';

class SubCategoryModel extends CategoryModel {
  List<CategoryPart> parts;

  SubCategoryModel({
    required String name,
    required String icon,
    required Color color,
    required String imgName,
    required this.parts,
  }) : super(
          name: name,
          icon: icon,
          color: color,
          imgName: imgName,
        );
}
