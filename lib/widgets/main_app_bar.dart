import 'package:flutter/material.dart';

import '../config/theme/colors.dart';
import '../helper/icon_helper.dart';
import 'icon_font.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({
    this.themeColor = AppColors.primary,
    Key? key,
  }) : super(key: key);

  final Color themeColor;

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      iconTheme: IconThemeData(color: widget.themeColor),
      title: IconFont(
        iconName: IconFontHelper.logo,
        color: widget.themeColor,
        size: 40,
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.all(10),
          child: ClipOval(
            child: Image.asset(
              'assets/imgs/me.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
