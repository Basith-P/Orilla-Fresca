import 'package:flutter/material.dart';

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
                const SizedBox(height: 40),
                const Text(
                  'Welcome',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Fresh Products.\n Healthy. On time',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 40),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                  child: const Text(
                    'Try Now!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const CategoryListPage())),
                  style: TextButton.styleFrom(
                    primary: AppColors.primary,
                    shape: const StadiumBorder(
                        side: BorderSide(
                      color: Color(0xff80c038),
                      width: 2,
                    )),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      color: Color(0xff80c038),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
