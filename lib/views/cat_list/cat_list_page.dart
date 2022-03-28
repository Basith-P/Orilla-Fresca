import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/category_card.dart';
import '../../config/routes.dart' as routes;
import '../../services/category_selection_service.dart';
import '../../models/category.dart';
import '../../helper/utils.dart';

class CategoryListPage extends StatelessWidget {
  CategoryListPage({Key? key}) : super(key: key);

  final List<CategoryModel> _categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Select a category',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(10.0),
            itemCount: _categories.length,
            itemBuilder: (BuildContext context, int i) {
              return CategoryCard(
                category: _categories[i],
                onClick: () {
                  context.read<CategorySelectionService>().selectedCategory = _categories[i];
                  Utils.mainAppNav.currentState!.pushNamed(routes.selectedCategoryPage);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
