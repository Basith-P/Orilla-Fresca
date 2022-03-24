import 'package:flutter/material.dart';

import 'helper/icon_helper.dart';
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
        color: const Color(0xff80c038),
        child: const IconFont(
          iconName: IconFontHelper.logo,
          size: 100,
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'assets/imgs/of_main_bg.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Container(
                  width: 180,
                  height: 180,
                  color: const Color(0xff80c038),
                  alignment: Alignment.center,
                  child: const IconFont(
                    iconName: IconFontHelper.mainLogo,
                    size: 130,
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
