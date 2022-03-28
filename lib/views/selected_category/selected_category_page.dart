import 'package:flutter/material.dart';
import 'package:orilla_fresca/cart/cart_service.dart';
import 'package:provider/provider.dart';

import '../../helper/utils.dart';
import '../../services/category_selection_service.dart';
import '../../widgets/main_app_bar.dart';
import '../../config/routes.dart' as routes;
import '../cat_list/widgets/category_icon.dart';

class SelectecCategoryPage extends StatelessWidget {
  const SelectecCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryProvR = context.read<CategorySelectionService>();
    final selectedCategory = categoryProvR.selectedCategory;
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
                  var subcategory = selectedCategory.subCategories![index];
                  return GestureDetector(
                    onTap: () {
                      categoryProvR.selectedSubCategory =
                          context.read<CartService>().getCategoryFromCart(subcategory)!;
                      Utils.mainAppNav.currentState!.pushNamed(routes.detailsPage);
                    },
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
