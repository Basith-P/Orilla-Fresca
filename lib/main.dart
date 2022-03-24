import 'package:flutter/material.dart';

import 'package:orilla_fresca/helper/icon_helper.dart';

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

class IconFont extends StatelessWidget {
  const IconFont({
    required this.iconName,
    this.color = Colors.white,
    this.size = 24,
    Key? key,
  }) : super(key: key);

  final String iconName;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      iconName,
      style: TextStyle(
        fontFamily: 'Orilla',
        fontSize: size,
        color: color,
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
      body: Container(
        alignment: Alignment.center,
        child: Text('Hello WOrld'),
      ),
    );
  }
}
