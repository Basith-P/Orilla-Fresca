import 'package:flutter/material.dart';
import 'package:orilla_fresca/models/category.dart';

import '../views/details/details_page.dart';
import '../views/onboarding/onboarding_page.dart';
import '../views/selected_category/selected_category_page.dart';
import '../views/splash/splash_page.dart';
import '../views/welcome/welcome_page.dart';
import '../views/cat_list/cat_list_page.dart';
import '../models/sub_category.dart';

const String catListPage = 'catListPage';
const String detailsPage = 'detailsPage';
const String onboardingPage = 'onboardingPage';
const String selectedCategoryPage = 'selectedCategoryPage';
const String splashPage = 'splashPage';
const String welcomePage = 'welcomePage';

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;

  switch (settings.name) {
    case catListPage:
      return MaterialPageRoute(builder: (_) => CategoryListPage());
    case detailsPage:
      return MaterialPageRoute(builder: (_) => DetailsPage(args as SubCategoryModel));
    case onboardingPage:
      return MaterialPageRoute(builder: (_) => const OnboardingPage());
    case selectedCategoryPage:
      return MaterialPageRoute(builder: (_) => SelectecCategoryPage(args as CategoryModel));
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
