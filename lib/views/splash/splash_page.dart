import 'package:flutter/material.dart';
import 'package:orilla_fresca/services/category_service.dart';
import 'package:provider/provider.dart';

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
    Future.delayed(
      Duration(seconds: duration),
      () async {
        await context.read<CategoryService>().getCategoriesFromFirestore();
        Utils.mainAppNav.currentState!
            .pushReplacement(MaterialPageRoute(builder: (context) => goToPage));
      },
    );

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            IconFont(
              iconName: IconFontHelper.logo,
              size: 100,
            ),
            SizedBox(height: 60),
            SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
