import 'package:flutter/material.dart';
import 'package:orilla_fresca/cart/cart_service.dart';
import 'package:provider/provider.dart';

import '../../../config/theme/colors.dart';

class CategoryBottomNavBar extends StatelessWidget {
  const CategoryBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite_outline_rounded),
          activeIcon: const Icon(Icons.favorite_rounded),
          label: 'favorite',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          activeIcon: Icon(Icons.shopping_cart_rounded),
          label: 'cart',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.pin_drop_outlined),
          activeIcon: Icon(Icons.pin_drop_rounded),
          label: 'location',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          activeIcon: Icon(Icons.settings_rounded),
          label: 'settings',
        ),
      ],
    );
  }
}
