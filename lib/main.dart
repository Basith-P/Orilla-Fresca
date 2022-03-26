import 'package:flutter/material.dart';

import 'views/splash/splash_page.dart';
import 'views/onboarding/onboarding_page.dart';

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
      home: const SplashPage(
        goToPage: OnboardingPage(),
        duration: 3,
      ),
    );
  }
}
