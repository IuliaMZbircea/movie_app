import 'package:flutter/material.dart';
import 'package:movie_app/helpers/constants/constants.dart';
import '../helpers/constants/strings-en.dart';
import '../views/credentials_view.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: paddingCredentials),
            child: const CredentialsView(
              isSignupScreen: false,
              screenTitle: loginString,
              buttonTitle: loginButtonTitle,
            ),
          ),
        ),
      ),
    );
  }
}
