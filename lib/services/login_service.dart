import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:orilla_fresca/models/user_model.dart';

class LoginService with ChangeNotifier {
  UserModel? _userModel;

  UserModel? get loggedInUser => _userModel;

  Future<bool> signInWithGoogle() async {
    //Trigger auth workflow
    GoogleSignIn _googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) {
      return false;
    }

    //obtain auth details form the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    //create a new google auth credential
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //Once signed in , return the user credentials
    UserCredential userCreds = await FirebaseAuth.instance.signInWithCredential(credential);
    _userModel = UserModel(
      uid: userCreds.user!.uid,
      displayName: userCreds.user!.displayName!,
      email: userCreds.user!.email!,
      photoUrl: userCreds.user!.photoURL!,
    );
    return true;
  }

  Future<void> logOut() async {
    await GoogleSignIn().signOut();
    _userModel = null;
  }

  bool get isLoggedIn => _userModel != null;
}
