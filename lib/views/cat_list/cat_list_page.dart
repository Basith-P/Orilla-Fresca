import 'package:flutter/material.dart';
import 'package:orilla_fresca/services/category_selection_service.dart';
import 'package:provider/provider.dart';

import '../../views/cat_list/widgets/left_drawer.dart';
import '../../config/routes.dart' as routes;
import '../../config/theme/colors.dart';
import '../../widgets/main_app_bar.dart';
import '../../models/category.dart';
import '../../helper/utils.dart';
import 'widgets/cat_bottom_nav.dart';
import 'widgets/category_card.dart';

class CategoryListPage extends StatelessWidget {
  CategoryListPage({Key? key}) : super(key: key);

  final List<CategoryModel> _categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: LeftDrawer(),
      ),
      appBar: const MainAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
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
                    Navigator.pushNamed(context, routes.selectedCategoryPage);
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CategoryBottomNavBar(),
    );
  }
}
