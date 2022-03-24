import 'package:flutter/material.dart';
import 'package:orilla_fresca/config/theme/colors.dart';
import 'package:orilla_fresca/helper/icon_helper.dart';
import 'package:orilla_fresca/view/selected_category/selected_category_page.dart';
import 'package:orilla_fresca/widgets/icon_font.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.primary),
        title: const IconFont(
          iconName: IconFontHelper.logo,
          color: AppColors.primary,
          size: 40,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(10),
            child: ClipOval(
              child: Image.asset(
                'assets/imgs/me.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
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
                  onClick: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectecCategoryPage(_categories[i]))),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded),
            activeIcon: Icon(Icons.favorite_rounded),
            label: 'favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart_rounded),
            label: 'cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop_outlined),
            activeIcon: Icon(Icons.pin_drop_rounded),
            label: 'location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings_rounded),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}
