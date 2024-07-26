import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/helpers/constants/strings-en.dart';
import 'package:movie_app/screens/movie_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class AuthenticationManager {
  Future logInUser(
    String emailAddress,
    String password,
    BuildContext context,
    Function callBack,
  ) async {
    try {
      var response = await _auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);

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
    String emailAddress,
    String password,
    BuildContext context,
    Function callBack,
  ) async {
    try {
      var response = await _auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
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

  bool isLoggedIn(SharedPreferences sharedPrefs){
    return sharedPrefs.getString('emailAddress') != null;
  }

  Future singOut() async {
    await _auth.signOut();
  }
}
