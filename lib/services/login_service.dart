import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginService {
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
    if (userCreds != null) {
      //Collect userinfo

    }

    return true;
  }
}
