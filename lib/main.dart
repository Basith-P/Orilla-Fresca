import 'package:flutter/material.dart';

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
      home: SplashPage(),
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
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: const Color(0xff80c038),
        child: const IconFont(iconName: 'a', size: 100),
      ),
    );
  }
}
