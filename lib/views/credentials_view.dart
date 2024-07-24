import 'package:flutter/material.dart';
import '../helpers/constants/constants.dart';
import '../helpers/constants/routes_name.dart';
import '../helpers/constants/strings-en.dart';

class CredentialsView extends StatefulWidget {
  final String screenTitle;
  final String buttonTitle;
  final bool isSignupScreen;
  final Color _textColor;

  CredentialsView({
    super.key,
    required this.screenTitle,
    required this.buttonTitle,
    this.isSignupScreen = false,
  }) : _textColor = isSignupScreen ? Colors.grey : Colors.black;

  @override
  _LoginOrSignupView createState() => _LoginOrSignupView();
}

class _LoginOrSignupView extends State<CredentialsView> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Log In title
        Text(
          widget.screenTitle,
          style: const TextStyle(
            fontSize: titleFontSize,
            color: Color.fromARGB(179, 42, 22, 138),
            fontWeight: FontWeight.w500,
          ),
        ),
        if (!widget.isSignupScreen) setSubtitleForLogInView(),
        const SizedBox(height: 10.0),
        const Text(
          email,
          style: TextStyle(
            fontSize: 12.0,
            color: Color.fromARGB(179, 42, 22, 138),
            fontWeight: FontWeight.w500,
          ),
        ),
        TextField(
          controller: controller,
          onChanged: (String value) {},
        ),
        const SizedBox(height: 10.0),
        const Text(
          password,
          style: TextStyle(
            fontSize: 12.0,
            color: Color.fromARGB(179, 42, 22, 138),
            fontWeight: FontWeight.w500,
          ),
        ),
        const TextField(
          obscureText: true,
        ),
        const SizedBox(height: 10.0),
        TextButton(
          onPressed: () => Navigator.pushNamed(
            context,
            movieListRouteName,
          ),
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(179, 42, 22, 138),
            fixedSize: const Size.fromHeight(buttonHeight),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(buttonRadius),
              ),
            ),
          ),
          child: Text(
            widget.buttonTitle,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: widget.isSignupScreen ? 20.0 : 8.0),
        // Don't have an account
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              widget.isSignupScreen ? connectWithSocialMediaString : noAccountString,
              style: headerTextStyle.copyWith(
                color: widget._textColor,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.end,
            ),
            if (!widget.isSignupScreen)
              TextButton(
                onPressed: () => Navigator.pushNamed(context, signUpRouteName),
                child: Text(
                  signUpString,
                  style: headerTextStyle.copyWith(color: Color.fromARGB(179, 42, 22, 138)),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget setSubtitleForLogInView() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: midSpace),
        Text(
          emailAndPasswordString,
          style: headerTextStyle,
        ),
      ],
    );
  }
}
