import 'package:flutter/material.dart';

import '../../config/theme/colors.dart';
import '../../helper/icon_helper.dart';
import '../../helper/utils.dart';
import '../../widgets/icon_font.dart';

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
      Utils.mainAppNav.currentState!.pushReplacement(
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
