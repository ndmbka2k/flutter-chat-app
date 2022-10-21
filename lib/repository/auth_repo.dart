import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRepo {
  Future<UserCredential?> signInWithCredential(String email, String password);

  Future<UserCredential?> signInWithGoogle();

  Future registerUserWithEmail();
}

class AuthRepoImplement implements AuthRepo {
  @override
  Future<UserCredential?> signInWithCredential(
    String email,
    String password,
  ) async {
    try {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      log('Sign in with email ERROR: $e');
    }
    return null;
  }

  @override
  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    try {
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      log('Sign in with google ERROR: $e');
    }
    return null;
  }

  @override
  Future registerUserWithEmail() {
    throw UnimplementedError();
  }
}
