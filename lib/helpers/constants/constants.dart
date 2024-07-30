import 'package:flutter/material.dart';

//Font sizes
const double titleFontSize = 28.0;
const double logInOrSignUpFontSize = 32.0;

//Color pallete
const redColor = Color.fromARGB(179, 158, 31, 31);
const greyColor = Color.fromARGB(179, 145, 121, 121);
const appBarColor = const Color.fromARGB(173, 238, 238, 238);

//credentials navigation/validation buttons
const double buttonHeight = 50.0;
const double buttonRadius = 8.0;

//spacing
const double midSpace = 16.0;
const double paddingCredentials = 30.0;
const customSpacer = SizedBox(height: 15.0);
const customSpacerBig = SizedBox(height: 50.0);

const TextStyle headerTextStyle = TextStyle(
  fontSize: 16.0,
  color: redColor,
  fontWeight: FontWeight.normal,
);


const TextStyle subheaderTextStyle = TextStyle(
  fontSize: 16.0,
  color: greyColor,
  fontWeight: FontWeight.normal,
);

const TextStyle signUpOrLogInTitleStyle = TextStyle(
  fontSize: logInOrSignUpFontSize,
  color: redColor,
  fontWeight: FontWeight.w500,
);

const TextStyle credentialTextBoxesTitles = TextStyle(
  fontSize: 16.0,
  color: redColor,
  fontWeight: FontWeight.w500,
);
