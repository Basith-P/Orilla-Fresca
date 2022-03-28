import 'package:flutter/material.dart';

import '../cat_list/cat_list_page.dart';
import '../favorites/favorites_page.dart';
import '../settings/settings_page.dart';
import '../shpping_list/shopping_list_page.dart';
import 'widgets/bottom_nav.dart';
import '../../config/routes.dart' as routes;
import '../../helper/utils.dart';
import '../../views/cat_list/widgets/left_drawer.dart';
import '../../widgets/main_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          const SizedBox(height: 10),
          Expanded(
            child: Navigator(
              key: Utils.mainListNav,
              initialRoute: routes.catListPage,
              onGenerateRoute: (RouteSettings settings) {
                Widget page;

                switch (settings.name) {
                  case routes.catListPage:
                    page = CategoryListPage();
                    break;
                  case routes.favoritesPage:
                    page = const FavoritesPage();
                    break;
                  case routes.shoppingListPage:
                    page = const ShoppingListPage();
                    break;
                  case routes.settingsPage:
                    page = const SettingsPage();
                    break;
                  default:
                    page = CategoryListPage();
                }

                return PageRouteBuilder(
                  pageBuilder: (_, __, ___) => page,
                  transitionDuration: const Duration(seconds: 0),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
