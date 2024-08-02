import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:movie_app/helpers/constants/constants.dart';
import 'package:movie_app/helpers/constants/routes_name.dart';
import 'package:movie_app/helpers/constants/strings-en.dart';
import 'package:movie_app/managers/authentication_manager.dart';

class CredentialsView extends StatefulWidget {
  final String screenTitle;
  final String buttonTitle;
  final bool isSignupScreen;

  const CredentialsView({
    super.key,
    required this.screenTitle,
    required this.buttonTitle,
    this.isSignupScreen = false,
  });

  @override
  _LoginOrSignupView createState() => _LoginOrSignupView();
}

class _LoginOrSignupView extends State<CredentialsView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  String userEmail = "";
  String userPassword = "";
  String userName = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      
      children: <Widget>[
        Text(widget.screenTitle, style: signUpOrLogInTitleStyle),
        setSubtitleForAuthView(),
        customSpacer,
        const Text(
          emailAddress,
          style: credentialTextBoxesTitles,
        ),
        TextField(
          controller: emailController,
          onChanged: (newValue) {
            userEmail = newValue;
          },
        ),
        customSpacer,
        const Text(
          password,
          style: credentialTextBoxesTitles,
        ),
        TextField(
          controller: passwordController,
          onChanged: (newValue) {
            userPassword = newValue;
          },
          obscureText: true,
        ),
        customSpacerBig,
        TextButton(
          onPressed: () async {
            bool isValid = validateFields();
            if (isValid) {
              try {
                await authenticateUser();
                Navigator.pushNamed(context, movieListRouteName);
              } catch (e) {
                SnackBar errorSnackBar = SnackBar(
                  content: Text(e.toString()),
                );
                ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
              }
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            fixedSize: const Size.fromHeight(buttonHeight),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(buttonRadius),
              ),
            ),
          ),
          child: Text(
            widget.buttonTitle,
            style: const TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
        SizedBox(height: widget.isSignupScreen ? 50.0 : 10.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.isSignupScreen
                  ? connectWithSocialMediaString
                  : noAccountString,
              style: subheaderTextStyle,
            ),
            if (!widget.isSignupScreen)
              TextButton(
                onPressed: () => Navigator.pushNamed(context, signUpRouteName),
                child: const Text(
                  signUpString,
                  style: headerTextStyle,
                )),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton(
                Buttons.GoogleDark,
                onPressed: () {
                  AuthenticationManager().signInWithGoogle(context);
                },
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.isSignupScreen)
              const Text(
                hasAccountString,
                style: subheaderTextStyle,
              ),
            if (widget.isSignupScreen)
              TextButton(
                onPressed: () => Navigator.pushNamed(context, logInRouteName),
                child: const Text(
                  loginString,
                  style: headerTextStyle,
                )),
          ],
        ),
      ],
    );
  }

  Widget setSubtitleForAuthView() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: midSpace),
        Text(
          emailAndPasswordString,
          style: subheaderTextStyle,
        ),
      ],
    );
  }

  Future<void> authenticateUser() async {
    AuthenticationManager authenticationManager = AuthenticationManager();
    if (widget.isSignupScreen) {
      await authenticationManager.signUpUser(
          userEmail, userPassword, context, () {});
    } else {
      await authenticationManager.logInUser(
          userEmail, userPassword, context, () {});
    }
  }

  bool validateFields() {
    if (userEmail.isNotEmpty && userPassword.isNotEmpty) {
      return true;
    } else {
      SnackBar initSnackBar = const SnackBar(
        content: Text("Email and Password are mandatory."),
      );
      ScaffoldMessenger.of(context).showSnackBar(initSnackBar);
    }

    if (userEmail.isNotEmpty && userPassword.length >= 8) {
      return true;
    } else {
      SnackBar initSnackBar = const SnackBar(
        content: Text(
            "Password should have at least 8 characters and should include special characters."),
      );
      ScaffoldMessenger.of(context).showSnackBar(initSnackBar);
    }
    return false;
  }
}
