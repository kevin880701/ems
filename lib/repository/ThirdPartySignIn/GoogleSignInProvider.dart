
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {

  final googleSignIn = GoogleSignIn();
  
  late bool _isSigningIn;

  GoogleSignInProvider() {
    _isSigningIn = false;
  }

  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future<UserCredential?> login() async {
    try {
      isSigningIn = true;
      final user = await googleSignIn.signIn();
      if (user == null) {
        isSigningIn = false;
        return null;
      }
      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      var signIn = await FirebaseAuth.instance.signInWithCredential(credential);
      return signIn;
      // return true;
    } catch (e) {
      print("Error signing in with Google: $e");
      return null;
    } finally {
      isSigningIn = false;
    }
  }

  void logout() async {
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
