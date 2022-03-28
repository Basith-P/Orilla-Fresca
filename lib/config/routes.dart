import 'package:flutter/material.dart';

import '../views/details/details_page.dart';
import '../views/home/homepage.dart';
import '../views/onboarding/onboarding_page.dart';
import '../views/selected_category/selected_category_page.dart';
import '../views/splash/splash_page.dart';
import '../views/welcome/welcome_page.dart';
import '../views/cat_list/cat_list_page.dart';

const String homePage = 'homePage';
const String catListPage = 'catListPage';
const String detailsPage = 'detailsPage';
const String onboardingPage = 'onboardingPage';
const String selectedCategoryPage = 'selectedCategoryPage';
const String splashPage = 'splashPage';
const String welcomePage = 'welcomePage';
const String favoritesPage = 'favoritesPage';
const String settingsPage = 'settingsPage';
const String shoppingListPage = 'shoppingListPage';

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;

  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (_) => const HomePage());
    case catListPage:
      return MaterialPageRoute(builder: (_) => CategoryListPage());
    case detailsPage:
      return MaterialPageRoute(builder: (_) => const DetailsPage());
    case onboardingPage:
      return MaterialPageRoute(builder: (_) => const OnboardingPage());
    case selectedCategoryPage:
      return MaterialPageRoute(builder: (_) => const SelectecCategoryPage());
    case splashPage:
      return MaterialPageRoute(
          builder: (_) => SplashPage(
                goToPage: args as Widget,
                duration: 3,
              ));
    case welcomePage:
      return MaterialPageRoute(builder: (_) => const WelcomePage());
    default:
      return MaterialPageRoute(builder: (_) => CategoryListPage());
  }
}
