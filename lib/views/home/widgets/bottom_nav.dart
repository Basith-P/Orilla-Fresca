import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/routes.dart' as routes;
import '../../../helper/utils.dart';
import '../../../cart/cart_service.dart';
import '../../../config/theme/colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _pages = [
      routes.catListPage,
      routes.shoppingListPage,
      routes.favoritesPage,
      routes.settingsPage,
    ];

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (i) => Utils.mainListNav.currentState!.pushReplacementNamed(_pages[i]),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list_rounded),
          label: 'categories',
        ),
        BottomNavigationBarItem(
          icon: CartIconBottomNav(Icons.shopping_cart_outlined),
          activeIcon: CartIconBottomNav(Icons.shopping_cart_rounded),
          label: 'cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline_rounded),
          activeIcon: Icon(Icons.favorite_rounded),
          label: 'favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          activeIcon: Icon(Icons.settings_rounded),
          label: 'settings',
        ),
      ],
    );
  }
}

class CartIconBottomNav extends StatelessWidget {
  const CartIconBottomNav(
    this.icon, {
    Key? key,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartService>(
      builder: (context, cart, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon),
            Visibility(
              visible: cart.cartItems.isNotEmpty,
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  Text(cart.cartItems.length.toString()),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
