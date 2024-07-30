import 'package:flutter/material.dart';
import 'package:movie_app/managers/authentication_manager.dart';
// import '../helpers/constants/strings-en.dart';
// import '../views/credentials_view.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  _MovieDetailsScreen createState() => _MovieDetailsScreen();
}

AuthenticationManager authenticationManager = AuthenticationManager();

class _MovieDetailsScreen extends State<MovieDetailsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 170, 239, 74),
    );
  }


}