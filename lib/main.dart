import 'package:flutter/material.dart';
import 'package:orilla_fresca/view/cat_list/cat_list_page.dart';

import 'view/splash/splash_page.dart';
import 'view/welcome/welcome_page.dart';

void main() {
  runApp(const OrillaFrescaApp());
}

class OrillaFrescaApp extends StatelessWidget {
  const OrillaFrescaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orilla Fresca',
      theme: ThemeData(fontFamily: 'Raleway'),
      debugShowCheckedModeBanner: false,
      home: SplashPage(
        goToPage: CategoryListPage(),
        duration: 3,
      ),
    );
  }
}
