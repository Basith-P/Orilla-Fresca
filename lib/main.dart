import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'config/theme/app_theme.dart';
import 'helper/utils.dart';
import 'config/routes.dart' as routes;
import 'services/login_service.dart';
import 'services/category_selection_service.dart';
import 'services/category_service.dart';
import 'cart/cart_service.dart';
import 'views/onboarding/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const OrillaFrescaApp());
}

class OrillaFrescaApp extends StatelessWidget {
  const OrillaFrescaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => CategoryService()),
        ChangeNotifierProvider(create: (_) => LoginService()),
        ChangeNotifierProvider(create: (_) => CategorySelectionService()),
        ChangeNotifierProvider(create: (_) => CartService()),
      ],
      child: MaterialApp(
        title: 'Orilla Fresca',
        theme: AppTheme.lightTheme,
        navigatorKey: Utils.mainAppNav,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: routes.generateRoute,
        onGenerateInitialRoutes: (String initialRouteName) => [
          routes.generateRoute(
            const RouteSettings(name: routes.splashPage, arguments: OnboardingPage()),
          ),
        ],
        initialRoute: routes.splashPage,
      ),
    );
  }
}
