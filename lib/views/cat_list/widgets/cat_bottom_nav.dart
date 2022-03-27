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
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline_rounded),
          activeIcon: Icon(Icons.favorite_rounded),
          label: 'favorite',
        ),
        BottomNavigationBarItem(
          icon: CartIconBottomNav(Icons.shopping_cart_outlined),
          activeIcon: CartIconBottomNav(Icons.shopping_cart_rounded),
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
