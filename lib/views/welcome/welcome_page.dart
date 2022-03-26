import 'package:flutter/material.dart';
import 'package:orilla_fresca/widgets/theme_button.dart';

import '../../config/theme/colors.dart';
import '../../helper/icon_helper.dart';
import '../../widgets/icon_font.dart';
import '../cat_list/cat_list_page.dart';

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
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: ClipOval(
                    child: Container(
                      width: 180,
                      height: 180,
                      color: AppColors.primary,
                      alignment: Alignment.center,
                      child: const IconFont(
                        iconName: IconFontHelper.mainLogo,
                        size: 130,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  'Welcome',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Fresh Products\nHealthy, On time',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 60),
                ThemeButton(
                  label: 'Try Now!',
                  onClick: () {},
                ),
                const SizedBox(height: 20),
                ThemeButton(
                  label: 'Log in',
                  onClick: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => CategoryListPage())),
                  labelColor: AppColors.primary,
                  color: Colors.transparent,
                  borderColor: AppColors.primary,
                  borderWidth: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
