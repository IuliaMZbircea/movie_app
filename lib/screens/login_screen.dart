import 'package:flutter/material.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: const CredentialsView(
              screenTitle: loginString,
              buttonTitle: loginButtonTitle,
            ),
          ),
        ),
      ),
    );
  }
}
