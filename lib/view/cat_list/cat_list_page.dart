import 'package:flutter/material.dart';

import '../../models/category.dart';
import '../../helper/utils.dart';
import 'widgets/category_card.dart';

class CategoryListPage extends StatelessWidget {
  CategoryListPage({Key? key}) : super(key: key);

  final List<CategoryModel> _categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(),
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
                return CategoryCard(category: _categories[i]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
