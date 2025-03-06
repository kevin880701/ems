import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppleSignInProvider extends ChangeNotifier {
  
  bool _isSigningIn = false;

  bool get isSigningIn => _isSigningIn;

  String userEmail = "";

  String userPassword = "";

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future<UserCredential?> login() async {
    isSigningIn = true;
    try {
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: Platform.isIOS
            ? null
            : WebAuthenticationOptions(
                clientId: 'com.cwo.ihouseEMS',
                redirectUri: Uri.parse('https://ihouseems.firebaseapp.com/__/auth/handler'),
              ),
      nonce: Platform.isIOS ? nonce : null,
      );
      print('credential.identityToken${credential.identityToken}');
      final AuthCredential appleAuthCredential = OAuthProvider('apple.com').credential(
        idToken: credential.identityToken,
        rawNonce: Platform.isIOS ? rawNonce : null,
        accessToken: credential.authorizationCode,
      );
      print('Signed in with Apple! ${credential.authorizationCode}');
      final userCredential = await FirebaseAuth.instance.signInWithCredential(appleAuthCredential);
      return userCredential;
    } catch (e) {
      print('Error signing in with Apple: $e');
      return null;
    } finally {
      isSigningIn = false;
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  String generateNonce([int length = 32]) {
    const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) =>
    charset[random.nextInt(charset.length)]).join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
  
}
