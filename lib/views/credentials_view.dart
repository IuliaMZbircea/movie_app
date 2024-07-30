import 'package:flutter/material.dart';
import 'package:movie_app/managers/authentication_manager.dart';
import '../helpers/constants/constants.dart';
import '../helpers/constants/routes_name.dart';
import '../helpers/constants/strings-en.dart';

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
  String userEmail = "";
  String userPassword = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          widget.screenTitle,
          style: signUpOrLogInTitleStyle
        ),
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
            backgroundColor: redColor,
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
          children: [
            const Spacer(),

            Text(
              widget.isSignupScreen
                  ? connectWithSocialMediaString
                  : noAccountString,
              style: subheaderTextStyle,
              textAlign: TextAlign.center,
            ),
            if (!widget.isSignupScreen)
              TextButton(
                onPressed: () => Navigator.pushNamed(context, signUpRouteName),
                child: const Text(
                  signUpString,
                  style: headerTextStyle,
                )
              ),
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
      await authenticationManager.signUpUser(userEmail, userPassword, context, () {});
    } else {
      await authenticationManager.logInUser(userEmail, userPassword, context, () {});
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
