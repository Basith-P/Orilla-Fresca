import 'package:flutter/material.dart';

import 'config/theme/colors.dart';
import 'helper/icon_helper.dart';
import 'view/welcome/welcome_page.dart';
import 'widgets/icon_font.dart';

void main() {
  runApp(const OrillaFrescaApp());
}

class OrillaFrescaApp extends StatelessWidget {
  const OrillaFrescaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Orilla Fresca',
      debugShowCheckedModeBanner: false,
      home: SplashPage(
        goToPage: WelcomePage(),
        duration: 3,
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({
    required this.goToPage,
    this.duration = 0,
    Key? key,
  }) : super(key: key);

  final int duration;
  final Widget goToPage;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => goToPage),
      );
    });

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: AppColors.primary,
        child: const IconFont(
          iconName: IconFontHelper.logo,
          size: 100,
        ),
      ),
    );
  }
}
