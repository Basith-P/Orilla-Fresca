import 'package:flutter/material.dart';

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
