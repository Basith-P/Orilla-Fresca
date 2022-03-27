import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/routes.dart' as routes;
import 'package:orilla_fresca/config/theme/colors.dart';
import 'package:orilla_fresca/widgets/icon_font.dart';
import '../../../helper/icon_helper.dart';
import '../../../services/login_service.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = context.read<LoginService>().loggedInUser != null;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () async {
                  if (isLoggedIn) {
                    await context.read<LoginService>().logOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, routes.welcomePage, (route) => false);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Logged out'),
                      ),
                    );
                  } else {
                    await context.read<LoginService>().signInWithGoogle();
                    Navigator.pushNamedAndRemoveUntil(
                        context, routes.catListPage, (route) => false);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Signed in successfully'),
                      ),
                    );
                  }
                },
                icon: Icon(isLoggedIn ? Icons.logout_rounded : Icons.login_rounded),
                label: Text(
                  isLoggedIn ? 'Sign out' : 'Sign in',
                  style: const TextStyle(fontSize: 20),
                ),
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
