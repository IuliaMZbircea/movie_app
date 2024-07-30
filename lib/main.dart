import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/managers/hive_manager.dart';
import 'package:movie_app/screens/movie_details_screen.dart';
import 'package:movie_app/screens/signout_screen.dart';
import 'package:movie_app/screens/watchlist_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './screens/login_screen.dart';
import './screens/movie_list_screen.dart';
import './screens/signup_screen.dart';
import './helpers/constants/routes_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

SharedPreferences? sharedPrefs;
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await Hive.initFlutter('database');

  sharedPrefs = await SharedPreferences.getInstance();
  
  await HiveManager.instance.initHiveManager();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? logInRouteName
          : movieListRouteName,
      routes: {
        logInRouteName: (context) => const LogInScreen(),
        signUpRouteName: (context) => const SignUpScreen(),
        movieListRouteName: (context) => const MovieListScreen(),
        movieDetailsRouteName: (context) => const MovieDetailsScreen(),
        signOutRouteName: (context) => const SignOutScreen(),
        watchListRouteName: (context) => const WatchListScreen(),
      },
    );
  }
}
