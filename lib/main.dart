import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'config/routes.dart' as routes;
import 'services/login_service.dart';
import 'services/category_selection_service.dart';
import 'views/welcome/welcome_page.dart';

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
        Provider(create: (_) => LoginService()),
        Provider(create: (_) => CategorySelectionService()),
      ],
      child: MaterialApp(
        title: 'Orilla Fresca',
        theme: ThemeData(fontFamily: 'Raleway'),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: routes.generateRoute,
        onGenerateInitialRoutes: (String initialRouteName) => [
          routes.generateRoute(
            const RouteSettings(name: routes.splashPage, arguments: WelcomePage()),
          ),
        ],
        initialRoute: routes.splashPage,
      ),
    );
  }
}
