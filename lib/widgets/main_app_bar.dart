import 'package:flutter/material.dart';
import 'package:orilla_fresca/widgets/user_profile_header.dart';

import '../config/theme/colors.dart';
import '../helper/icon_helper.dart';
import 'icon_font.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({
    this.themeColor = AppColors.primary,
    this.showProfilePic = true,
    Key? key,
  }) : super(key: key);

  final Color themeColor;
  final bool showProfilePic;

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
        UserProfileHeader(
          showProfilePic: widget.showProfilePic,
        )
      ],
    );
  }
}
