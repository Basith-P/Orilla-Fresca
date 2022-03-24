import 'package:flutter/material.dart';

import '../../../widgets/icon_font.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({
    Key? key,
    required this.color,
    required this.iconName,
    this.size = 30,
  }) : super(key: key);

  final Color color;
  final String iconName;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        padding: const EdgeInsets.all(10),
        color: color,
        child: IconFont(
          iconName: iconName,
          size: 30,
        ),
      ),
    );
  }
}
