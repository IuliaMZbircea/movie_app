import 'package:flutter/material.dart';
import './screens/login_screen.dart';
import './screens/movie_list_screen.dart';
import './screens/signup_screen.dart';
import './helpers/constants/routes_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: FirebaseAuth.instance.currentUser == null ? logInRouteName : movieListRouteName,
      routes: {
        logInRouteName: (context) => const LogInScreen(),
        signUpRouteName: (context) => const SignUpScreen(),
        movieListRouteName: (context) => const MovieListScreen(),
      },
    );
  }
}
