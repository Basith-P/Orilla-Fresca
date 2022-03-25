import 'package:flutter/material.dart';

import '../config/theme/colors.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    Key? key,
    required this.label,
    required this.onClick,
    this.color = AppColors.primary,
    this.highlight = AppColors.highlightDefault,
    this.icon,
    this.borderColor = Colors.transparent,
    this.labelColor = Colors.white,
    this.borderWidth = 0,
  }) : super(key: key);

  final String label;
  final VoidCallback onClick;
  final Color color;
  final Color highlight;
  final Widget? icon;
  final Color borderColor;
  final Color labelColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          shape: StadiumBorder(
            side: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: labelColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      );
}
