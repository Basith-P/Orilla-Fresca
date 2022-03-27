import 'package:flutter/material.dart';

import '../../config/routes.dart' as routes;
import 'package:orilla_fresca/config/theme/colors.dart';
import 'package:orilla_fresca/helper/icon_helper.dart';
import 'package:orilla_fresca/views/welcome/welcome_page.dart';
import 'package:orilla_fresca/widgets/icon_font.dart';

import '../../models/onboarding_content.dart';
import '../../helper/utils.dart';
import '../../widgets/theme_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final List<OnboardingContent> _content = Utils.getOnboarding();
  int pageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                children: List.generate(
                  _content.length,
                  (index) => Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.topRight,
                                child: IconFont(
                                  iconName: IconFontHelper.logo,
                                  color: AppColors.primary,
                                  size: 40,
                                ),
                              ),
                              const SizedBox(height: 50),
                              Image.asset('assets/imgs/${_content[index].img}.png'),
                              const SizedBox(height: 100),
                              Text(
                                _content[index].msg,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: index == _content.length - 1,
                          child: ThemeButton(
                            label: 'Enter now!',
                            color: AppColors.darkGreen,
                            onClick: () => Navigator.pushNamed(context, routes.welcomePage),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //pagination
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _content.length,
                (index) => GestureDetector(
                  onTap: (() => _pageController.animateToPage(
                        index,
                        duration: const Duration(microseconds: 500),
                        curve: Curves.easeOut,
                      )),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 5,
                        color:
                            index == pageIndex ? const Color(0xffC1e09e) : const Color(0xffF5F5F5),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ThemeButton(
                label: 'Get onboarded',
                onClick: () => Navigator.pushNamed(context, routes.welcomePage),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
