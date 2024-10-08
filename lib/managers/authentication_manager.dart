import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/helpers/constants/strings-en.dart';
import 'package:movie_app/managers/user_manager.dart';
import 'package:movie_app/screens/login_screen.dart';
import 'package:movie_app/screens/movie_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';


FirebaseAuth _auth = FirebaseAuth.instance;

class AuthenticationManager {
  static final UserManager _userManager = UserManager();

  //Google sign in/up

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;

      _userManager.saveLogInUser(
        user?.email ?? '',
        user?.uid ?? '',
      );

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<void>(builder: (BuildContext context) => const MovieListScreen()),
        (route) => false,
      );
    } catch (e) {
      print("Error signing in with Google: $e");
      SnackBar errorSnackBar = SnackBar(
        content: Text(e.toString()),
      );
      ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
    }
  }

//Email and password sign in/up

  Future logInUser(
    String email,
    String password,
    BuildContext context,
    Function callBack,
  ) async {
    try {
      var response = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _userManager.saveLogInUser(
        response.user?.email ?? '',
        response.user?.uid ?? '',
      );

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => const MovieListScreen()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        throw 'Wrong password provided for that user.';
      } else {
        throw 'Failed to log in: ${e.message}';
      }
    }
  }

  Future signUpUser(
    String email,
    String password,
    BuildContext context,
    Function callBack,
  ) async {
    try {
      var response = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _userManager.saveLogInUser(
        response.user?.email ?? '',
        response.user?.uid ?? '',
      );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => const MovieListScreen()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'The account already exists for that email.';
      } else {
        throw 'Failed to sign up: ${e.message}';
      }
    } catch (e) {
      throw 'Failed to sign up: $e';
    }

    callBack();
  }

  void saveUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('emailAddress', emailAddress);
  }

  bool isLoggedIn(SharedPreferences sharedPrefs) {
    return sharedPrefs.getString('emailAddress') != null;
  }

  Future signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => const LogInScreen()),
          (route) => false);
  }

  




}