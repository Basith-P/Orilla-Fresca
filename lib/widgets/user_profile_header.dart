import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../services/login_service.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({required this.showProfilePic, Key? key}) : super(key: key);

  final bool showProfilePic;

  @override
  Widget build(BuildContext context) {
    UserModel? user = context.read<LoginService>().loggedInUser;
    String imgPath = user != null ? user.photoUrl : '';

    return showProfilePic && imgPath.isNotEmpty
        ? Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(10),
            child: ClipOval(
              child: Image.network(
                imgPath,
                fit: BoxFit.cover,
              ),
            ),
          )
        : Container();
  }
}
