import 'dart:ui';

import 'category.dart';

class SubCategoryModel extends CategoryModel {
  SubCategoryModel({
    required String name,
    required String icon,
    required Color color,
    required String imgName,
  }) : super(
          name: name,
          icon: icon,
          color: color,
          imgName: imgName,
        );
}
