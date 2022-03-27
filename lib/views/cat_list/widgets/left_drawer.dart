import 'package:flutter/material.dart';
import 'package:orilla_fresca/config/theme/colors.dart';
import 'package:orilla_fresca/widgets/icon_font.dart';

import '../../../helper/icon_helper.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout_rounded, size: 32),
                label: const Text('Log out', style: TextStyle(fontSize: 20)),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
              ),
              const IconFont(iconName: IconFontHelper.logo, size: 70),
            ],
          ),
        ),
      ),
    );
  }
}
