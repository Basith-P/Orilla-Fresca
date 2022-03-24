import 'package:flutter/material.dart';

import '../../models/category.dart';
import '../cat_list/widgets/category_icon.dart';

class SelectecCategoryPage extends StatelessWidget {
  const SelectecCategoryPage(this.selectedCategory, {Key? key}) : super(key: key);

  final CategoryModel selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryIcon(
                color: selectedCategory.color,
                iconName: selectedCategory.icon,
              ),
              const SizedBox(width: 10),
              Text(
                selectedCategory.name,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Expanded(
            child: GridView.count(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(
                selectedCategory.subCategories!.length,
                (index) => GestureDetector(
                  child: GridTile(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/imgs/${selectedCategory.subCategories![index].imgName}.png',
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(selectedCategory.subCategories![index].name),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
