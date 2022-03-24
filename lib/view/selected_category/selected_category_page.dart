import 'package:flutter/material.dart';
import 'package:orilla_fresca/widgets/main_app_bar.dart';

import '../../models/category.dart';
import '../cat_list/widgets/category_icon.dart';
import '../details/details_page.dart';

class SelectecCategoryPage extends StatelessWidget {
  const SelectecCategoryPage(this.selectedCategory, {Key? key}) : super(key: key);

  final CategoryModel selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 20),
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
          const SizedBox(height: 30),
          Expanded(
            child: GridView.count(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(
                selectedCategory.subCategories!.length,
                (index) {
                  final subcategory = selectedCategory.subCategories![index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => DetailsPage(subcategory))),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/imgs/${subcategory.imgName}.png',
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(subcategory.name),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
